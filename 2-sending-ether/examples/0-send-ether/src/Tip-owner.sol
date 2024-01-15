// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable {
        console.log(msg.value);
    }

    function tip() public payable {
        (bool success, ) = owner.call{ value: msg.value }("");  // Send ether to the owner of the contract
        require(success, "Transfer failed.");                   // Revert the transaction if the transfer failed
    }
}