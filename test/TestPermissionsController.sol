pragma solidity ^0.4.8;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PermissionsController.sol";

contract TestPermissionsController {
  PermissionsController permissionsController;
  address testAddress1;

  function beforeEach() {
    permissionsController = PermissionsController(new PermissionsController());
    testAddress1 = 0x16f221f434322a9b639df421af8fbb66d4404fd4;
  }

  function testPermissionsControllerIsInitializedWithAnOwner() {
    Assert.equal(permissionsController.owner(), address(this), "PermissionsController isn't initialized with an owner.");
  }

  function testPermissionsControllerCanSetPermissions(){
    Assert.equal(permissionsController.setPermission(testAddress1, 1), true,"PermissionsController cannot set permissions.");
  }

  function testPermissionsControllerCanGetPermissions(){
    permissionsController.setPermission(testAddress1, 2);
    Assert.equal(permissionsController.getPermission(testAddress1), 2, "PermissionsController cannot get permissions.");
  }

}
