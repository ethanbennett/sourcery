pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PathsController.sol";

contract TestPathsController {
    PathsController pathsController;
    address testAddress1;
    address testAddress2;

    function beforeEach() {
        pathsController = PathsController(new PathsController());
        testAddress1 = 0x203902574884c9ed0a0d35807d6abf3da324f485;
        testAddress2 = 0xcaa67ec75562b3343f1d299530884ffaaa3dc21e;
    }

    function testPathsControllerIsInitializedWithAnOwner() {
        Assert.equal(pathsController.owner(), address(this), "Paths Controller is not initialized with an owner");
    }

    function testPathsControllerCanCreateANewPath() {
        Assert.equal(pathsController.createPath(1, testAddress1), true, "Path Controller did not successfully create a new path");
    }

    function testPathsControllerCanAddANewCheckpointToAnExistingPath() {
        pathsController.createPath(1, testAddress1);
        Assert.equal(pathsController.addCheckpoint(1, testAddress2), true, "Path Controller did not successfully add a new checkpoint to existing path");
    }

    function testPathsControllerCanCreatePathOrAddCheckpointToExistingPath() {
        Assert.equal(pathsController.createOrUpdatePath(1, testAddress1), true, "Path Controller did not successfully create a new path");
        Assert.equal(pathsController.createOrUpdatePath(1, testAddress2), true, "Path Controller did not successfully update the existing path");
    }

    function testPathsControllerReturnsThePathForAGivenLot() {
        pathsController.createOrUpdatePath(1, testAddress1);
        pathsController.createOrUpdatePath(1, testAddress2);
        Assert.equal((pathsController.getPath(1))[0], testAddress1, "Path Controller did not successfully return the path for the given lot");
    }
}



