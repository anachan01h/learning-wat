const stdout = document.getElementById("terminal");

const importObject = {
    js: {
        arg1: undefined,
        nwrite: n => nwrite(stdout, n, true)
    }
}

const promise = WebAssembly.compileStreaming(fetch("fibonacci.wasm"));

async function execute() {
    promise.then(
        module => {
            importObject.js.arg1 = Number(document.getElementById("input").value);
            WebAssembly.instantiate(module, importObject);
        }
    )
}