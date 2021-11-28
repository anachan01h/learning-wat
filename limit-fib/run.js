const fs = require('fs');
const bytes = fs.readFileSync(__dirname + '/limit-fib.wasm');

const importObject = {
    js: {
        log: console.log
    }
}

WebAssembly.instantiate(new Uint8Array(bytes), importObject);