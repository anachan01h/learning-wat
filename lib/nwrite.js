function nwrite(output, n, newLine) {
    output.innerHTML += n;
    if (newLine) {
        output.innerHTML += "<br\>";
    }
}