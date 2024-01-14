// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 public sum;
    uint256 public product;

    // The constructor function is invoked only once
    // during the contract's deployment and never again.
    // It is generally used for setting up initial contract values.
    constructor(uint256 x, uint256 y, bool useSum, bool useProduct) {
        if (useSum) {
            sum = add(x,y);
        } else if (useProduct) {
            product = multiply(x,y);
        } else {
            (sum, product) = math(x, y);
        }
    }

    function math(uint256 x, uint256 y) private pure returns (uint256, uint256) {
        return (x + y, x * y);
    }
    function add(uint256 x, uint256 y) private pure returns (uint256) {
        return x + y;
    }

    function multiply(uint256 x, uint256 y) private pure returns (uint256) {
        return x * y;
    }
}
