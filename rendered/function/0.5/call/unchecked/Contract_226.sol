// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_226 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

    }
}