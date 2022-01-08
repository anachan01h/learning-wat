const stdout = document.getElementById("terminal");

const importObject = {
    js: {
        nwrite: n => nwrite(stdout, n, true)
    }
}

WebAssembly.instantiateStreaming(fetch("limit-fib.wasm"), importObject);
