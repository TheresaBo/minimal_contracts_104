// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Contract_594 {


    constructor(address recipient) public payable {
        recipient.send(msg.value);
        

    }
}