; Macro print preliminary

; Assumes Bed temp is set but nozzle is cold

M98 P"/macros/led_status_print_start.g"

; wait (bed) temps and launch QGL
echo "Waiting for temperatures before QGL"
M116
G32			; level the gantry with hot bed is hot -> Runs bed.g

; Experimental set Z by inductive probe
; echo "Experimental - setting Z by inductive probing"
; M98 P"/macros/setZ0_inductive.g"

; Goto bucket (as nozzle will start heating after this)
M98 P"/macros/goto_bucket.g"

; sets auto babystepping
; M98 P"/macros/set_auto_babysteps.g"

; MESH COMPENSATION TEST
;echo "Enabling Mesh compensation"
;G29 S1		; loads heatmap