// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ExampleBoolean {
    
    bool public myBoolean;

    function setMyBoolean(bool _myBoolean) public {
        myBoolean = _myBoolean;
    }

}