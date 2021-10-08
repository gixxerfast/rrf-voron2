; Macro for sampling mesh at running temps

G29 S2

;G28

;G32

M98 P"/macros/set_safe_speed.g"
M98 P"/macros/set_safe_current_z.g"

M98 P"/macros/magprobe_attach.g"

M98 P"/macros/magprobe_set_z_offset.g"

echo "Starting MESH sampling"
G29 S0			; run mesh samplig procedure
echo "MESH samplig sequence completed"

M98 P"/macros/set_normal_speed.g"
M98 P"/macros/restore_current_z.g"

M98 P"/macros/magprobe_dock.g"