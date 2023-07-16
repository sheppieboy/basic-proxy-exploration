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

    function test_changeXInLogic1() public {
        proxy.changeImplementation(address(logic1));
        proxy.changeX(52);
        uint256 x = logic1.x();
        assertEq(x, 52);
    }

    function test_changeXInLogic1And2() public {
        proxy.changeImplementation(address(logic1));
        proxy.changeX(52);
        uint256 x1 = logic1.x();

        proxy.changeImplementation(address(logic2));
        proxy.changeX(45);
        uint256 x2 = logic2.x();

        assertEq(x1, 52);
        assertEq(x2, 45);
    }
}
