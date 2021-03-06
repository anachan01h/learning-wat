;; ----------------------------------------------------------------------------
;; ### Sum (sum.wat)
;; Calculates the sum of the first n natural numbers.
;; By: anachan01h
;; ----------------------------------------------------------------------------

(module
    (import "js" "arg1" (global $arg1 i32))
    (import "js" "nwrite" (func $nwrite (param i32)))
    (start $_start)
    (func $_start
        global.get $arg1
        call $sum
        call $nwrite
    )
    (func $sum (param $n i32) (result i32)
        (local $s i32)
        (local $i i32)
        i32.const 0
        local.set $s
        i32.const 0
        local.set $i
        
        loop $loop
            local.get $i
            i32.const 1
            i32.add
            local.tee $i
            local.get $s
            i32.add
            local.set $s
            local.get $i
            local.get $n
            i32.lt_u
            br_if $loop
        end

        local.get $s
    )
)