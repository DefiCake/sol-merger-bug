# To reproduce

`npm ci` and then `node index.js`

This will call sol-merger on the contract `Example.sol`. This shows that if for any reason this is a multi-contract or merged / flattened file, the merging process can produce wrong results by catching the keywords defined in `fileAnalyzer.js` at the function `analyzeExports`:

```javascript
const exportRegex = /(contract|library|interface)\s+([a-zA-Z_$][a-zA-Z_$0-9]*)\s*([\s\S]*?)\{/g;
```

As it can be observed, the original `Example.sol` file comprises `contract A`, `contract B`, `contract ConflictingInheritance` and the final child which is `contract Example`. When calling `node index.js`, sol-merger will be invoked and generate `merged.sol`. Inside this file, which should be idential to `Example.sol`, it can be observed that `contract B` is missing. This is due to the keyword `contract` appearing in:

```javascript
require(false, 'Because it will have they keyword contract in this string');
```
