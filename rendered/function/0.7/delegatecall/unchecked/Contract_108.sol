// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_108 {


    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

    }
}