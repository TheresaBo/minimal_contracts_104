// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Contract_247 {


    constructor() public {

    }

    function test(address payable recipient) public payable returns (bool) {
        bool success = recipient.send(msg.value);
        
        return success;

    }
}