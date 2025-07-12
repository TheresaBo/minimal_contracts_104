// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_102 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        return success;

    }
}