// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_236 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

    }
}