var PathsDB = artifacts.require("./PathsDB.sol");

contract('PathsDB', (accounts) => {
  it ("path starts as an empty array", () => {
    return PathsDB.deployed().then((instance) => {
      return instance.getPath.call();
    }).then((checkpoints) => {
      assert.equal(checkpoints.length, 0, "path doesn't start empty.");
      assert.equal(checkpoints.constructor, Array, "path isn't an array.");
    });
  });

  it ("returns an array of all checkpoints addresses", () => {
    return PathsDB.deployed().then((instance) => {
      instance.addCheckpoint(accounts[0]);
      instance.addCheckpoint(accounts[1]);
      return instance.getPath.call();
    }).then((checkpoints) => {
      assert.equal(checkpoints.length, 2, "checkpoints were not correctly inserted into path");
      assert.equal(checkpoints[0], accounts[0], "checkpoint one was not stored correctly");
      assert.equal(checkpoints[1], accounts[1], "checkpoint two was not stored correctly");
    });
  });
})