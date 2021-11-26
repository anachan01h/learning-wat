const fs = require('fs');
const bytes = fs.readFileSync(__dirname + '/fibonacci.wasm');
const arg1 = parseInt(process.argv[2]);

const importObject = {
    js: {
        arg1: new WebAssembly.Global({value: "i32", mutable: false}, arg1),
        log: console.log
    }
}

WebAssembly.instantiate(new Uint8Array(bytes), importObject);