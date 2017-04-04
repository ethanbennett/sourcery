pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PathsDB.sol";

contract TestPathsDB {
  PathsDB pathsDB;
  address testAddress1;

  function beforeEach(){
    pathsDB = PathsDB(new PathsDB());
    testAddress1 = 0x16f221f434322a9b639df421af8fbb66d4404fd4;
  }

  function testCheckpointCanBeAddedToPathsDBAndReturnsTrue(){
    Assert.equal(pathsDB.addCheckpoint(testAddress1), true, "PathsDB doesn't return true when a new checkpoint is added.");
  }

  function testCheckpointCannotBeAddedIfAddressIsTheSameAsTheLastOneAndReturnsFalse(){
    pathsDB.addCheckpoint(testAddress1);
    Assert.equal(pathsDB.addCheckpoint(testAddress1), false, "PathsDB doesn't return false when a duplicate address is provided.");
  }

  function testCheckpointCannotBeEmptyAndReturnsFalse(){
    Assert.equal(pathsDB.addCheckpoint(0x0), false, "PathsDB doesn't return false when an empty address is provided.");
  }

}