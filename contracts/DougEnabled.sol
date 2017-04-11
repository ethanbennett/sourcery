pragma solidity ^0.4.8;

contract DougEnabled {
  address DOUG;

  function setDougAddress(address _doug) returns (bool) {
    if(DOUG != 0x0 && msg.sender != DOUG) {
      return false;
    }
    DOUG = _doug;
    return true;
  }
}