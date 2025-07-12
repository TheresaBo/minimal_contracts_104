// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Contract_121 {


    constructor() public {

    }

    function test(address payable recipient) public payable returns (bool) {
        bool success = recipient.send(msg.value);
        
        return success;

    }
}