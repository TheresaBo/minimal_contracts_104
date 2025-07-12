// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Contract_249 {


    constructor() public {

    }

    function test(address payable recipient) public payable  {
        bool success = recipient.send(msg.value);
        
        if (success) {} else { revert("Error"); }

    }
}