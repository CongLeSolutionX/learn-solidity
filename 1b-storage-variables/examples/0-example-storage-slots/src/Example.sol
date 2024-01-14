// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 a = 100; // storage slot - 0x0
    uint256 b;       // storage slot - 0x1
    bool c;          // storage slot - 0x2

    constructor() {
        // SSTORE - store to some storage location
        // SLOAD - read from some storage location
        // bool x;
        // assembly {
        //     x := sload(0x2)
        // }
        //console.log(x);

        uint256 x;
        assembly {
            x := sload(0x0)
        }
        console.log("x: %s", x); // x should return the same value as a at location 0x0

        console.log("a: %s", a);
    }
}
