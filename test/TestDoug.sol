pragma solidity ^0.4.8;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Doug.sol";

contract TestDoug {
  Doug doug;
  address testAddress1;

  function beforeEach() {
    doug = Doug(new Doug());
    testAddress1 = 0x16f221f434322a9b639df421af8fbb66d4404fd4;
  }

  function testDougHasAnOwnerOnInitialization () {
    Assert.equal(doug.owner(), address(this), "Doug doesn't seem to have an owner after initialization");
  }

}