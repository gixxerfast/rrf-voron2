M98 P"/macros/led_status_load_unload.g"
G10 P0 S245
M291 P"Please wait while the nozzle is being heated up" R"Unloading Filament" T5 ; Display message
M98 P"/macros/goto_filament_loading.g"
M116 														; Wait for the temperatures to be reached
M98 P"/macros/boop.g"
M291 P"Retracting filament..." R"Unloading Filament" T5 	; Display new message
G1 E-120 F300 												; Retract 100mm of filament at 300mm/min
M400 														; Wait for moves to complete
M292 														; Hide the message
M291 P"Uloaded filament..." R"Unloading complete" T5 	; Display new message
G10 S0 														; Turn off the heater
M84 E0 														; Turn off extruder drive
M98 P"/macros/boop.g"
M98 P"/macros/boop.g"
M98 P"/macros/led_status_print_end.g"