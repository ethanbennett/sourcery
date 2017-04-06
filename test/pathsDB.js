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
      instance.addCheckpoint(accounts[8]);
      instance.addCheckpoint(accounts[9]);
      return instance.getPath.call();
    }).then((checkpoints) => {
      assert.equal(checkpoints.length, 2, "checkpoints were not correctly inserted into path");
      assert.equal(checkpoints[0], accounts[8], "checkpoint one was not stored correctly");
      assert.equal(checkpoints[1], accounts[9], "checkpoint two was not stored correctly");
    });
  });
})
