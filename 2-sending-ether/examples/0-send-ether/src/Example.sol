// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    address b; // b's address

    constructor(address _b) payable {
        b = _b;

        console.log("A deployed at", address(this));
        console.log("A deployed with balance", address(this).balance);
        
        console.log("b deployed at", b);
        console.log("b balance", address(b).balance);
    
        console.log(msg.value);
    }

    function payHalf() external {
        uint256 balance = address(this).balance;            // get the balance of this contract
        (bool success,) = b.call{value: balance / 2}("");   // send half of the balance to b
        require(success);                                   // if the send fails, throw an error
    }
}

contract B {
    receive() external payable {}
}
