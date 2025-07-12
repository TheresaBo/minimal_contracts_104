// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Contract_367 {


    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        
        require(success);

    }
}