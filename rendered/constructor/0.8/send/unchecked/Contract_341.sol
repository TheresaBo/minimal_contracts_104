// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Contract_341 {

    uint256 public publicVar;

    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        

        publicVar = 42;
    }
}