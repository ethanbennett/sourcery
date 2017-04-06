pragma solidity ^0.4.8;

import "./PathsDB.sol";

contract PathsController {
    address public owner;
    mapping (uint => address) public paths;

    function PathsController() {
        owner = msg.sender;
    }

    function createPath(uint _lotId, address _checkpoint) returns (bool) {
        PathsDB pathsDB = new PathsDB();
        pathsDB.addCheckpoint(_checkpoint);
        paths[_lotId] = address(pathsDB);

        return true;
    }

    function addCheckpoint(uint _lotId, address _checkpoint) returns (bool) {
        bool result = PathsDB(paths[_lotId]).addCheckpoint(_checkpoint);
        return result;
    }

    function createOrUpdatePath(uint _lotId, address _checkpoint) returns (bool result) {
        if (_lotId == 0 || _checkpoint == 0x0) {
            result = false;
        }

        if (paths[_lotId] == 0x0) {
            result = createPath(_lotId, _checkpoint);
        } else {
            result = addCheckpoint(_lotId, _checkpoint);
        }
    }

    function getPath(uint _lotId) constant returns (address[] memory path) {
        if (paths[_lotId] == 0x0){
            return path;
        }

        uint length = PathsDB(paths[_lotId]).getPathLength();

        path = new address[](length);

        for (uint i = 0; i < length; i++) {
            path[i] = PathsDB(paths[_lotId]).path(i);
        }

        return path;
    }
}
