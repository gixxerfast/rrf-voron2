; Macro for defining Global variables at start

if !exists(global.bed_temp)
	global bed_temp = heat.heaters[0].active

if !exists(global.hotend_temp)
	global hotend_temp = heat.heaters[1].active

if !exists(global.magprobe_status)
	global magprobe_status = "none"

if !exists(global.job_completion)
	global job_completion = 0

; output current values
echo "global.bed_temp defined. Value : " , global.bed_temp
echo "global.hotend_temp defined. Value : " , global.hotend_temp
echo "global.magprobe_status defined. Value : " , global.magprobe_status
echo "global.job_completion defined. Value : " , global.job_completion