const fs = require('fs');
const bytes = fs.readFileSync(__dirname + '/sum.wasm');
const n = parseInt(process.argv[2]);

const importObject = {
    js: {
        var1: new WebAssembly.Global({value: "i32", mutable: false}, n),
        log: console.log
    }
}

WebAssembly.instantiate(new Uint8Array(bytes), importObject);