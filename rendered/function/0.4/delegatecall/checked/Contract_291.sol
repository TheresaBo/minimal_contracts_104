// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_291 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        bool success = callAddress.delegatecall(bytes4(keccak256("foo()")));
        
        return success;

    }
}