;; ----------------------------------------------------------------------------
;; ### Hello World (hello.wat)
;; A simple Hello World in WebAssembly
;; By: anachan01h
;; ----------------------------------------------------------------------------

(import "js" "log" (func $log (param i32 i32)))
(import "js" "mem" (memory 1))
(data (i32.const 0) "Hello World!")
(start $_start)
(func $_start
    i32.const 0
    i32.const 12
    call $log
)