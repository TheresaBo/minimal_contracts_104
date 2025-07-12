// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Contract_185 {


    constructor() public {

    }

    function test(address payable recipient) public payable  {
        bool success = recipient.send(msg.value);
        
        require(success);

    }
}