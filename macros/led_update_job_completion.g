; Updates the LED strips with RED/WHITE according to the JobCompletion %

set global.job_completion = abs(job.filePosition/job.file.size*100)

var led_to_lit = floor(global.job_completion*17/100+0.5)

; debugging messages only
;echo "Job Completion status" , global.job_completion , " %"
;echo "Leds to lit" , var.led_to_lit

; sets the LEDS on the TOP when the print has started
;Pnnn 		Brightness, 0-255 (RepRapFirmware 2.03 and later)
;Snnn 		Number of individual LEDs to set to these colours

if var.led_to_lit > 0
	; right side stripe
	M150 R255 U000 B000 P55 S{17-var.led_to_lit} F1
	M150 R255 U255 B255 P200 S{var.led_to_lit} F1
	; left side stripe
	M150 R255 U255 B255 P200 S{var.led_to_lit} F1
	M150 R255 U000 B000 P55 S{17-var.led_to_lit}
