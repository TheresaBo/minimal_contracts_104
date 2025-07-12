// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_293 {


    constructor() public {

    }

    function test(address callAddress) public {
        bool success = callAddress.delegatecall(bytes4(keccak256("foo()")));
        
        require(success);

    }
}