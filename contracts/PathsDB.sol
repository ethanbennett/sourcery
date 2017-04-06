pragma solidity ^0.4.8;

contract PathsDB {

    address[] public path;

    function addCheckpoint(address checkpoint) returns (bool) {
      if (checkpoint == 0x0) {
        return false;
      }
      if (path.length == 0 || path[path.length-1] != checkpoint) {
        path.push(checkpoint);
        return true;
      }
      return false;
    }

    function getPath() constant returns (address[]) {
      uint length = path.length;

      address[] memory checkpoints = new address[](length);

      for (uint i = 0; i < path.length; i++) {
        checkpoints[i] = path[i];
      }

      return checkpoints;
    }
}