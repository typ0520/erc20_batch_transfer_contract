const ERC20BatchTransfer = artifacts.require("ERC20BatchTransfer");
const MockERC20 = artifacts.require("MockERC20");

module.exports = function (deployer) {
  deployer.deploy(ERC20BatchTransfer);

  //if (deployer.network !== 'mainnet') {
    deployer.deploy(MockERC20);
  //}
};