;; ----------------------------------------------------------------------------
;; ### Recursive Fibonacci (rec-fib.wat)
;; Finds the n-th Fibonacci number using a recursive function
;; By: anachan01h
;; ----------------------------------------------------------------------------

(module
    (import "js" "arg1" (global $arg1 i32))
    (import "js" "log" (func $log (param i32)))
    (start $_start)
    (func $_start
        global.get $arg1
        call $rec-fib
        call $log
    )
    (func $rec-fib (param $n i32) (result i32)
        (local $f i32)
        
        block $is0
            local.get $n
            i32.eqz
            br_if $is0

            local.get $n
            i32.const 1
            i32.gt_u
            if
                local.get $n
                i32.const 1
                i32.sub
                call $rec-fib
                local.get $n
                i32.const 2
                i32.sub
                call $rec-fib
                i32.add
                local.set $f
            else
                i32.const 1
                local.set $f
            end
        end

        local.get $f
    )
)
