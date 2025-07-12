// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_29 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        return success;

    }
}