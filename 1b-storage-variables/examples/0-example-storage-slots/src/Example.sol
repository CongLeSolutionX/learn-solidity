// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 a = 100;                  // storage slot - 0x0
    uint256 b = type(uint256).max;    // storage slot - 0x1
    bool c;                           // storage slot - 0x2

    constructor() {
        // SSTORE - store to some storage location
        // SLOAD - read from some storage location
        uint256 x;
        bytes32 y;

        bytes32 uint256HexFormMaxValue;
        uint256 uint256DecimalFormMaxValue;
        assembly {
            x := sload(0x0)
            y := sload(0x0)
            uint256HexFormMaxValue := sload(0x1)
            uint256DecimalFormMaxValue := sload(0x1)
        }
        console.log("Decimal value of x at 0x0: %s", x); // x should return the same value as a at location 0x0
        console.logBytes32(y); // y should return the value of a at location 0x0 in hex format
        console.log("a: %s", a);

        console.logBytes32(uint256HexFormMaxValue); // return hex value of 2^256 - 1
        console.log("uint256DecimalFormMaxValue: %s", uint256DecimalFormMaxValue); // return decimal value of 2^256 - 1
    }
}
