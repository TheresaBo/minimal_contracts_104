// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_120 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}