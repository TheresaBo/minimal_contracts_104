// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Contract_424 {


    constructor(address payable recipient) public payable {
        bool success = recipient.send(msg.value);
        
        if (success) {} else { revert("Error"); }

    }
}