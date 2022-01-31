; test.g
; testing macro parameters

echo {job.filePosition}
echo {job.file.size}
echo {job.filePosition/job.file.size}

if {job.filePosition/job.file.size}>=0.0
  M117 "AKM print completed 10%"
; end if

if {job.filePosition/job.file.size}>=0.0
	M117 "AKM print completed 10%"

;if {job.filePosition/job.file.size}>=0.1
;	M117 "AKM print completed 10%"
