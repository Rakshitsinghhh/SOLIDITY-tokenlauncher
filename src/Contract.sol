// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

// import "forge-std/Script.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Contract is ERC20{

    constructor() ERC20("rakshit","rak"){
    }

    function mint(address user,uint amount) public{
        _mint(user,amount);
    }

 }
