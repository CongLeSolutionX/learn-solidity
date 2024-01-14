// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    
function double(uint x) external pure returns(uint doubledValue) {
    doubledValue = 2 * x;
}

function double(uint x, uint y) external pure returns(uint doubled1stValue, uint doubled2ndValue) {
    doubled1stValue = 2 * x;
    doubled2ndValue = 2 * y;
}

}