pragma solidity ^0.4.8;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Doug.sol";

contract TestDoug {
  Doug doug;
  address testAddress1;
  address testAddress2;

  function beforeEach() {
    doug = Doug(new Doug());
    testAddress1 = 0x16f221f434322a9b639df421af8fbb66d4404fd4;
    testAddress2 = 0x16f221f434322a9b639df421af8fbb66d4404fd5;
  }

  function testDougHasAnOwnerOnInitialization () {
    Assert.equal(doug.owner(), address(this), "Doug doesn't seem to have an owner after initialization");
  }

  function testDougIsInitializedWithContractAddresses() {
    Assert.equal(doug.contracts("Catz"), 0x0, "Doug doesn't have this address registered.");
  }

  function testDougCanAddToContracts() {
    Assert.equal(doug.addContract("Catz", testAddress1), true, "Doug can't add to contracts");
    Assert.equal(doug.contracts("Catz"), testAddress1, "Doug doesn't have this address registered.");
  }

  function testDougCanRemoveContracts() {
    doug.addContract("Catz", testAddress1);

    Assert.equal(doug.removeContract("Catz"), true, "Doug can't remove contracts.");
    Assert.equal(doug.contracts("Catz"), 0x0, "Doug doesn't have this address registered.");
  }

  function testDougCanFindAContractAddressWithinContracts() {
    doug.addContract("Catz", testAddress1);
    doug.addContract("Dogz", testAddress2);

    Assert.equal(doug.getContract("Dogz"), testAddress2, "Doug didn't return the expected address.");
  }
}