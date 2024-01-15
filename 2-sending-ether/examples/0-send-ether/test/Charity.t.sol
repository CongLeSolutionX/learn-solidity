// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Charity.sol";

contract ContractTest is Test {
    Contract public myContract;
    address msgSender = address(3);
    address charity = address(4);

    function setUp() public {
        vm.prank(msgSender);
        myContract = new Contract(charity);
        (bool success, ) = address(myContract).call{ value: 4 ether }("");
        require(success, "Ether transfer failed.");
    }

    function testSend() public {
        assertEq(address(myContract).balance, 4 ether);
    }

    function cleartestDonate() public {
        myContract.donate();
        assertEq(charity.balance, 4 ether);
    }
}
