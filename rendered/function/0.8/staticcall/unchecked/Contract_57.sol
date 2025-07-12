// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_57 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}