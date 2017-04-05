pragma solidity ^0.4.8;

contract Doug {
  address public owner;
  mapping (bytes32 => address) public contracts;

  function Doug() {
    owner = msg.sender;
  }

  function addContract(bytes32 _name, address _addr) returns (bool) {
    contracts[_name] = _addr;
    return true;
  }

  function removeContract(bytes32 _name) returns (bool) {
    if (contracts[_name] == 0x0 ) {
      return false;
    }
    contracts[_name] = 0x0;
    return true;
  }

  function getContract(bytes32 _name) returns (address) {
    return contracts[_name];
  }
}