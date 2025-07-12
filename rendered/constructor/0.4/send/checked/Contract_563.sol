// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Contract_563 {

    uint256 public publicVar;

    constructor(address recipient) public payable {
        bool success = recipient.send(msg.value);
        
        require(success);

        publicVar = 42;
    }
}