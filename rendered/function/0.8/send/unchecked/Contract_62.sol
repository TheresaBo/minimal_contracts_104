// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Contract_62 {


    constructor() public {

    }

    function test(address payable recipient) public payable  {
        recipient.send(msg.value);
        

    }
}