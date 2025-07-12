// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Contract_397 {

    uint256 public publicVar;

    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        

        publicVar = 42;
    }
}