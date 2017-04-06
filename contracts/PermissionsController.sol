pragma solidity ^0.4.8;

import "./PermissionsDB.sol";

contract PermissionsController {
  address public owner;
  address permissionsDB;

  function PermissionsController(){
    owner = msg.sender;
    permissionsDB = address(new PermissionsDB());
  }

  function setPermission(address _user, uint _perm) returns (bool result) {
    result = PermissionsDB(permissionsDB).setPermission(_user, _perm);
  }

  function getPermission(address _user) returns (uint perm) {
    perm = PermissionsDB(permissionsDB).perms(_user);
  }
}