pragma solidity ^0.4.2;

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
    Assert.equal(permissionsController.owner(), address(this), "PermissionsController isn't initialized with owner having a permission of one.");
  }


}
