// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';

contract MockERC20 is ERC20 {
    constructor() public ERC20('TONG', 'TONG') {
        _mint(msg.sender, 10000000000000000000000000000);
    }
}