// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Contract_564 {

    uint256 public publicVar;

    constructor(address recipient) public payable {
        bool success = recipient.send(msg.value);
        
        if (success) {} else { revert("Error"); }

        publicVar = 42;
    }
}