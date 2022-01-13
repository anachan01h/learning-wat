;; ----------------------------------------------------------------------------
;; ### Block Movement (movement.wat)
;; Moving a block on the canvas using the keyboard arrows! :)
;; By: anachan01h
;; ----------------------------------------------------------------------------

;; Imported functions ---------------------------------------------------------
(import "js" "clear" (func $clear (param i32 i32 i32 i32)))
(import "js" "paint" (func $paint (param i32 i32 i32 i32)))

;; Data Segment ---------------------------------------------------------------
(memory 1)

;; # Memory map
;; 0x0000: i8 keyboard flag
;;         (bit 0: left, bit 1: up, bit 2: right, bit 3: down)
;; 0x0002: i16 block x position
;; 0x0004: i16 block y position

(global $flags i32 (i32.const 0x0000))

(global $posx i32 (i32.const 0x0002))
(data (i32.const 0x0002) "\98")

(global $posy i32 (i32.const 0x0004))
(data (i32.const 0x0004) "\5C")

;; Global constants -----------------------------------------------------------
(global $speed i32 (i32.const 5))
(global $block_width i32 (i32.const 15))
(global $block_height i32 (i32.const 15))
(global $screen_width i32 (i32.const 320))
(global $screen_height i32 (i32.const 200))

;; Code Segment ---------------------------------------------------------------
(func $update (export "update")
    (local $eax i32)
    ;; Clear last position
    global.get $posx
    i32.load16_u
    global.get $posy
    i32.load16_u
    global.get $block_width
    global.get $block_height
    call $clear

    ;; Check left arrow
    global.get $posx
    global.get $posx
    i32.load16_u
    global.get $speed
    global.get $flags
    i32.load8_u
    i32.const 1
    i32.and
    call $kbd
    i32.store16

    ;; Check up arrow
    global.get $posy
    global.get $posy
    i32.load16_u
    global.get $speed
    global.get $flags
    i32.load8_u
    i32.const 2
    i32.and
    i32.const 1
    i32.shr_u
    call $kbd
    i32.store16

    ;; Check right arrow
    global.get $screen_width
    global.get $block_width
    i32.sub
    local.set $eax

    global.get $posx
    local.get $eax
    local.get $eax
    global.get $posx
    i32.load16_u
    i32.sub
    global.get $speed
    global.get $flags
    i32.load8_u
    i32.const 4
    i32.and
    i32.const 2
    i32.shr_u
    call $kbd
    i32.sub
    i32.store16

    ;; Check down arrow
    global.get $screen_height
    global.get $block_height
    i32.sub
    local.set $eax

    global.get $posy
    local.get $eax
    local.get $eax
    global.get $posy
    i32.load16_u
    i32.sub
    global.get $speed
    global.get $flags
    i32.load8_u
    i32.const 8
    i32.and
    i32.const 3
    i32.shr_u
    call $kbd
    i32.sub
    i32.store16

    ;; Paint new position
    global.get $posx
    i32.load16_u
    global.get $posy
    i32.load16_u
    global.get $block_width
    global.get $block_height
    call $paint
)

(func $kbd
    (param $pos i32)
    (param $inc i32)
    (param $flag i32)
    (result i32)

    (local $eax i32)

    local.get $pos
    local.get $inc
    local.get $flag
    i32.mul
    i32.sub

    local.tee $eax
    i32.const 0
    i32.gt_s
    local.get $eax
    i32.mul
)

(func $kbd_input (export "kbd_input")
    (param $is_down i32)
    (param $key_code i32)

    (local $bit i32)

    block $is_arrow
        ;; If $key_code < 37, get out of the block
        local.get $key_code
        i32.const 37
        i32.lt_u
        br_if $is_arrow

        ;; If $key_code > 40, get out of the block
        local.get $key_code
        i32.const 40
        i32.gt_u
        br_if $is_arrow

        i32.const 1
        local.get $key_code
        i32.const 37
        i32.sub
        i32.shl
        local.set $bit

        global.get $flags

        global.get $flags
        i32.load8_u
        local.get $bit
        local.get $is_down
        i32.mul
        i32.or

        local.get $bit
        i32.const 1
        local.get $is_down
        i32.sub
        i32.mul
        i32.const -1
        i32.xor
        i32.and

        i32.store8
    end
)