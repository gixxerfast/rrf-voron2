; Macro for preheating

M98 P"/macros/led_status_load_unload.g"
echo "Starting Pre-Heating Sequence"

; Turn off noisy Extruder motor
M84 E0

M98 P"/macros/goto_bucket.g"

; sets bed temperature - do not wait
echo "Bed set to 86 C"
M140 S86

; preheat hotend
echo "PreHeating hotend to 240 C"
M109 S240
echo "Hotend temp reached"
;echo "Waiting 3 minutes at set temperature"
;G4 S180		; 10 minutes are 600 seconds S600

; echo "Pre-Heating bed sequence complete"
