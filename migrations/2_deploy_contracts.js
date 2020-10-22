const DrepBatchTransfer = artifacts.require("DrepBatchTransfer");

module.exports = function (deployer) {
  deployer.deploy(DrepBatchTransfer);
};