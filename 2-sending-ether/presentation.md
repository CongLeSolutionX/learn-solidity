---
marp: true
---

# Message Calls

- Send value and `calldata` to contracts
- The first message call is the beginning of the transaction (EOA -> contract)
- Each subsequent message call is part of the same transaction (contract -> contract)
- The transaction and any state changes only complete when the initial function call finishes execution

---

![message-call](imgs/message-call.png)

---

## Message Call Breakdown

- As we saw message calls can contain `gas`, `value` and `calldata`
- These message values become available as globals in solidity:

  - `msg.sender` - who made the last message call
  - `msg.value` - amount in wei sent
  - `msg.data` - calldata
  - `msg.sig` - the function identifier

---

## How Do EOAs and Contracts Call Other Contracts?

- They use the `address` of the contract they want to communicate with
- This is a data type in solidity that is 20 bytes long
- The `msg.sender` from the previous slide is an address

---

## What does that look like?

```js
contract X {
  address deployer;
  address otherContract;

  constructor(address _otherContract) {
    deployer = msg.sender;
    otherContract = _otherContract;
  }
}
```

---

## Can any method call receive ether?

Only `payable` methods can:

```js
contract X {
  receive() external payable {
    // no calldata necessary here
    // just send a value on the message call
  }

  function pay() external payable {
    // in this case, we target pay with a value
  }
}
```

---

## What does sending value look like?

The `.call` syntax is `.call{ gas, value }(calldata)`

```js
contract X {
  address otherContract;

  constructor(address _otherContract) payable {
    otherContract = _otherContract;
    _otherContract.call{ value: msg.value }("");
  }
}
```

---

## Handle the success

The solidity compiler will warn you if you don't handle `success`

```js
contract X {
  address otherContract;

  constructor(address _otherContract) payable {
    otherContract = _otherContract;
    (bool success, ) = _otherContract.call{ value: msg.value }("");
    require(success);
  }
}
```


---

## Accounts 📫

In Ethereum, accounts are often distinguished into two types: **Externally Owned Accounts** and **Contract Accounts**. The differences between these accounts is largely conceptual as the EVM essentially treats them the same!

Every account on the EVM has a public address and a balance. Contract accounts will also store their bytecode as well as their internal storage data.

When making a call from an EOA to a Contract Account it's important to know things like who is making the call, how much ether they are sending and the function they are intending to invoke with which arguments.

The Solidity language handles the wiring up of the transaction data to the function we have defined on the contract. The language also gives us access to the transaction parameters through globals like `msg.sender` and `msg.value`.

By providing these utilities for working with accounts we can easily define roles, permissions and track token balances in contracts.

---

## Ethereum Messages ✉️

If an Externally Owned Account (EOA) wants to interact with the Ethereum Network, it broadcasts a transaction. Included in this transaction is data, designed to instruct the Ethereum Virtual Machine (EVM).

This data, commonly known as calldata, specifies actions for the EVM to execute and identifies a target contract account. The target may, in turn, initiate calls to other contract accounts. Each of these calls is considered a message call and carries information like the sender's address, the targeted function signature, and the amount of wei being sent.

In Solidity we have access to these message through global variables:

* **msg.data** (`bytes`) - the complete calldata
* **msg.sender** (`address`) - the address sending the message
* **msg.sig** (`bytes4`) - the targeted function signature
* **msg.value** (`uint`) - the amount of wei sent

---

## Receive Function

In the latest versions of Solidity, contracts **cannot receive ether** by default.

In order to receive ether, a contract must specify a **payable** function. This is another keyword which affects the function's mutability similar to **view** and **pure**.

Let's see a payable function in action:

```js
import "forge-std/console.sol";

contract Contract {
  function pay() public payable {
  console.log( msg.value ); // 100000
  }
}
```

Here the `msg.value` represents the amount of ether, in Wei, sent to the pay function. By simply adding the `payable` keyword to this function, it gains the ability to accept ether. Once received, the ether is automatically added to the contract's balance—no additional steps required!

> 🚧 *What if someone tried to send a payment to a nonpayable function?* The transaction will **fail**, sending the ether back to the sender.

In the case above we used the method `pay` as a `payable` function. This means we have to call this function in order to send the ether to the contract. What if we wanted to send it directly without specifying a method?

Turns out, we can do *that* too:

```js
import "forge-std/console.sol";

contract Contract {
    receive() external payable {
      console.log(msg.value); // 100000
    }
}
```

You'll notice that `receive` does not use the `function` keyword. This is because it is a *special* function (like `constructor`). It is the function that runs when a contract is sent ether without any **calldata**, or when the calldata does not match a function signature on the contract.

The receive function must be **external**, **payable**, it cannot receive arguments and it cannot return anything.

> 🔍 Another option to receive ether without specifying a function signature on a contract is to use a **payable fallback function**.


---

## External Visibility

We've discussed **public** and **private** visibilities. What is **external** and why is it necessary for the `receive` function?

An External function can only be invoked through a message call from another contract or an EOA. In contrast, an internal function call accesses variables directly from the contract's current execution context, avoiding the need for external inputs like calldata.

The `receive` function requires external visibility as it's designed to receive ether through a message call. Its primary purpose is to offer developers a function body where they can define logic for handling incoming ether to a contract.

Quite similarly, the fallback function also requires external visibility. What is the fallback function, you ask? Read on, my friend! 👇

---

## Fallback Function

The fallback function is the function you're **calling** *when no other function comes to the phone*! ☎️

All joking aside, it is really quite that simple.

When a smart contract receives a call with calldata that doesn't match any of its function signatures, or if the calldata is empty, the fallback function is triggered. This can occur for various reasons, such as a typo in the function name, an incorrect argument type, or even for intentionally storing the calldata for future use like in a subsequent message call. If the contract doesn't know how to respond to the data sent to it, it will invoke the fallback function.

The fallback function is also a *special* function and it looks like this:

 ```js
contract Contract {
    fallback() external {
        // do somethin'
    }
}
```

☝️ Just like the `receive` function, the `fallback` function must be **external**, it cannot accept any arguments or return any values. Unlike the `receive` function, `fallback` does not need to be `payable`.

With a **payable** fallback function you can essentially *replace* the `receive` function, however, for the most part, it's not advisible. The two functions serve different purposes!

When you create a `receive` function it's clear you're accepting ether on transactions without data.

When you create a `fallback` function it's generally for the purposes of handling function signature mistakes.