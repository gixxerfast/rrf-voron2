; check for plexplate deployment. 
; stops the print if it is not present

G90
G1 X94.3 Y265 Z5
G1 Z2 F600
M400
G4 P1200
;echo "z-probe value at z=1 : " , sensors.probes[0].value[0]	; debug only

if sensors.probes[0].value[0] < 500
	echo "Flex plate not detected. Waiting user input.."
	G1 Z15
	M291 P"Please confirm Flex plate is deployed / deploy Flex Plate" S3
	; what is the effect of Calnel current operation ??
	; M98 P"/sys/cancel.g"
	; abort
else
	echo "Flex plate detected - continue"
	G1 Z5