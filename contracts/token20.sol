 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract token is ERC20{
    constructor(uint initialSupply)ERC20("AStoken","AS"){
        _mint(msg.sender,initialSupply);
    }

}
