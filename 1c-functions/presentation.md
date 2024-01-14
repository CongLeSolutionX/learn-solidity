---
marp: true
---

## FUNctions 🕺

You can't spell functions without **fun**! 😆 And you must know the keywords 🔑

A function can have 2 type of modifiers: modifier for visibility + modifier for mutability.

Modifiers for visibility are: `private`, `internal`, `public`, `external`.
Modifiers for mutability: `pure`, `view`, `payable`.

```js
contract Example {
  function privatePureFunction() private pure {
    // private: call me within this contract
    // pure: I cannot read/write to storage
  }
  function internalViewFunction() internal view {
    // internal: call me within this contract (+ inheritance!)
    // view: I can read from storage, not write
  }
  function publicPayableFunction() public payable {
    // public: call me inside and outside this contract
    // payable: send me some ether!
  }
  function externalFunction() external {
    // external: call me from outside this contract
  }
}
```

---

## Returning values

```js
contract Example {
  uint public sum;

  constructor(uint x, uint y) {
    sum = add(x, y);
  }

  function add(uint x, uint y) private pure returns(uint) {
    return x + y;
  }
}
```
