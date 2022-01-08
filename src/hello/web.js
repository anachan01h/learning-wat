const memory = new WebAssembly.Memory({initial:1});

const stdout = document.getElementById("terminal");

const imports = {
    js: {
        mem: memory,
        write: (offset, length) => write(stdout, offset, length)
    }
}

WebAssembly.instantiateStreaming(fetch("hello.wasm"), imports);