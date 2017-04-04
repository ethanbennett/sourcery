pragma solidity ^0.4.4;

contract PermissionsController {
  address public owner;

  function PermissionsController(){
    owner = msg.sender;
  }
}