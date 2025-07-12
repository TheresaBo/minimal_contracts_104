pragma solidity 0.7.6;

contract Contract_c_data_7 {

    function test(address callAddress) public {
        (bool success, bytes memory data) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        require(success);    
    }
}