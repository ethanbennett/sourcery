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

  function testChecksIfAGivenAddressIsALocationUserAndReturnsAFalseIfTheyAreNot(){
    Asser.equal(permissionsDB.getPermissionsFor(testAddress1), false, "PermissionsDB doesn't reject a non existing location user.");
  }

}