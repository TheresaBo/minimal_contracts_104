// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_303 {


    constructor() public {

    }

    function test(address callAddress) public {
        bool success = callAddress.callcode(bytes4(keccak256("foo()")));
        
        require(success);

    }
}