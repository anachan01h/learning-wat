;; ----------------------------------------------------------------------------
;; ### Fibonacci (fibonacci.wat)
;; Finds the n-th Fibonacci number
;; By: anachan01h
;; ----------------------------------------------------------------------------

(module
    (import "js" "arg1" (global $arg1 i32))
    (import "js" "nwrite" (func $nwrite (param i32)))
    (start $_start)
    (func $_start
        global.get $arg1
        call $fibonacci
        call $nwrite
    )
    (func $fibonacci (param $rcx i32) (result i32)
        (local $f0 i32)
        (local $f1 i32)

        i32.const 0
        local.set $f0
        i32.const 0
        local.set $f1

        local.get $rcx
        i32.const 0
        i32.gt_u
        if
            i32.const 1
            local.set $f1
            
            local.get $rcx
            i32.const 1
            i32.gt_u
            if
                loop $loop
                    local.get $f0
                    local.get $f1
                    i32.add
                    local.get $f1
                    local.set $f0
                    local.set $f1

                    local.get $rcx
                    i32.const 1
                    i32.sub
                    local.tee $rcx
                    i32.const 1
                    i32.gt_u
                    br_if $loop
                end
            end
        end

        local.get $f1
    )
)
