// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Contract_591 {


    constructor(address recipient) public payable {
        bool success = recipient.send(msg.value);
        
        require(success);

    }
}