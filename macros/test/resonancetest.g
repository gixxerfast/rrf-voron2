var title = "Klipper style vibration test V0.3"
var axis="X"
var datarate=1320
var stime = state.upTime
var min_freq = 5.0
var max_freq = 10000/75
var accel_per_hz = 75
var hz_per_sec = 1
var freq = var.min_freq
var max_accel = var.max_freq * var.accel_per_hz
var X = 150.0
var Y = 150.0
var sign = 1.0
var t_seg = 0
var accel = 0
var max_v = 0
var L = 0
var nX = 0
var old_freq = 0
var filename = "/gcodes/vtest_" ^ var.axis ^ ".gcode"
echo "max_accel " ^ var.max_accel ^ " min freq " ^ var.min_freq ^ " max freq " ^ var.max_freq
echo >{var.filename} " "
echo >>{var.filename} "M201 X" ^ var.max_accel ^ " Y" ^ var.max_accel
echo >>{var.filename} "M205 X0 Y0"
echo >>{var.filename} "G91"
echo >>{var.filename} "M400"
echo >>{var.filename} "G4 S1"
echo >>{var.filename} "M956 P121.0 A0 S" ^ (var.max_freq - var.min_freq) * var.datarate * var.hz_per_sec 

echo "Testing " ^ floor(var.freq)
echo >>{var.filename} "echo " ^ var.freq
while var.freq < var.max_freq + 0.000001
  set var.t_seg = 0.25 / var.freq
  set var.accel = var.accel_per_hz * var.freq
  set var.max_v = var.accel * var.t_seg
  echo >>{var.filename} "M204 P" ^ var.accel ^ " T" ^ var.accel
  set var.L = 0.5 * var.accel * (var.t_seg*var.t_seg)
  set var.nX = (var.sign * var.L)
  echo >>{var.filename} "G1 " ^ var.axis ^ var.nX ^ " F" ^ var.max_v*60
  echo >>{var.filename} "G1 " ^ var.axis ^ -var.nX
  set var.sign = -var.sign
  set var.old_freq = var.freq
  set var.freq = var.freq + (2. * var.t_seg * var.hz_per_sec)
  if floor(var.freq) > floor(var.old_freq)
    ;echo >> var.filename "echo " ^ floor(var.freq)
    echo "Testing " ^ floor(var.freq)
echo >>{var.filename} "G90"
echo "total time " ^ state.upTime - var.stime