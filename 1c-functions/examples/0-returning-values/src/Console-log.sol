// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol"; // Required for `console.log`

contract Contract {
    function winningNumber(string calldata secretMessage) external view returns(uint) {
        console.log("The secret message is: %s", secretMessage);
        return 794;
    }
}
