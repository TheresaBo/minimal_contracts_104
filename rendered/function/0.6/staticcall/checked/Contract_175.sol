// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_175 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        return success;

    }
}