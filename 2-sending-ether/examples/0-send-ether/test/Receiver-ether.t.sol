// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Receiver-ether.sol";

contract ContractTest is Test {
    Contract public myContract;
    address msgSender = address(3);

    function setUp() public {
        hoax(msgSender);
        myContract = new Contract();
    }

    function testSendEther() public {
        address contractAddr = address(myContract);

        // send 2 ether without any calldata
        (bool success, ) = contractAddr.call{ value: 2 ether }("");
        require(success, "Ether transfer failed.");
        
        assertEq(contractAddr.balance, 2 ether);
    }
}
