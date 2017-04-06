var PathsController = artifacts.require("./PathsController.sol");

contract('PathsController', (accounts) => {
  it ("returns an empty array if no path matches given lotId", () => {
    return PathsController.deployed().then((instance) => {
      return instance.getPath.call(1);
    }).then((checkpoints) => {
      assert.equal(checkpoints.length, 0, "fails to return an empty array if no path exists")
      assert.equal(checkpoints.constructor, Array, "fails to return an empty array if no path exists")
    });
  })
  
  it ("returns an array of all checkpoints for a given lotID", () => {
    return PathsController.deployed().then((instance) => {
      instance.createOrUpdatePath(1, accounts[8]);
      instance.createOrUpdatePath(1, accounts[9]);
      return instance.getPath.call(1);
    }).then((checkpoints) => {
      assert.equal(checkpoints.length, 2, "checkpoints were not correctly found for given lotId");
      assert.equal(checkpoints[0], accounts[8], "checkpoint one was not returned correctly");
      assert.equal(checkpoints[1], accounts[9], "checkpoint two was not returned correctly");
    });
  });
})