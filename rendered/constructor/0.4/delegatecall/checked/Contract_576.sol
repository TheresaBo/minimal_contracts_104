// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_576 {

    
    constructor(address callAddress) public {
        bool success = callAddress.delegatecall(bytes4(keccak256("foo()")));
        
        require(success);

    }
}