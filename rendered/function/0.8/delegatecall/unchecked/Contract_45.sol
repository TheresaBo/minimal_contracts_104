// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_45 {


    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

    }
}