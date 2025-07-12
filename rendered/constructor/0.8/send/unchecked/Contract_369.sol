// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Contract_369 {


    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        

    }
}