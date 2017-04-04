pragma solidity ^0.4.4;

contract PermissionsDB {

  mapping (address => uint) public perms;

  function PermissionsDB() {
    perms[msg.sender] = 1;
  }

  function setPermission(address user, uint perm) constant returns (bool result) {
    if (perms[msg.sender] != 1) {
      return false;
    }
    perms[user] = perm;
    return true;
  }
}