// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    address b; // b's address

    constructor(address _b) payable {
        b = _b;

        console.log("a deployed at address:", address(this));
        console.log("a deployed with ether balance of", address(this).balance);
        
        console.log("b deployed at address:", b);
        console.log("b deployed with ether balance of", address(b).balance); // 0 ether
    
        console.log(msg.value); // 1 ether
    }

    function payHalf() external {
        uint256 balance = address(this).balance;            // get the balance of this contract
        (bool success,) = b.call{value: balance / 2}("");   // send half of the balance to b
        require(success);                                   // if the send fails, throw an error
    }
}

contract B {
    receive() external payable {} // allow contract B to receive ether
}
