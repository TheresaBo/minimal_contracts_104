// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Contract_213 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address payable recipient) public payable  {
        bool success = recipient.send(msg.value);
        
        require(success);

        publicVar = 42;
    }
}