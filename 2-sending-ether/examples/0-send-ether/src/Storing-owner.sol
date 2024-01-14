// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    // An address on the EVM is a 160 bits long, or a 40 character, hexadecimal string:
    address public owner;

    constructor() {
        owner = msg.sender;
        console.log("owner address is", owner);
        // or we can use this syntax to print out the owner address
        console.log(msg.sender);
    }
}