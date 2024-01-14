// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    A public a;
    B public b;

    function setUp() public {
        b = new B(); // Deploy B
        a = new A{ value: 1 ether }(address(b)); // Deploy A with 1 ether and B's address
    }

    function testSendEther() public { // Test that A sends half of its balance to B
        assertEq(address(a).balance, 1 ether); // a's balance is 1 ether
        assertEq(address(b).balance, 0 ether); // b's balance is 0 ether
        a.payHalf();
        assertEq(address(a).balance, 0.5 ether); // a's balance is 0.5 ether
        assertEq(address(b).balance, 0.5 ether); // b's balance is 0.5 ether
        a.payHalf();
        assertEq(address(a).balance, 0.25 ether); // a's balance is 0.25 ether
        assertEq(address(b).balance, 0.75 ether); // b's balance is 0.75 ether
        a.payHalf();
        assertEq(address(a).balance, 0.125 ether); // a's balance is 0.125 ether
        assertEq(address(b).balance, 0.875 ether); // b's balance is 0.875 ether
    }
}
