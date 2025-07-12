// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Contract_426 {


    constructor(address payable recipient) public payable {
        recipient.send(msg.value);
        

    }
}