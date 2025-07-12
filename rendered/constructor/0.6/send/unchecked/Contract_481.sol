// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Contract_481 {


    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        

    }
}