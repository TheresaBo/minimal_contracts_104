// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Contract_125 {


    constructor() public {

    }

    function test(address payable recipient) public payable  {
        recipient.send(msg.value);
        

    }
}