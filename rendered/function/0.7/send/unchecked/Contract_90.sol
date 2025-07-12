// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Contract_90 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address payable recipient) public payable  {
        recipient.send(msg.value);
        

        publicVar = 42;
    }
}