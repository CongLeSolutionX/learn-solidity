// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint8 a = 255; // 0 -> 255
    uint256 b = type(uint).max; // alias: uint

    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias: int256
    
    bool myCondition = true; // default value is false

    enum Choice {
        Up,
        Down,
        Left,
        Right
    }

    Choice choice = Choice.Up;


    // This constructor will cause an error with reason of
    // arithmetic underflow or overflow
    // when execute the test `forge test` on command line.
    constructor() {
       unchecked { // unchecked block will bring the overflow variable(if happen) back to zero.
         //a += 1;
         //a += 1;
         //a += 1; // The log will show 2 instead of 258 cause we reseted to zero when a hit 256 due to using the unchecked block.
        console.logBytes32(bytes32(b));  // return hex value of 2^256 - 1
        console.logInt(type(int256).min);
        console.logInt(type(int256).max);

        console.logInt(type(int8).min);
        console.logInt(type(int8).max);
       }
        
       //console.log("a: %s", a); // use `forge test -vv` to show log on the console.
       //console.log("b: %s", b);

       if(myCondition) {
              console.log("myCondition is true");
         } else {
              console.log("myCondition is false");
       }

       if (choice == Choice.Up) {
           console.log("choice is Up");
       } else if (choice == Choice.Down) {
           console.log("choice is Down");
       } else if (choice == Choice.Left) {
           console.log("choice is Left");
       } else if (choice == Choice.Right) {
           console.log("choice is Right");
       } else {
           console.log("choice is unknown");
       }

    }

    // constructor(Choice choice) {
    //    if (choice == Choice.Up) {
    //        console.log("choice is Up");
    //    } else if (choice == Choice.Down) {
    //        console.log("choice is Down");
    //    } else if (choice == Choice.Left) {
    //        console.log("choice is Left");
    //    } else if (choice == Choice.Right) {
    //        console.log("choice is Right");
    //    } else {
    //        console.log("choice is unknown");
    //    }
    // }
}
