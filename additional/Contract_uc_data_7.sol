pragma solidity 0.7.6;

contract Contract_uc_data_7 {

    function test(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));    
    }
}