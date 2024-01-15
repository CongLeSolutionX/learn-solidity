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

        // selfDestuct is deprecated in Solidity 0.8.0
        // Selfdestruct the contract and send all remaining funds to the charity address
        //selfdestruct(payable(charityAddress));

        
    }
}