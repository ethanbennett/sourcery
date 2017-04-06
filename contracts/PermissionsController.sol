pragma solidity ^0.4.4;

import "./PermissionsDB.sol";

contract PermissionsController {
  address public owner;
  address public permissionsDB;

  function PermissionsController(){
    owner = msg.sender;
    permissionsDB = address(new PermissionsDB());
  }

  function setPermission(address _addr, uint _perm) returns (bool result) {
    result = PermissionsDB(permissionsDB).setPermission(_addr, _perm);
  }
}