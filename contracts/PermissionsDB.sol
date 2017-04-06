pragma solidity ^0.4.8;

contract PermissionsDB {

  mapping (address => uint) public perms;

  function PermissionsDB() {
    perms[msg.sender] = 2;
  }

  function setPermission(address _user, uint _perm) constant returns (bool) {
    if (perms[msg.sender] != 2) {
      return false;
    }
    perms[_user] = _perm;
    return true;
  }
}