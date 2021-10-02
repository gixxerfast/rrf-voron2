; macro to check the magprobe triggered status

; global.magprobe_status
; = docked 
; = attached 


echo "MagProbe trigger value : " , sensors.probes[0].value[0]

if sensors.probes[0].value[0] = 0
	set global.magprobe_status = "attached"
elif sensors.probes[0].value[0] > 500
	set global.magprobe_status = "docked"

; echo global.magprobe_status


