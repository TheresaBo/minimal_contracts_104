// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_167 {


    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        require(success);

    }
}