; scrub the noozle

M98 P"/macros/magprobe_dock.g"

G90 				; absolute
G1 X290 Y308 Z10  	; position right of the bucket
M400				; wait move completion

;scrubber is 210 - 240
; bucket is 190 - 290
echo "Scrubbing noozle"
G1 Z1				; z enought not to touch with sock just noozle head 

G91					; relative
G1 X-100 F9000
G1 X+100 F9000

G1 X-100
G1 X+100 F9000

G1 X-100
G1 X+100 F9000

G1 X-100
G1 X+100 F9000

G1 X-100
G1 X+100 F9000

G1 Y-3
G1 X-100			; exit scrubber
M400
echo "Scrubbing noozle completed"

G90					; absolute
G1 Z5