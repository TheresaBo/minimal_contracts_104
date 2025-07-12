// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Contract_453 {

    uint256 public publicVar;

    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        

        publicVar = 42;
    }
}