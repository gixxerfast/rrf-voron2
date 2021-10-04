var val0 = 0.0000000
var val1 = 0.0000000
var val2 = 0.0000000
var val3 = 0.0000000
var val4 = 0.0000000
var retries = 5
var maxstddev = 0.003
var probe = 1
var probe_height = 5
var ignore_first = false

; Check macro parameter for probe number
if exists(param.K)
  echo "Probe number: ", {param.K}
  set var.probe = {param.K}
;end if

; Check macro parameter for number of retries. Default 5
if exists(param.A)
  echo "Number of retries: ", {param.A}
  set var.retries = {param.A}
;end if

; Check macro parameter for max standrad deviation. Default 0.003
if exists(param.S)
  echo "Max standard deviation: ", {param.S}
  set var.maxstddev = {param.S}
;end if

; check macro parameter for probe height. Default 5 mm relative probe point
if exists(param.H)
  echo "Probe height: ", {param.H}
  set var.probe_height = {param.H}
;end if

; check macro parameter for flag to ignore first sample. Default 0 (false)
if exists(param.I)
  echo "Ignore first sample: ", {param.I}
  if {param.I} == 0
    set var.ignore_first = false
  elif {param.I} == 1
    set var.ignore_first = true
  else
    echo "Warning: Invalid parameter I (ignore first samle): " {param.I}
  ;end if

while true
  echo "Iterations: ", iterations
  if iterations == {var.retries}
    abort "Too many measuring attempts"
  ;end if

  if iterations == 0 && var.ignore_first == true
    M400
    G30 K{var.probe} S-01
    M400
  
    G91
    G1 Z{var.probe_height} F99999
    G90
    M400

    echo "Ignoring first sample"
  ;end if
  

  M400
  G30 K{var.probe} S-01
  set var.val0 = sensors.probes[{var.probe}].lastStopHeight
  M400
  
  G91
  G1 Z{var.probe_height} F99999
  G90
  M400

  G30 K{var.probe} S-01
  set var.val1 = sensors.probes[{var.probe}].lastStopHeight
  M400

  G91
  G1 Z{var.probe_height} F99999
  G90
  M400

  G30 K{var.probe} S-01
  set var.val2 = sensors.probes[{var.probe}].lastStopHeight
  M400

  G91
  G1 Z{var.probe_height} F99999
  G90
  M400

  G30 K{var.probe} S-01
  set var.val3 = sensors.probes[{var.probe}].lastStopHeight
  M400

  G91
  G1 Z{var.probe_height} F99999
  G90
  M400

  G30 K{var.probe} S-01
  set var.val4 = sensors.probes[{var.probe}].lastStopHeight
  M400

  G91
  G1 Z{var.probe_height} F99999
  G90
  M400


  var mean = (var.val0 + var.val1 + var.val2 + var.val3 + var.val4)/5

  var delta0 = var.mean - var.val0
  var delta1 = var.mean - var.val1
  var delta2 = var.mean - var.val2
  var delta3 = var.mean - var.val3
  var delta4 = var.mean - var.val4

  var delta_sqr0 = {var.delta0 * var.delta0}
  var delta_sqr1 = {var.delta1 * var.delta1}
  var delta_sqr2 = {var.delta2 * var.delta2}
  var delta_sqr3 = {var.delta3 * var.delta3}
  var delta_sqr4 = {var.delta4 * var.delta4}

  var stddev = sqrt((var.delta_sqr0 + var.delta_sqr1 + var.delta_sqr2 + var.delta_sqr3 + var.delta_sqr4)/4) 

  echo "Standard deviation: ", {var.stddev}
  if var.stddev <= {var.maxstddev}
    if !exists(global.macro_call_result)
      global macro_call_result = {var.mean}
    else
      set global.macro_call_result = {var.mean}
    ;end if
    break
  ;end if
  
; end loop

