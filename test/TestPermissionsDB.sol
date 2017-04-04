pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PermissionsDB.sol";

contract TestPermissionsDB {
  PermissionsDB permissionsDB;
  address testAddress1;

  function beforeEach() {
    permissionsDB = PermissionsDB(new PermissionsDB());
    testAddress1 = 0x16f221f434322a9b639df421af8fbb66d4404fd4;
  }

  function testIsInitializedWithOwnerHavingAPermissionOfOne(){
    uint ownerPermission = permissionsDB.perms(address(this)); 
    Assert.equal(ownerPermission, 1, "PermissionsDB isn't initialized with owner having a permission of one.");
  }

}