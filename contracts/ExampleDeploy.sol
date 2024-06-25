// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ExampleDeploy {
    
    string public myString = "Hello World";

    function updateString(string memory _newString) public payable  {
        if (msg.value == 1 ether) {
            myString = _newString;
        } else {
            // revert("Error");
            // REfund ethers
            payable(msg.sender).transfer(msg.value);
        }

    }

}