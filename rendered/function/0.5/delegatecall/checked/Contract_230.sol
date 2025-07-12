// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_230 {


    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        require(success);

    }
}