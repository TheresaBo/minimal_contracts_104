// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Contract_187 {


    constructor() public {

    }

    function test(address payable recipient) public payable  {
        bool success = recipient.send(msg.value);
        

    }
}