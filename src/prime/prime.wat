;; ----------------------------------------------------------------------------
;; ### Prime Numbers (prime.wat)
;; Check if a number is prime or not.
;; By: anachan01h
;; ----------------------------------------------------------------------------

(import "js" "arg1" (global $arg1 i32))
(import "js" "nwrite" (func $nwrite (param i32)))
(start $_start)
(func $_start
    global.get $arg1
    call $prime
    call $nwrite
)
(func $prime (param $p i32) (result i32)
    (local $ax i32)
    (local $cx i32)
    (local $res i32)

    i32.const 1
    local.set $res

    i32.const 1
    local.set $cx

    local.get $p
    i32.const 1
    i32.le_u
    if
        i32.const 0
        local.set $res
    else
        local.get $p
        i32.const 1
        i32.shr_u
        local.set $ax
        block $exit
        loop $loop
            local.get $cx
            i32.const 1
            i32.add
            local.tee $cx
            local.get $ax
            i32.gt_u
            br_if $exit

            local.get $p
            local.get $cx
            i32.rem_u
            br_if $loop
        end
            i32.const 0
            local.set $res
        end
    end

    local.get $res
)