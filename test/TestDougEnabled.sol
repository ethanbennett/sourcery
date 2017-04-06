pragma solidity ^0.4.8;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/DougEnabled.sol";

contract TestDougEnabled {
  DougEnabled dougEnabled;
  address testAddress1;
  address testAddress2;

  function beforeEach(){
    dougEnabled = DougEnabled(new DougEnabled());
    testAddress1 = 0x16f221f434322a9b639df421af8fbb66d4404fd5;
    testAddress2 = 0x16f221f434322a9b639df421af8fbb66d4404fd5;
  }

  function testDougEnabledCanSetDougAddress(){
    Assert.equal(dougEnabled.setDougAddress(testAddress1), true, "DougEnabled cannot set Dougs address");
  }

  function testDougCanChangeDougAddress(){
    dougEnabled.setDougAddress(address(this));
    Assert.equal(dougEnabled.setDougAddress(testAddress1), true, "Only Doug should be able to change DOUG address");
  }

  function testIfDougExistsOnlyDougCanSetDougAddress(){
    dougEnabled.setDougAddress(testAddress1);
    Assert.equal(dougEnabled.setDougAddress(testAddress2), false, "Only Doug should be able to change DOUG address");
  }
}