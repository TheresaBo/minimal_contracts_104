// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Contract_58 {


    constructor() public {

    }

    function test(address payable recipient) public payable returns (bool) {
        bool success = recipient.send(msg.value);
        
        return success;

    }
}