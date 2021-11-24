;; # sum.wat
;; Calculates the sum of the first n natural numbers
;; By: anachan01h

(module
    (import "js" "var1" (global $var1 i32))
    (import "js" "log" (func $log (param i32)))
    (start $_start)
    (func $_start
        global.get $var1
        call $sum
        call $log
    )
    (func $sum (export "sum") (param $n i32) (result i32)
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