
var count = 0

if exists(global.a)
  set global.a = 3.0
else
  global a = 3.0
;end if

while var.count < 3

  echo "Hello world. Count:  ", {var.count}
  
  var param = 42
  echo "Param: ", {var.param}
  
  set var.count = {var.count + 1}
  
  var b = 1.44555
  
  var c = {var.b - global.a}
  echo "a - b: ", {var.c}
  
;end while