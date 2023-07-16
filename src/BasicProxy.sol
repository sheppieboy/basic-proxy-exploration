// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//EOA -> Proxy -> Logic1
//            -> Can change to logic2

contract BasicProxy {
    address implementation;

    function changeImplementation(address _implementation) external {
        implementation = _implementation;
    }

    function changeX(uint256 _x) public {
        Logic1(implementation).changeX(_x);
    }
}

contract Logic1 {
    uint256 public x = 0;

    function changeX(uint256 _x) public {
        x = _x;
    }
}

contract Logic2 {
    uint256 public x = 0;

    function changeX(uint256 _x) public {
        x = _x;
    }
}
