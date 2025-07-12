// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_568 {

    
    constructor(address callAddress) public {
        bool success = callAddress.call(bytes4(keccak256("foo()")));
        
        require(success);

    }
}