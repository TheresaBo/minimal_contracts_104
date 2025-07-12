// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Contract_216 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address payable recipient) public payable  {
        recipient.send(msg.value);
        

        publicVar = 42;
    }
}