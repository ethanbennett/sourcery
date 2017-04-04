pragma solidity ^0.4.4;

import "./PermissionsDB.sol";

contract PermissionsController {
  address public owner;
  address public permissionsDB;

  function PermissionsController(){
    owner = msg.sender;
    permissionsDB = address(new PermissionsDB());
  }
}