pragma solidity ^0.4.4;

contract PathsDB {

    address[] public path;

    function addCheckpoint(address checkpoint) returns (bool){
      if (checkpoint == 0x0 || path[path.length-1] == checkpoint) {
        return false;
      }
      path.push(checkpoint);
      return true;
    }
}