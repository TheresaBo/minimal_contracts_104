// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_49 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        return success;

    }
}