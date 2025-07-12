// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_173 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

    }
}