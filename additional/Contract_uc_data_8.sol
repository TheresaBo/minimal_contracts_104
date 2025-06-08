pragma solidity 0.8.29;

contract Contract_uc_data_8 {

    function test(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));    
    }
}