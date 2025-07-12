// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Contract_535 {


    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        
        require(success);

    }
}