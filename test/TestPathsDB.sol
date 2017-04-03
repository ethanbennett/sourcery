pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PathsDB.sol";

contract TestPathsDB {
  PathsDB pathsDB;
  address testAddress1;

  function beforeEach(){
    pathsDB = PathsDB(new PathsDB());
    testAddress1 = 0x8e92d3b1a9af41c9ff043d892c6d6648aa7721b6;
  }

  function testCheckpointCanBeAddedToPathsDBAndReturnsTrue(){
    Assert.equal(pathsDB.addCheckpoint(1, testAddress1), true, "PathsDB doesn't return true when a new checkpoint is added.");
  }

  function testCheckpointCannotBeAddedWithInvalidKeyAndReturnsFalse(){
    pathsDB.addCheckpoint(1, testAddress1);
    Assert.equal(pathsDB.addCheckpoint(1, testAddress1), false, "PathsDB doesn't return false when an invalid key is provided.");
  }

}