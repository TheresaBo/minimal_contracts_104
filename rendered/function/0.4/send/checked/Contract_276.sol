// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Contract_276 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address recipient) public payable  {
        bool success = recipient.send(msg.value);
        
        require(success);

        publicVar = 42;
    }
}