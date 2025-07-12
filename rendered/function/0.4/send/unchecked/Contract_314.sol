// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Contract_314 {


    constructor() public {

    }

    function test(address recipient) public payable  {
        recipient.send(msg.value);
        

    }
}