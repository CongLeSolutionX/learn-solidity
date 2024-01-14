// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    Example public example;
    uint256 firstValue;
    uint256 secondValue;
    bool isUsingSum;
    bool isUsingProduct;
    
    function setUp() public {
        // Initialization if needed
    }

    function testSum() public {
        // Assuming we only want to so sum with initial values
        firstValue = 4;
        secondValue = 4;
        isUsingSum = true;
        isUsingProduct = false;

        example = new Example(firstValue, secondValue, isUsingSum, isUsingProduct);
        assertEq(example.sum(), 8);
    }

    function testProduct() public {
        // Assuming we only want to so product with initial values
        firstValue = 4;
        secondValue = 4;
        isUsingSum = false;
        isUsingProduct = true;

        example = new Example(firstValue, secondValue, isUsingSum, isUsingProduct);
        assertEq(example.product(), 16);
    }

    function testSumAndProduct() public {
        // Assuming we want to test both calculations with different initial values
        firstValue = 2;
        secondValue = 3;
        isUsingSum = false;
        isUsingProduct = false;
        
        example = new Example(firstValue, secondValue, isUsingSum, isUsingProduct);
        assertEq(example.sum(), 5);
        assertEq(example.product(), 6);
    }
}
