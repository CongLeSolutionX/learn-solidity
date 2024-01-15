// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    address public owner; // The owner of the contract

    constructor() {
        owner = msg.sender; // msg.sender is the address that is calling the function
    }

    // receive() is a special function that is executed when the contract receives ether.
    // It is executed when the contract receives ether without any calldata.
    receive() external payable {
        console.log(msg.value);
    }
}