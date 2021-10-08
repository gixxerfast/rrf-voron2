; give one last chance to cancel...
M291 P"This will replace the existing bed mesh. Are you sure?" R"Probing New Bed Mesh" S3

; Level the gantry so we can park the carriage in the middle of the bed
G32
M98 P"/print_scripts/goto_bed_center.g"

; Heat the bed to 100C
M291 P"Heating up the bed..." R"Probing New Bed Mesh" T5
M190 S100

; Set the hotend to 220C
M291 P"Heating up the hotend..." R"Probing New Bed Mesh" T5
G10 P0 S220
M116

; Level the gantry again while everything is hot
G32

; Establish final Z ref
M291 P"Final Z ref..." R"Probing New Bed Mesh" T5
M98 P"/macros/print_scripts/do_z_switch_probe.g"

; ignore current heightmap
M561

; Probe a new bed mesh!
M291 P"Probing now!" R"Probing New Bed Mesh" T5
G29

; Done, move to center and turn off heat
M98 P"/macros/print_scripts/goto_bed_center.g"
G10 P0 S0
M140 S0

M291 P"Done!" R"Probing New Bed Mesh" T5
