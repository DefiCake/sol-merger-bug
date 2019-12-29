const { merge } = require('sol-merger');
const fs = require('fs-extra');

const doMerge = async () => {
  // Get the merged code as a string
  const mergedCode = await merge('./Example.sol');
  // Print it out or write it to a file etc.
  fs.writeFileSync('./merged.sol', Buffer.from(mergedCode));
};

doMerge();
