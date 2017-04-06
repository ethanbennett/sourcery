var PathsDB = artifacts.require("./PathsDB.sol");
var PathsController = artifacts.require("./PathsController.sol");

module.exports = function(deployer) {
  deployer.deploy(PathsDB);
  deployer.deploy(PathsController);
};
