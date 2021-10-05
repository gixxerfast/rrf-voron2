; Macro for sampling mesh at running temps

G29 S2

G28

G32

M98 P"/macros/speed_probing.g"
M98 P"/macros/z_current_low.g"

M98 P"/macros/magprobe_attach.g"

M98 P"/macros/magprobe_set_offset.g"

echo "Starting MESH sampling"
G29 S0			; run mesh samplig procedure
echo "MESH samplig sequence completed"

M98 P"/macros/speed_printing.g"
M98 P"/macros/z_current_high.g"

M98 P"/macros/magprobe_dock.g"