// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Contract} from "../src/Contract.sol";

contract CounterTest is Test {
    
    Contract public token;
    address user = address(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD);

    function setUp() public {
        token = new Contract(); 
    }

    function test_Increment() public {
        token.mint(address(this), 100);
        assertEq(token.balanceOf(address(this)), 100);

        token.mint(user, 100);
        assertEq(token.balanceOf(user), 100);
    }

    function test_Transfer() public {
        token.mint(address(this), 100);
        token.transfer(user, 100);
        assertEq(token.balanceOf(user), 100);
        assertEq(token.balanceOf(address(this)), 0);
    }

    function test_Approve() public {
        token.mint(address(this), 100);
        token.approve(user, 100);
        uint256 amount = token.allowance(address(this), user);
        assertEq(amount, 100);

        vm.prank(user); 
        token.transferFrom(address(this), user, 100);

        assertEq(token.balanceOf(address(this)), 0);
        assertEq(token.balanceOf(user), 100);
    }
}
