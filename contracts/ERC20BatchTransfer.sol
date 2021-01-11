// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import 'openzeppelin-solidity/contracts/token/ERC20/IERC20.sol';
import "openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract ERC20BatchTransfer is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    function transfer(IERC20 _token, address[] memory _tos, uint256[] memory _values, uint256 _total) public returns(bool) {
        require(_tos.length == _values.length);
        uint256 sum = 0;
        for (uint i = 0; i < _tos.length; i++) {
            address to = _tos[i];
            uint value = _values[i];
            sum = sum.add(value);
            _token.transferFrom(msg.sender, to, value);
        }
        require(sum == _total);
        return true;
    }

    function ownerTransfer(IERC20 _token, address[] memory _tos, uint256[] memory _values, uint256 _total) public onlyOwner returns(bool)  {
        require(_tos.length == _values.length);
        uint256 sum = 0;
        for (uint i = 0; i < _tos.length; i++) {
            address to = _tos[i];
            uint value = _values[i];
            sum = sum.add(value);
            _token.transfer(to, value);
        }
        require(sum == _total);
        return true;
    }
}