let memory = new WebAssembly.Memory({initial:1});

function log(offset, length) {
    const bytes = new Uint8Array(memory.buffer, offset, length);
    const string = new TextDecoder('utf8').decode(bytes);
    console.log(string);
}

const imports = {
    js: {
        mem: memory,
        log: log
    }
}

const fs = require('fs');
const bytes = fs.readFileSync(__dirname + '/hello.wasm');
WebAssembly.instantiate(new Uint8Array(bytes), imports);