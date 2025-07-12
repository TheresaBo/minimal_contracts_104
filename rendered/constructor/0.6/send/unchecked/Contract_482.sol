// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Contract_482 {


    constructor(address payable recipient) public payable {
        recipient.send(msg.value);
        

    }
}