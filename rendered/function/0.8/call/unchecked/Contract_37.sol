// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_37 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

    }
}