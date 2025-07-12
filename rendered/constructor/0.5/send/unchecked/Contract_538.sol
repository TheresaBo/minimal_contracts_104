// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Contract_538 {


    constructor(address payable recipient) public payable {
        recipient.send(msg.value);
        

    }
}