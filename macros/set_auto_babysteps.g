; global babysteps = (heat.heaters[0].active-65)/300
; echo global.babysteps

M290 S0.0 R0
echo "Current Chamber Temp :", sensors.analog[10].lastReading

if (heat.heaters[0].active-65)/(sensors.analog[10].lastReading*25) > -0.2 || (heat.heaters[0].active-65)/(sensors.analog[10].lastReading*25) < 0.2
	echo "Baby Step will set to :", (heat.heaters[0].active-65)/(sensors.analog[10].lastReading*25)
	M290 R0 S{(heat.heaters[0].active-65)/(sensors.analog[10].lastReading*25)} 
else
	echo "Baby Step out of range ! :", (heat.heaters[0].active-65)/(sensors.analog[10].lastReading*25)


; == old conditional code ==
;if sensors.analog[10].lastReading >= 40 
;	M290 R0 S{(heat.heaters[0].active-65)/600}
;	echo "Baby Step set to :", (heat.heaters[0].active-65)/600
;elif sensors.analog[10].lastReading < 30 
;	M290 R0 S{(heat.heaters[0].active-65)/290}
;	echo "Baby Step set to :", (heat.heaters[0].active-65)/290
;elif sensors.analog[10].lastReading < 40 
;	M290 R0 S{(heat.heaters[0].active-65)/450}
;	echo "Baby Step set to :", (heat.heaters[0].active-65)/450