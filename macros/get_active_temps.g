; gets bed and hot end set active temps

if exists(global.bed_temp)
	set global.bed_temp = heat.heaters[0].active
else
	global bed_temp = heat.heaters[0].active

if exists(global.hotend_temp)
	set global.hotend_temp = heat.heaters[1].active	
else
	global hotend_temp = heat.heaters[1].active

echo "Bed Active Temp = " , global.bed_temp
echo "HotEnd Active Temp = " , global.hotend_temp
