// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    address public owner;
    address public charityAddress;

    constructor(address _charity) {
        owner = msg.sender;
        charityAddress = _charity;
    }

    receive() external payable {
         // Log the received value for debugging purposes (works with forge-std or Hardhat)
        console.log(msg.value);
    }

    function tip() public payable {
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success, "Transfer failed.");
    }
    
    function donate() public payable {
        // Transfer all remaining funds in the contract to the charity address
        uint256 balance = address(this).balance;
        (bool success, ) = charityAddress.call{ value: balance }("");
        require(success, "Donation transfer failed.");
    }
}