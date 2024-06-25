// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Sample {
    
    uint public lastValueSent;
    string public lastFunctionCalled;

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
     }

    // Default function called when no other function with bytecode has defined
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
     }
}