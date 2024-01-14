// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Console-log.sol";
import "../src/Secret.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract();
    }

    function testWin() public {
        assertEq(myContract.winningNumber(Secret.message), Secret.win);
    }
}