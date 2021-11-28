;; ----------------------------------------------------------------------------
;; ### Limit Fibonacci (limit-fib.wat)
;; Finds the largest Fibonacci number a 32 bits signed integer can store.
;; By: anachan01h
;; ----------------------------------------------------------------------------

(module
    (import "js" "log" (func $log (param i32)))
    (start $_start)
    (func $_start
        call $limit-fib
        call $log
        call $log
    )
    (func $limit-fib (result i32 i32)
        (local $f0 i32)
        (local $f1 i32)
        (local $n i32)

        i32.const 0
        local.set $f0
        i32.const 1
        local.set $f1
        i32.const 0
        local.set $n

        loop $loop
            local.get $n
            i32.const 1
            i32.add
            local.set $n

            local.get $f0
            local.get $f1
            i32.add
            local.get $f1
            local.set $f0
            local.set $f1

            local.get $f0
            local.get $f1
            i32.le_s
            br_if $loop
        end

        local.get $n
        local.get $f0
    )
)
