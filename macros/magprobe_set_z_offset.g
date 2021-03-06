echo "Setting MagProbe offset to bed center"

M98 P"/macros/magprobe_attach.g"

G29 S2

; move to the center of the mesh with the PROBE (mind affset in Y is 25 above noozle)
G90
G1 X150 Y130 Z15 F6000

echo "Testing mag probe offset"
while iterations <= 5
  G30 K0 S-1
  G1 Z10 F3000
;end while

echo "Setting Probe Offset now"
G30 K0 ;S-3
G1 Z15 F3000

;M98 P"/macros/magprobe_dock.g"