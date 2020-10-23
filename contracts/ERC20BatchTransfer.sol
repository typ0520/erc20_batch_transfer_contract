// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import 'openzeppelin-solidity/contracts/token/ERC20/IERC20.sol';

contract ERC20BatchTransfer {
    function transfer(IERC20 _token, address[] memory _tos, uint[] memory _values, uint _total) public returns(bool) {
        require(_tos.length == _values.length);
        uint sum = 0;
        for (uint i = 0; i < _tos.length; i++) {
            address to = _tos[i];
            uint value = _values[i];
            sum = sum + value;
            _token.transferFrom(msg.sender, to, value);
        }
        require(sum == _total);
        return true;
    }
}