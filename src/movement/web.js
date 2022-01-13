// Setting up the canvas ------------------------------------------------------
const canvas = document.getElementById("screen");
const screen = canvas.getContext("2d");
screen.fillStyle = "#888";

// WebAssembly Import Object --------------------------------------------------
const importObject = {
    js: {
        clear: (x,y,w,h) => screen.clearRect(x,y,w,h),
        paint: (x,y,w,h) => screen.fillRect(x,y,w,h)
    }
}
// Running WebAssembly Code ---------------------------------------------------

WebAssembly.instantiateStreaming(fetch("movement.wasm"), importObject).then(
    exportObject => {
        const update = exportObject.instance.exports.update;
        const kbd_input = exportObject.instance.exports.kbd_input;
        
        document.addEventListener("keydown", event => kbd_input(1, event.keyCode));
        document.addEventListener("keyup", event => kbd_input(0, event.keyCode));
        setInterval(update, 1000/60);
    }
)