// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ExampleUInt {
    int public myInt = -10; //-2^(255) to 2^(255)-1

    uint public myUint = 10; // uint == uint256

    uint256 public myUint256; //0 to 2^(256)-1

    uint8 public myUint8 = 250;

    function setMyUint256(uint _myUint256) public  {
        myUint256 = _myUint256;
    }

    function decrementUint() public  {
        myUint256 --;
    }

    function incrementUint8() public  {
        unchecked {
            myUint8 ++;
        }
    }

    function incrementInt() public  {
        myInt ++;
    }
}