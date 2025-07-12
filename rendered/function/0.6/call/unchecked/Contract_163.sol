// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_163 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

    }
}