G1 Z5 F3000
M98 P"/macros/goto_z_switch.g"

; echo "Z-Swicth temp : " , sensors.analog[5].lastReading

echo "Testing Z Switch trigger height"

G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1
G1 Z2
G30 K1 S-1

G1 Z5
