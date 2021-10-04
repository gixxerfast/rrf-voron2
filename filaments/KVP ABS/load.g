M98 P"/macros/led_status_load_unload.g"
G10 P0 S245
M291 P"Please wait while the nozzle is being heated up" R"Loading Filament" T5 ; Display message
M98 P"/macros/goto_filament_loading.g"
M116 												; Wait for the temperatures to be reached
M98 P"/macros/beep.g"
M291 P"Feeding filament..." R"Loading Filament" T5 	; Display new message
G1 E120 F300 										; Feed 100mm of filament at 300mm/min -> 5mm / sec
G4 P1000 											; Wait one second -> Pnnn Time to wait, in milliseconds
G1 E-4 F1800 										; Retract 4mm of filament at 1800mm/min
M400 												; Wait for moves to complete
M292 												; Hide the message
M291 P"Filament Load Complete" R"Loading Filament" T5 	; Display new message
G10 S0 												; Turn off the heater again
M98 P"/macros/beep.g"
M98 P"/macros/beep.g"
M98 P"/macros/led_status_print_end.g"