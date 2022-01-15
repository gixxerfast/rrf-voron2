; test.g
; testing macro parameters

;If {param.Z} = null
; abort "ABORT - missing Z."
if exists(param.Z)
  echo "Got Z!"
if {!exists(param.Z)}
  abort "Not got Z!"
if !{{param.Z} < 100}
  abort "ABORT - Invalid Z position."
echo "Tests passed"
