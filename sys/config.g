; Configuration file for Duet 3 Mini 5+ (firmware version 3.3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.3.2 on Mon Sep 13 2021 16:36:36 GMT+0200 (centraleuropeisk sommartid)
; Based on configuration by OC-Geek

; General preferences
M111 S0                	; Debugging off
G21                    	; Work in millimetres
G90                     ; send absolute coordinates...
M83                     ; ...but relative extruder moves

M669 K1                 ; select CoreXY mode

; Limit axis				
M564 S1 H1             	; Forbid axis movements when not homed
; H1	Forbid movement of axes that have not been homed
; S1	Limit movement within axis boundaries

; Wait a moment for the CAN expansion boards to start
G4 S2

; ================================== 
; Fysetc 12864 display Color
; ==================================

M918 P2 R6 C30 E4 F200000  	; Configure direct-connect display
; P2  	128x64 display using ST7567 display driver chip
; R6  	Display resistor ratio, in range 1 to 7. Only used with ST7567-based displays. 
;		The default value of 6 is suitable for the Fysetc Mini 12864 display. 
; C30	Display contrast, in range 0 to 100
; E4	The number of pulses generated by the rotary encoder per detent. Typical values are 2 and 4
; F...	SPI clock frequency in Hz, default 2000000 (i.e. 2MHz)

M150 X2 R0 U255 B0 P200 S3   ; Set LED colours
; X2 		LED type: X0 (default) = DotStar, X1 = NeoPixel, X2 = Panel 12864
; R,U,B		Set the LED colour (note Fystec uses GRB space instead ... (Red and Green switched over)
; S3 		Number of individual LEDs to set to these colours

; ================================== 
; NETWORK
; ==================================

; Need to set up WIFI
; M587 S"SSID" P"PWD" 
; This needs to be as a first step via USB like when fw ver is checked 
; It is permanently stored in the card after that
; https://duet3d.dozuki.com/Guide/1.)+Getting+Connected+to+your+Duet

; Network
M550 P"voron2"          ; set printer name
M552 S1                                          ; enable network
M586 P0 S1                                       ; enable HTTP (for DWC)
M586 P1 S1                                       ; enable FTP (for remote backups)
M586 P2 S1                                       ; disable Telnet

; ================================== 
; DRIVERS
; ==================================

; --- Z Drive map ---
;    B_______A
;    | 1 | 2 |
;    | ----- |
;    | 0 | 3 |
;     -------
;      front
;
; (looking at the printer from the top)

; Driver directions
; M569: Set motor driver direction, enable polarity and step pulse timing
; This command has LOT of parameters ... e.g. stealthChop2 ...
; Pnnn 		Motor driver number
; Snnn		Direction of movement 0 = backwards, 1 = forwards (default 1)

M569 P121.0 S1                                   ; E - physical drive 121.0 goes forwards

M569 P0.0 S1 D2                                  ; A -> Y - physical drive 0.0 goes forwards
M569 P0.1 S1 D2                                  ; B -> X - physical drive 0.1 goes forwards

M569 P0.3 S1                                     ; Z0 - physical drive 0.3 goes forwards
M569 P0.4 S0                                     ; Z1 - physical drive 0.4 goes backwards
M569 P0.5 S1                                     ; Z2 - physical drive 0.5 goes forwards
M569 P0.6 S0                                     ; Z3 - physical drive 0.6 goes backwards

M584 X0.0 Y0.1 Z0.3:0.4:0.5:0.6 E121.0           ; set drive mapping
M350 X16 Y16 Z16 E16 I1                          ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E400.00                ; set steps per mm

; Accelerations and speed are set in separate macro
M98 P"/macros/set_normal_speed.g"

; Stepper driver currents
; set motor currents (mA) and motor idle factor in per cent
; Drive currents
M906 X1600 Y1600 Z1200 E500 I70 ; XYZ and E current
M84 S120                        ; Idle timeout

; ==================================
; Endstops						
; ==================================

; Xn,Yn endstop: 0 = none, 1 = low end, 2 = high end
; Snnn 	1 = switch-type (eg microswitch) endstop input 
;		2 = Z probe (when used to home an axis other than Z)
;		3 = single motor load detection
;		4 = multiple motor load detection (see Notes)
; P"pin_name"

; Endstops
M574 X2 S1 P"121.io0.in"                       ; configure active-high endstop for high end on X via pin 121.io0.in
M574 Y2 S1 P"0.io1.in"                         ; configure active-high endstop for high end on Y via pin io1.in
M574 Z0 p"nil"                                  ; No Z endstop
                                                ; Extruder never stops :-)

; Axis travel limits                            ; Mind this is travel NOT print area
M208 X0:300 Y0:305 Z-5:265                       ; Set axis minima - negative X is to have 0,0 on bed corner
                                                ; WARNING on Z not to hit the roof - this is set here

; Belt Locations
M671 X-65:-65:365:365 Y0:395:395:0 S20      ; Define Z belts locations (Front_Left, Back_Left, Back_Right, Front_Right)
											; Position of the bed leadscrews.. 4 Coordinates
											; Snn Maximum correction to apply to each leadscrew in mm (optional, default 1.0)
                                            ; S20 - 20 mm spacing
M557 X30:270 Y30:270 P7                     ; Define bed mesh grid (inductive probe, positions include the Y offset!)

; ==================================
; Bed heater
; ==================================
M308 S0 A"Bed Heater" P"temp0" Y"thermistor" T100000 B3950     ; configure sensor 0 as thermistor on pin temp0
;M308 S0 P"temp1" Y"thermistor" T100000 B3950     ; configure sensor 0 as thermistor on pin temp1
M950 H0 C"out0" Q10 T0                               ; create bed heater output on out0 and map it to sensor 0
M307 H0 R0.620 K0.495:0.000 D0.91 E1.35 S1.00 B0
;M307 H0 B0 R0.637 C222.4 D0.95 S1.00 V24.0
;M307 H0 B0 R0.602 C315.3 D0.89 S1.00 V24.0
;M307 H0 B1 S1.00                                ; Enable bang-bang mode for the bed heater and set PWM limit
M140 H0                                          ; map heated bed to heater 0
M143 H0 S120                                     ; set temperature limit for heater 0 to 120C

M308 S2 A"Extra Bed Temp" P"temp1" Y"thermistor" T100000 B3950     ; configure sensor 2 as thermistor on pin temp0
M143 H2 S130

; ==================================
; Hotend heater 
; ==================================
;M308 S1 P"121.temp0" Y"thermistor" T100000 B4267 ; configure sensor 1 as thermistor on pin 121.temp0
M308 S1 P"121.temp0" Y"pt1000"                   ; configure sensor 1 as pt1000 on pin 121.temp0
M950 H1 C"121.out0" T1                           ; create nozzle heater output on 121.out0 and map it to sensor 1
M307 H1 B0 R2.638 C196.3 D6.34 S1.00 V24.2       ; NF Coated Copper nozzle 0.4
;M307 H1 B0 R2.406 C188.5 D6.38 S1.00 V24.2       ; HF CHT Nozzle 0.6
;M307 H1 R2.796 K0.530:0.000 D6.11 E1.35 S1.00 B0 V23.9
;M307 H1 R2.897 K0.551:0.000 D6.38 E1.35 S1.00 B0 V23.9
;M307 H1 B0 R2.518 C174.0 D6.14 S1.00 V23.8
;M307 H1 B0 R3.409 C154.0 D3.92 S1.00 V23.8
;M307 H1 B0 S1.00                                 ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                     ; set temperature limit for heater 1 to 280C

; ==================================
; SENSORS MISC 
; ==================================

; Define MCU sensors which will be available in DWC Extra View
M308 S3 A"MCU" Y"mcu-temp" 				; Officially NOT supported on Mini 3 5+ however seem to work
M308 S4 A"Duet Drivers" Y"drivers" 		; This is not really working as it is just a threshold crossing

; ==================================
; CHAMBER SENSOR 
; ==================================
M308 S10 A"Chamber" P"0.temp2" Y"thermistor" T100000 B3950

; ==================================
; Z PROBES K0 (Klicky mag probe) and K1 (Microswitch Z0)
; ==================================

; M558: Set Z probe type
	; P5/P8 	select a switch by default (normally closed) for bed probing between the In and Gnd pins of the Z-probe connector
	; C			specifies the input pin and the optional modulation pin. This parameter is mandatory
	; Tnnn 		Travel speed to and between probe points (mm/min)
	; Fnnn 		Feed rate (i.e. probing speed, mm/min) e.g. 60 is one mm per second
	; Hnnn 		Dive height (mm)
	; Annn 		Maximum number of times to probe each point, default 1
	; Snnn 		Tolerance when probing multiple times, default 0.03mm
	; Rnnn 		Z probe recovery time before the probing move is started , default zero (seconds)
	; B0		B1 Turn off all heaters while probing, default (B0) leaves heaters on.
	; I0		Invert (I1) or do not invert (I0, default) the Z probe reading

; G31: Set Current Probe status
	; K0		Z Probe Number
	; Pnnn 		Trigger value
	; Xnn Ynn 	Probe offset (from Noozle)
	; Znnn 		Trigger Z height - Set the said Z when the probe triggers !!

; MAG PROBE (GND, IO)
; -----------
; This is the mag probe with microswitch in Afterburner
M558 K0 P8 C"121.io2.in" T18000 F180 H10 A10 S0.0025
G31 K0 P500 X0 Y20 Z9 ;Z7.438

; Z-SWITCH
; -----------
; This is the microswitch which is pressed by the Noozle
M558 K1 P8 C"io5.in" T18000 F180 H3 A10 S0.0025 R0
; Omron micro switch
G31 K1 P500 X0 Y0 Z1.20

; ==================================
; Part cooling fan
; ==================================
M950 F0 C"121.out1"                              ; create fan 0 on pin 121.out1 and set its frequency
M106 P0 S0 H-1                                   ; set fan 0 value. Thermostatic control is turned off

; ==================================
; Hotend fan
; ==================================
M950 F1 C"121.out2"                              ; create fan 1 on pin 121.out2 and set its frequency
M106 P1 S1 H1 T45                                ; set fan 1 value. Thermostatic control is turned on

; ==================================
; MCU fan
; ==================================
M950 F2 C"!0.out4+0.out4.tach" Q25000              ; create fan 2 on pin out4 and set its frequency
M106 P2 H3:4 L0.2 X1.0 T30:50 C"Controller fan 1"  ; controlled by Sensor 3 - MCU
;M106 P2 H-1 C"Controller fan 1" 

; ==================================
; Controller bay fan
; ==================================
M950 F3 C"!0.out3+0.out3.tach" Q25000              ; create fan 3 on pin out3 and set its frequency
M106 P3 H0 L0.2 X0.7 T60:120 C"Controller fan 2"
;M106 P3 H-1 C"Controller fan 2"

; ==================================
; Nevermore Filter fans
; ==================================
M950 F4 C"0.out5"                                ; create fan 4 on pin 0.out5 and set its frequency
M106 P4 H0 S0.65 T65 C"Nevermore fan"            ; set fan 4 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1                                    ; define tool 0
G10 P0 X0 Y0 Z0                                  ; set tool 0 axis offsets
G10 P0 R0 S0                                     ; set initial tool 0 active and standby temperatures to 0C

M955 P121.0 I05

; Input shaper
;M593 P"mzv" F47
;M593 P"zvdd" F70 S0.1
M593 P"mzv" F44

; Pressure advance
M572 D0 S0.035

; Custom settings are not defined

; defines global variables
M98 P"/macros/define_global_vars.g"

; Load override parameters
M501

T0
