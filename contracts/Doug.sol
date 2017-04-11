pragma solidity ^0.4.8;

import "./PermissionsDB.sol";
import "./PermissionsController.sol";
import "./PathsDB.sol";
import "./PathsController.sol";


contract Doug {
  address public owner;
  mapping (bytes32 => address) public contracts;

  function Doug() {
    owner = msg.sender;
    addContract("permsDB", address(new PermissionsDB()));
    addContract("permsController", address(new PermissionsController()));
    addContract("pathsDB", address(new PathsDB()));
    addContract("pathsController", address(new PathsController()));
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