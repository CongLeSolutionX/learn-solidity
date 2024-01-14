// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    Example public example;

    function setUp() public {
    }

    function testSum() public {
        example = new Example(4, 4, true, false);
        assertEq(example.sum(), 8);
    }

    function testProduct() public {
        example = new Example(4, 4, false, true);
        assertEq(example.product(), 16);
    }

    function testSumAndProduct() public {
        // Assuming we want to test both calculations with different initial values
        example = new Example(2, 3, false, false);
        assertEq(example.sum(), 5);
        assertEq(example.product(), 6);
    }
}
