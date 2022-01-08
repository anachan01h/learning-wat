function write(output ,offset, length) {
    const bytes = new Uint8Array(memory.buffer, offset, length);
    const string = new TextDecoder('utf8').decode(bytes);
    output.innerHTML += string;
}