// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Contract_310 {


    constructor() public {

    }

    function test(address recipient) public payable returns (bool) {
        bool success = recipient.send(msg.value);
        
        return success;

    }
}