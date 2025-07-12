// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_218 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        return success;

    }
}