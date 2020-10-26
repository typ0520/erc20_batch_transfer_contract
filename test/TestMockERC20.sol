// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MockERC20.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract TestMockERC20 {
  function testInitialBalanceUsingDeployedContract() public {
    MockERC20 token = MockERC20(DeployedAddresses.MockERC20());
    uint expected = 10000000000000000000000000000;
    Assert.equal(token.balanceOf(tx.origin), expected, "Owner should have 10000 MockERC20 initially");
  }
}