pragma solidity ^0.4.2;

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

}