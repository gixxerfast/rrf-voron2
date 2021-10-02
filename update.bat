@rem Update the URL below to match the name you've set at M550 in sys/config.g!
@rem The .local suffix is automatically added to that name.

wget --ftp-user=admin -r -nH ftp://voron2.local/filaments
wget --ftp-user=admin -r -nH ftp://voron2.local/macros
wget --ftp-user=admin -r -nH ftp://voron2.local/menu
wget --ftp-user=admin -r -nH ftp://voron2.local/sys

del .\sys\*.bak
del .\sys\*.bin
del .\sys\*.gz
del .\sys\*.old
del .\sys\filaments.csv
del .\sys\heightmap.csv
del .\sys\dwc2settings.json
del .\sys\dwc-settings.json
del .\sys\resurrect.g
