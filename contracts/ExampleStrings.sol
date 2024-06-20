// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ExampleString {
    
    // No strings manipulations and comparissions
    // String are high cost in gas terms
    //Recomendation: Use events to register(log) into web
    //Recomendation: USe bytes

    string public myString = "Hello world";
    bytes public  myBytes = "Hello world";


    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function compareTwoStrings(string memory _myString) public view returns (bool){
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    // Function to get bytes length
    function getBytesLength() public view returns (uint) {
        return myBytes.length;
    }

}