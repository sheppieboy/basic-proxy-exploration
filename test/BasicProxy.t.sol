// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

import "../src/BasicProxy.sol";
import "forge-std/Test.sol";

contract BasicProxyTest is Test {
    Logic1 public logic1;
    Logic2 public logic2;
    BasicProxy public proxy;

    function setUp() public {
        logic1 = new Logic1();
        logic2 = new Logic2();

        proxy = new BasicProxy();
    }

    function test_changeX() public {
        proxy.changeImplementation(address(logic1));
        proxy.changeX(52);
        uint256 x = logic1.x();
        assertEq(x, 52);
    }
}
