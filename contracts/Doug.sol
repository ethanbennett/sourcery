pragma solidity ^0.4.8;

contract Doug {
  address public owner;

  function Doug() {
    owner = msg.sender;
  }
}