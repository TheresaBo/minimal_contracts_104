// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_39 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        return success;

    }
}