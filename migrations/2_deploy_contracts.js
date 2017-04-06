var PathsDB = artifacts.require("./PathsDB.sol");
var PathsController = artifacts.require("./PathsController.sol");
var PermissionsDB = artifacts.require("./PermissionsDB.sol");
var PermissionsController = artifacts.require("./PermissionsController.sol");
var Doug = artifacts.require("./Doug.sol");

module.exports = function(deployer) {
  deployer.deploy(PathsDB);
  deployer.deploy(PathsController);
  deployer.deploy(PermissionsDB);
  deployer.deploy(PermissionsController);
  deployer.deploy(Doug);
};
