
_init:

;MyProject.c,15 :: 		void init(){
;MyProject.c,17 :: 		TRISA=0b001000;
	MOVLW      8
	MOVWF      TRISA+0
;MyProject.c,18 :: 		PortA=0b000101;
	MOVLW      5
	MOVWF      PORTA+0
;MyProject.c,20 :: 		OSCCON=0b01110100;
	MOVLW      116
	MOVWF      OSCCON+0
;MyProject.c,22 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSP1ADD+0
	CALL       _I2C1_Init+0
;MyProject.c,23 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_init0:
	DECFSZ     R13, 1
	GOTO       L_init0
	DECFSZ     R12, 1
	GOTO       L_init0
	DECFSZ     R11, 1
	GOTO       L_init0
	NOP
	NOP
;MyProject.c,25 :: 		UART1_Init(115200);
	BSF        BAUDCON+0, 3
	MOVLW      16
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,26 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_init1:
	DECFSZ     R13, 1
	GOTO       L_init1
	DECFSZ     R12, 1
	GOTO       L_init1
	DECFSZ     R11, 1
	GOTO       L_init1
	NOP
	NOP
;MyProject.c,27 :: 		UART1_Write_Text("SF,1\r");           //Factory default
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr1_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,28 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_init2:
	DECFSZ     R13, 1
	GOTO       L_init2
	DECFSZ     R12, 1
	GOTO       L_init2
	DECFSZ     R11, 1
	GOTO       L_init2
	NOP
	NOP
;MyProject.c,29 :: 		UART1_Write_Text("SR,32000000\r");    //Enable MLDP, Enable UART flow control
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr2_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,30 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_init3:
	DECFSZ     R13, 1
	GOTO       L_init3
	DECFSZ     R12, 1
	GOTO       L_init3
	DECFSZ     R11, 1
	GOTO       L_init3
	NOP
	NOP
;MyProject.c,31 :: 		UART1_Write_Text("R,1\r");            //Reboot
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr3_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,32 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_init4:
	DECFSZ     R13, 1
	GOTO       L_init4
	DECFSZ     R12, 1
	GOTO       L_init4
	DECFSZ     R11, 1
	GOTO       L_init4
	NOP
;MyProject.c,33 :: 		}//_____________________________________________________________________________
L_end_init:
	RETURN
; end of _init

_set_I2CRegs:

;MyProject.c,35 :: 		void set_I2CRegs(){
;MyProject.c,37 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,38 :: 		I2C1_Wr(0x3C);
	MOVLW      60
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,39 :: 		I2C1_Wr(0x00);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,40 :: 		I2C1_Wr(0x14);
	MOVLW      20
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,41 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,43 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,44 :: 		I2C1_Wr(0x3C);
	MOVLW      60
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,45 :: 		I2C1_Wr(0x02);
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,46 :: 		I2C1_Wr(0x00);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,47 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,49 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,50 :: 		I2C1_Wr(0x3C);
	MOVLW      60
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,51 :: 		I2C1_Wr(0x01);
	MOVLW      1
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,52 :: 		I2C1_Wr(0x80);
	MOVLW      128
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,53 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,55 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,56 :: 		I2C1_Wr(0x32);
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,57 :: 		I2C1_Wr(0x20);
	MOVLW      32
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,58 :: 		I2C1_Wr(0x27);
	MOVLW      39
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,59 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,61 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,62 :: 		I2C1_Wr(0x32);
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,63 :: 		I2C1_Wr(0x23);
	MOVLW      35
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,64 :: 		I2C1_Wr(0x20);
	MOVLW      32
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,65 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,66 :: 		}//_____________________________________________________________________________
L_end_set_I2CRegs:
	RETURN
; end of _set_I2CRegs

_Accelerometer:

;MyProject.c,68 :: 		void Accelerometer(void){
;MyProject.c,70 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,71 :: 		I2C1_Wr(0x32);                         // device address with +W
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,72 :: 		I2C1_Wr(0x29);
	MOVLW      41
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,73 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;MyProject.c,74 :: 		I2C1_Wr(0x33);                         // device address with +R
	MOVLW      51
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,75 :: 		AX = I2C1_Rd (0) << 8;
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	MOVWF      _AX+1
	CLRF       _AX+0
;MyProject.c,76 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,78 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,79 :: 		I2C1_Wr(0x32);                         // device address with +W
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,80 :: 		I2C1_Wr(0x28);
	MOVLW      40
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,81 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;MyProject.c,82 :: 		I2C1_Wr(0x33);                         // device address with +R
	MOVLW      51
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,83 :: 		AX =((int)(AX + I2C1_Rd (0)))/256;
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	ADDWF      _AX+0, 1
	MOVLW      0
	ADDWFC     _AX+1, 1
	MOVF       _AX+1, 0
	MOVWF      _AX+0
	MOVLW      0
	BTFSC      _AX+1, 7
	MOVLW      255
	MOVWF      _AX+1
;MyProject.c,84 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,85 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Accelerometer5:
	DECFSZ     R13, 1
	GOTO       L_Accelerometer5
	DECFSZ     R12, 1
	GOTO       L_Accelerometer5
	NOP
;MyProject.c,87 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,88 :: 		I2C1_Wr(0x32);                         // device address with +W
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,89 :: 		I2C1_Wr(0x2B);
	MOVLW      43
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,90 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;MyProject.c,91 :: 		I2C1_Wr(0x33);                         // device address with +R
	MOVLW      51
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,92 :: 		AY = I2C1_Rd (0) << 8;
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	MOVWF      _AY+1
	CLRF       _AY+0
;MyProject.c,93 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,95 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,96 :: 		I2C1_Wr(0x32);                         // device address with +W
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,97 :: 		I2C1_Wr(0x2A);
	MOVLW      42
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,98 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;MyProject.c,99 :: 		I2C1_Wr(0x33);                         // device address with +R
	MOVLW      51
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,100 :: 		AY =((int) (AY + I2C1_Rd (0)))/256;
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	ADDWF      _AY+0, 1
	MOVLW      0
	ADDWFC     _AY+1, 1
	MOVF       _AY+1, 0
	MOVWF      _AY+0
	MOVLW      0
	BTFSC      _AY+1, 7
	MOVLW      255
	MOVWF      _AY+1
;MyProject.c,101 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,102 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Accelerometer6:
	DECFSZ     R13, 1
	GOTO       L_Accelerometer6
	DECFSZ     R12, 1
	GOTO       L_Accelerometer6
	NOP
;MyProject.c,104 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,105 :: 		I2C1_Wr(0x32);                         // device address with +W
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,106 :: 		I2C1_Wr(0x2D);
	MOVLW      45
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,107 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;MyProject.c,108 :: 		I2C1_Wr(0x33);                         // device address with +R
	MOVLW      51
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,109 :: 		AZ = I2C1_Rd (0) << 8;
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	MOVWF      _AZ+1
	CLRF       _AZ+0
;MyProject.c,110 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,112 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,113 :: 		I2C1_Wr(0x32);                         // device address with +W
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,114 :: 		I2C1_Wr(0x2C);
	MOVLW      44
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,115 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;MyProject.c,116 :: 		I2C1_Wr(0x33);                         // device address with +R
	MOVLW      51
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,117 :: 		AZ =((int) (AZ +I2C1_Rd (0)))/256;
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	ADDWF      _AZ+0, 1
	MOVLW      0
	ADDWFC     _AZ+1, 1
	MOVF       _AZ+1, 0
	MOVWF      _AZ+0
	MOVLW      0
	BTFSC      _AZ+1, 7
	MOVLW      255
	MOVWF      _AZ+1
;MyProject.c,118 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,119 :: 		}//_____________________________________________________________________________
L_end_Accelerometer:
	RETURN
; end of _Accelerometer

_Magnetometer:

;MyProject.c,121 :: 		void Magnetometer(void){
;MyProject.c,122 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;MyProject.c,123 :: 		I2C1_Wr(0x3C);                         // device address with +W
	MOVLW      60
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,124 :: 		I2C1_Wr(0x03);
	MOVLW      3
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,125 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;MyProject.c,126 :: 		I2C1_Wr(0x3D);                         // device address with +R
	MOVLW      61
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MyProject.c,127 :: 		MX =((int) ((I2C1_Rd (1) << 8) + I2C1_Rd (1)))/16;
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	MOVWF      FLOC__Magnetometer+1
	CLRF       FLOC__Magnetometer+0
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	ADDWF      FLOC__Magnetometer+0, 0
	MOVWF      _MX+0
	MOVLW      0
	ADDWFC     FLOC__Magnetometer+1, 0
	MOVWF      _MX+1
	MOVLW      4
	MOVWF      R0
	MOVF       R0, 0
L__Magnetometer118:
	BTFSC      STATUS+0, 2
	GOTO       L__Magnetometer119
	ASRF       _MX+1, 1
	RRF        _MX+0, 1
	ADDLW      255
	GOTO       L__Magnetometer118
L__Magnetometer119:
;MyProject.c,128 :: 		MZ =((int) ((I2C1_Rd (1) << 8) + I2C1_Rd (1)))/16;
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	MOVWF      FLOC__Magnetometer+1
	CLRF       FLOC__Magnetometer+0
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	ADDWF      FLOC__Magnetometer+0, 0
	MOVWF      _MZ+0
	MOVLW      0
	ADDWFC     FLOC__Magnetometer+1, 0
	MOVWF      _MZ+1
	MOVLW      4
	MOVWF      R0
	MOVF       R0, 0
L__Magnetometer120:
	BTFSC      STATUS+0, 2
	GOTO       L__Magnetometer121
	ASRF       _MZ+1, 1
	RRF        _MZ+0, 1
	ADDLW      255
	GOTO       L__Magnetometer120
L__Magnetometer121:
;MyProject.c,129 :: 		MY =((int) ((I2C1_Rd (1) << 8) + I2C1_Rd (0)))/16;
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	MOVWF      FLOC__Magnetometer+1
	CLRF       FLOC__Magnetometer+0
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0, 0
	ADDWF      FLOC__Magnetometer+0, 0
	MOVWF      _MY+0
	MOVLW      0
	ADDWFC     FLOC__Magnetometer+1, 0
	MOVWF      _MY+1
	MOVLW      4
	MOVWF      R0
	MOVF       R0, 0
L__Magnetometer122:
	BTFSC      STATUS+0, 2
	GOTO       L__Magnetometer123
	ASRF       _MY+1, 1
	RRF        _MY+0, 1
	ADDLW      255
	GOTO       L__Magnetometer122
L__Magnetometer123:
;MyProject.c,130 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;MyProject.c,131 :: 		}//_____________________________________________________________________________
L_end_Magnetometer:
	RETURN
; end of _Magnetometer

_IsReadable:

;MyProject.c,133 :: 		void  IsReadable(){
;MyProject.c,134 :: 		if((abs(AX)+abs(AY)+abs(AZ))>25 ||
	MOVF       _AX+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _AX+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FLOC__IsReadable+0
	MOVF       R1, 0
	MOVWF      FLOC__IsReadable+1
	MOVF       _AY+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _AY+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	ADDWF      FLOC__IsReadable+0, 1
	MOVF       R1, 0
	ADDWFC     FLOC__IsReadable+1, 1
	MOVF       _AZ+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _AZ+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	ADDWF      FLOC__IsReadable+0, 0
	MOVWF      R2
	MOVF       R1, 0
	ADDWFC     FLOC__IsReadable+1, 0
	MOVWF      R3
;MyProject.c,135 :: 		(abs(AX)<14 && abs(AY)<14 && abs(AZ)<14)||
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      R3, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__IsReadable125
	MOVF       R2, 0
	SUBLW      25
L__IsReadable125:
	BTFSS      STATUS+0, 0
	GOTO       L__IsReadable107
	MOVF       _AX+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _AX+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVLW      128
	XORWF      R1, 0
	MOVWF      R2
	MOVLW      128
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__IsReadable126
	MOVLW      14
	SUBWF      R0, 0
L__IsReadable126:
	BTFSC      STATUS+0, 0
	GOTO       L__IsReadable108
	MOVF       _AY+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _AY+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVLW      128
	XORWF      R1, 0
	MOVWF      R2
	MOVLW      128
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__IsReadable127
	MOVLW      14
	SUBWF      R0, 0
L__IsReadable127:
	BTFSC      STATUS+0, 0
	GOTO       L__IsReadable108
	MOVF       _AZ+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       _AZ+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVLW      128
	XORWF      R1, 0
	MOVWF      R2
	MOVLW      128
	SUBWF      R2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__IsReadable128
	MOVLW      14
	SUBWF      R0, 0
L__IsReadable128:
	BTFSC      STATUS+0, 0
	GOTO       L__IsReadable108
	GOTO       L__IsReadable107
L__IsReadable108:
;MyProject.c,136 :: 		bot==0){
	MOVLW      0
	XORWF      _bot+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__IsReadable129
	MOVLW      0
	XORWF      _bot+0, 0
L__IsReadable129:
	BTFSC      STATUS+0, 2
	GOTO       L__IsReadable107
	GOTO       L_IsReadable11
L__IsReadable107:
;MyProject.c,137 :: 		run=1;
	MOVLW      1
	MOVWF      _run+0
	MOVLW      0
	MOVWF      _run+1
;MyProject.c,138 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,139 :: 		}else{
	GOTO       L_IsReadable12
L_IsReadable11:
;MyProject.c,140 :: 		run=0;
	CLRF       _run+0
	CLRF       _run+1
;MyProject.c,141 :: 		}
L_IsReadable12:
;MyProject.c,142 :: 		}//_____________________________________________________________________________
L_end_IsReadable:
	RETURN
; end of _IsReadable

_GetAcc:

;MyProject.c,144 :: 		void GetAcc(){
;MyProject.c,145 :: 		if(Aacc==14||Aacc==18)acc=1;
	MOVLW      0
	XORWF      _Aacc+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetAcc131
	MOVLW      14
	XORWF      _Aacc+0, 0
L__GetAcc131:
	BTFSC      STATUS+0, 2
	GOTO       L__GetAcc110
	MOVLW      0
	XORWF      _Aacc+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetAcc132
	MOVLW      18
	XORWF      _Aacc+0, 0
L__GetAcc132:
	BTFSC      STATUS+0, 2
	GOTO       L__GetAcc110
	GOTO       L_GetAcc15
L__GetAcc110:
	MOVLW      1
	MOVWF      _acc+0
	MOVLW      0
	MOVWF      _acc+1
	GOTO       L_GetAcc16
L_GetAcc15:
;MyProject.c,146 :: 		else if(Aacc==15||Aacc==17)acc=2;
	MOVLW      0
	XORWF      _Aacc+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetAcc133
	MOVLW      15
	XORWF      _Aacc+0, 0
L__GetAcc133:
	BTFSC      STATUS+0, 2
	GOTO       L__GetAcc109
	MOVLW      0
	XORWF      _Aacc+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetAcc134
	MOVLW      17
	XORWF      _Aacc+0, 0
L__GetAcc134:
	BTFSC      STATUS+0, 2
	GOTO       L__GetAcc109
	GOTO       L_GetAcc19
L__GetAcc109:
	MOVLW      2
	MOVWF      _acc+0
	MOVLW      0
	MOVWF      _acc+1
	GOTO       L_GetAcc20
L_GetAcc19:
;MyProject.c,147 :: 		else if(Aacc==16)acc=3;
	MOVLW      0
	XORWF      _Aacc+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetAcc135
	MOVLW      16
	XORWF      _Aacc+0, 0
L__GetAcc135:
	BTFSS      STATUS+0, 2
	GOTO       L_GetAcc21
	MOVLW      3
	MOVWF      _acc+0
	MOVLW      0
	MOVWF      _acc+1
	GOTO       L_GetAcc22
L_GetAcc21:
;MyProject.c,148 :: 		else acc=0;
	CLRF       _acc+0
	CLRF       _acc+1
L_GetAcc22:
L_GetAcc20:
L_GetAcc16:
;MyProject.c,149 :: 		}//_____________________________________________________________________________
L_end_GetAcc:
	RETURN
; end of _GetAcc

_GetBot:

;MyProject.c,151 :: 		void GetBot(){
;MyProject.c,152 :: 		if(AX>13 && AX<19){
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _AX+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetBot137
	MOVF       _AX+0, 0
	SUBLW      13
L__GetBot137:
	BTFSC      STATUS+0, 0
	GOTO       L_GetBot25
	MOVLW      128
	XORWF      _AX+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetBot138
	MOVLW      19
	SUBWF      _AX+0, 0
L__GetBot138:
	BTFSC      STATUS+0, 0
	GOTO       L_GetBot25
L__GetBot113:
;MyProject.c,153 :: 		Aacc=AX;
	MOVF       _AX+0, 0
	MOVWF      _Aacc+0
	MOVF       _AX+1, 0
	MOVWF      _Aacc+1
;MyProject.c,154 :: 		bot=1;
	MOVLW      1
	MOVWF      _bot+0
	MOVLW      0
	MOVWF      _bot+1
;MyProject.c,155 :: 		}else if(AX<-13 && AX>-19){
	GOTO       L_GetBot26
L_GetBot25:
	MOVLW      128
	XORWF      _AX+1, 0
	MOVWF      R0
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetBot139
	MOVLW      243
	SUBWF      _AX+0, 0
L__GetBot139:
	BTFSC      STATUS+0, 0
	GOTO       L_GetBot29
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      _AX+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetBot140
	MOVF       _AX+0, 0
	SUBLW      237
L__GetBot140:
	BTFSC      STATUS+0, 0
	GOTO       L_GetBot29
L__GetBot112:
;MyProject.c,156 :: 		Aacc=-AX;
	MOVF       _AX+0, 0
	SUBLW      0
	MOVWF      _Aacc+0
	MOVF       _AX+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _Aacc+1
	SUBWF      _Aacc+1, 1
;MyProject.c,157 :: 		bot=2;
	MOVLW      2
	MOVWF      _bot+0
	MOVLW      0
	MOVWF      _bot+1
;MyProject.c,158 :: 		}else if(AY>13 && AY<19){
	GOTO       L_GetBot30
L_GetBot29:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _AY+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetBot141
	MOVF       _AY+0, 0
	SUBLW      13
L__GetBot141:
	BTFSC      STATUS+0, 0
	GOTO       L_GetBot33
	MOVLW      128
	XORWF      _AY+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetBot142
	MOVLW      19
	SUBWF      _AY+0, 0
L__GetBot142:
	BTFSC      STATUS+0, 0
	GOTO       L_GetBot33
L__GetBot111:
;MyProject.c,159 :: 		Aacc=AY;
	MOVF       _AY+0, 0
	MOVWF      _Aacc+0
	MOVF       _AY+1, 0
	MOVWF      _Aacc+1
;MyProject.c,160 :: 		bot=3;
	MOVLW      3
	MOVWF      _bot+0
	MOVLW      0
	MOVWF      _bot+1
;MyProject.c,161 :: 		}else bot=0;
	GOTO       L_GetBot34
L_GetBot33:
	CLRF       _bot+0
	CLRF       _bot+1
L_GetBot34:
L_GetBot30:
L_GetBot26:
;MyProject.c,162 :: 		}//_____________________________________________________________________________
L_end_GetBot:
	RETURN
; end of _GetBot

_GetDirection:

;MyProject.c,164 :: 		void GetDirection(){
;MyProject.c,165 :: 		switch(bot){
	GOTO       L_GetDirection35
;MyProject.c,167 :: 		case 1:
L_GetDirection37:
;MyProject.c,168 :: 		if(MY<-7){
	MOVLW      128
	XORWF      _MY+1, 0
	MOVWF      R0
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection144
	MOVLW      249
	SUBWF      _MY+0, 0
L__GetDirection144:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection38
;MyProject.c,169 :: 		dir=270;
	MOVLW      14
	MOVWF      _dir+0
	MOVLW      1
	MOVWF      _dir+1
;MyProject.c,170 :: 		}else if(MY<-4){
	GOTO       L_GetDirection39
L_GetDirection38:
	MOVLW      128
	XORWF      _MY+1, 0
	MOVWF      R0
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection145
	MOVLW      252
	SUBWF      _MY+0, 0
L__GetDirection145:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection40
;MyProject.c,171 :: 		if(MZ>0) dir=225;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection146
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection146:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection41
	MOVLW      225
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection42
L_GetDirection41:
;MyProject.c,172 :: 		else dir=315;
	MOVLW      59
	MOVWF      _dir+0
	MOVLW      1
	MOVWF      _dir+1
L_GetDirection42:
;MyProject.c,173 :: 		}else if( MY<1){
	GOTO       L_GetDirection43
L_GetDirection40:
	MOVLW      128
	XORWF      _MY+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection147
	MOVLW      1
	SUBWF      _MY+0, 0
L__GetDirection147:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection44
;MyProject.c,174 :: 		if(MZ>0) dir=180;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection148
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection148:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection45
	MOVLW      180
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection46
L_GetDirection45:
;MyProject.c,175 :: 		else dir=0;
	CLRF       _dir+0
	CLRF       _dir+1
L_GetDirection46:
;MyProject.c,176 :: 		}else if(MY<5){
	GOTO       L_GetDirection47
L_GetDirection44:
	MOVLW      128
	XORWF      _MY+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection149
	MOVLW      5
	SUBWF      _MY+0, 0
L__GetDirection149:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection48
;MyProject.c,177 :: 		if(MZ>0) dir=135;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection150
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection150:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection49
	MOVLW      135
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection50
L_GetDirection49:
;MyProject.c,178 :: 		else dir=45;
	MOVLW      45
	MOVWF      _dir+0
	MOVLW      0
	MOVWF      _dir+1
L_GetDirection50:
;MyProject.c,179 :: 		}else if(MY>4){
	GOTO       L_GetDirection51
L_GetDirection48:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MY+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection151
	MOVF       _MY+0, 0
	SUBLW      4
L__GetDirection151:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection52
;MyProject.c,180 :: 		dir=90;
	MOVLW      90
	MOVWF      _dir+0
	MOVLW      0
	MOVWF      _dir+1
;MyProject.c,181 :: 		}
L_GetDirection52:
L_GetDirection51:
L_GetDirection47:
L_GetDirection43:
L_GetDirection39:
;MyProject.c,182 :: 		break;
	GOTO       L_GetDirection36
;MyProject.c,184 :: 		case 2:
L_GetDirection53:
;MyProject.c,185 :: 		if(MY>5){
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MY+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection152
	MOVF       _MY+0, 0
	SUBLW      5
L__GetDirection152:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection54
;MyProject.c,186 :: 		dir=270;
	MOVLW      14
	MOVWF      _dir+0
	MOVLW      1
	MOVWF      _dir+1
;MyProject.c,187 :: 		}else if(MY>2){
	GOTO       L_GetDirection55
L_GetDirection54:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MY+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection153
	MOVF       _MY+0, 0
	SUBLW      2
L__GetDirection153:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection56
;MyProject.c,188 :: 		if(MZ>0) dir=225;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection154
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection154:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection57
	MOVLW      225
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection58
L_GetDirection57:
;MyProject.c,189 :: 		else dir=315;
	MOVLW      59
	MOVWF      _dir+0
	MOVLW      1
	MOVWF      _dir+1
L_GetDirection58:
;MyProject.c,190 :: 		}else if(MY>-4){
	GOTO       L_GetDirection59
L_GetDirection56:
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      _MY+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection155
	MOVF       _MY+0, 0
	SUBLW      252
L__GetDirection155:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection60
;MyProject.c,191 :: 		if(MZ>0) dir=180;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection156
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection156:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection61
	MOVLW      180
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection62
L_GetDirection61:
;MyProject.c,192 :: 		else dir=0;
	CLRF       _dir+0
	CLRF       _dir+1
L_GetDirection62:
;MyProject.c,193 :: 		}else if(MY>-7){
	GOTO       L_GetDirection63
L_GetDirection60:
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      _MY+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection157
	MOVF       _MY+0, 0
	SUBLW      249
L__GetDirection157:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection64
;MyProject.c,194 :: 		if(MZ>0) dir=135;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection158
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection158:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection65
	MOVLW      135
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection66
L_GetDirection65:
;MyProject.c,195 :: 		else dir=45;
	MOVLW      45
	MOVWF      _dir+0
	MOVLW      0
	MOVWF      _dir+1
L_GetDirection66:
;MyProject.c,196 :: 		}else if(MY<-6){
	GOTO       L_GetDirection67
L_GetDirection64:
	MOVLW      128
	XORWF      _MY+1, 0
	MOVWF      R0
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection159
	MOVLW      250
	SUBWF      _MY+0, 0
L__GetDirection159:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection68
;MyProject.c,197 :: 		dir=90;
	MOVLW      90
	MOVWF      _dir+0
	MOVLW      0
	MOVWF      _dir+1
;MyProject.c,198 :: 		}
L_GetDirection68:
L_GetDirection67:
L_GetDirection63:
L_GetDirection59:
L_GetDirection55:
;MyProject.c,199 :: 		break;
	GOTO       L_GetDirection36
;MyProject.c,201 :: 		case 3:
L_GetDirection69:
;MyProject.c,202 :: 		if(MX>3){
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MX+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection160
	MOVF       _MX+0, 0
	SUBLW      3
L__GetDirection160:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection70
;MyProject.c,203 :: 		dir=270;
	MOVLW      14
	MOVWF      _dir+0
	MOVLW      1
	MOVWF      _dir+1
;MyProject.c,204 :: 		}else if(MX>0){
	GOTO       L_GetDirection71
L_GetDirection70:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MX+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection161
	MOVF       _MX+0, 0
	SUBLW      0
L__GetDirection161:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection72
;MyProject.c,205 :: 		if(MZ>0) dir=225;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection162
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection162:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection73
	MOVLW      225
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection74
L_GetDirection73:
;MyProject.c,206 :: 		else dir=315;
	MOVLW      59
	MOVWF      _dir+0
	MOVLW      1
	MOVWF      _dir+1
L_GetDirection74:
;MyProject.c,207 :: 		}else if(MX>-7){
	GOTO       L_GetDirection75
L_GetDirection72:
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      _MX+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection163
	MOVF       _MX+0, 0
	SUBLW      249
L__GetDirection163:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection76
;MyProject.c,208 :: 		if(MZ>0) dir=180;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection164
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection164:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection77
	MOVLW      180
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection78
L_GetDirection77:
;MyProject.c,209 :: 		else dir=0;
	CLRF       _dir+0
	CLRF       _dir+1
L_GetDirection78:
;MyProject.c,210 :: 		}else if(MX>-11){
	GOTO       L_GetDirection79
L_GetDirection76:
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	XORWF      _MX+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection165
	MOVF       _MX+0, 0
	SUBLW      245
L__GetDirection165:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection80
;MyProject.c,211 :: 		if(MZ>0) dir=135;
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _MZ+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection166
	MOVF       _MZ+0, 0
	SUBLW      0
L__GetDirection166:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection81
	MOVLW      135
	MOVWF      _dir+0
	CLRF       _dir+1
	GOTO       L_GetDirection82
L_GetDirection81:
;MyProject.c,212 :: 		else dir=45;
	MOVLW      45
	MOVWF      _dir+0
	MOVLW      0
	MOVWF      _dir+1
L_GetDirection82:
;MyProject.c,213 :: 		}else if(MX<-10){
	GOTO       L_GetDirection83
L_GetDirection80:
	MOVLW      128
	XORWF      _MX+1, 0
	MOVWF      R0
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection167
	MOVLW      246
	SUBWF      _MX+0, 0
L__GetDirection167:
	BTFSC      STATUS+0, 0
	GOTO       L_GetDirection84
;MyProject.c,214 :: 		dir=90;
	MOVLW      90
	MOVWF      _dir+0
	MOVLW      0
	MOVWF      _dir+1
;MyProject.c,215 :: 		}
L_GetDirection84:
L_GetDirection83:
L_GetDirection79:
L_GetDirection75:
L_GetDirection71:
;MyProject.c,216 :: 		break;
	GOTO       L_GetDirection36
;MyProject.c,234 :: 		}
L_GetDirection35:
	MOVLW      0
	XORWF      _bot+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection168
	MOVLW      1
	XORWF      _bot+0, 0
L__GetDirection168:
	BTFSC      STATUS+0, 2
	GOTO       L_GetDirection37
	MOVLW      0
	XORWF      _bot+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection169
	MOVLW      2
	XORWF      _bot+0, 0
L__GetDirection169:
	BTFSC      STATUS+0, 2
	GOTO       L_GetDirection53
	MOVLW      0
	XORWF      _bot+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GetDirection170
	MOVLW      3
	XORWF      _bot+0, 0
L__GetDirection170:
	BTFSC      STATUS+0, 2
	GOTO       L_GetDirection69
L_GetDirection36:
;MyProject.c,235 :: 		}//_____________________________________________________________________________
L_end_GetDirection:
	RETURN
; end of _GetDirection

_main:

;MyProject.c,237 :: 		void main() {
;MyProject.c,238 :: 		init();
	CALL       _init+0
;MyProject.c,239 :: 		set_I2CRegs();
	CALL       _set_I2CRegs+0
;MyProject.c,240 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_main85:
	DECFSZ     R13, 1
	GOTO       L_main85
	DECFSZ     R12, 1
	GOTO       L_main85
	DECFSZ     R11, 1
	GOTO       L_main85
	NOP
	NOP
;MyProject.c,241 :: 		while(1){
L_main86:
;MyProject.c,242 :: 		if(UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main88
;MyProject.c,243 :: 		read=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0, 0
	MOVWF      _read+0
;MyProject.c,244 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_main89:
	DECFSZ     R13, 1
	GOTO       L_main89
	DECFSZ     R12, 1
	GOTO       L_main89
	NOP
;MyProject.c,245 :: 		if(read=='s'){
	MOVF       _read+0, 0
	XORLW      115
	BTFSS      STATUS+0, 2
	GOTO       L_main90
;MyProject.c,246 :: 		if(i=0){
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main91
;MyProject.c,249 :: 		Delay_ms(1000);
L_main92:
	DECFSZ     R13, 1
	GOTO       L_main92
	DECFSZ     R12, 1
	GOTO       L_main92
	DECFSZ     R11, 1
	GOTO       L_main92
	NOP
	NOP
;MyProject.c,250 :: 		}
L_main91:
;MyProject.c,251 :: 		while(1){
L_main93:
;MyProject.c,252 :: 		Magnetometer();                   //Get Magnetometer Readings
	CALL       _Magnetometer+0
;MyProject.c,253 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main95:
	DECFSZ     R13, 1
	GOTO       L_main95
	DECFSZ     R12, 1
	GOTO       L_main95
	NOP
	NOP
;MyProject.c,254 :: 		Accelerometer();                  //Get Accelerometer Readings
	CALL       _Accelerometer+0
;MyProject.c,255 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main96:
	DECFSZ     R13, 1
	GOTO       L_main96
	DECFSZ     R12, 1
	GOTO       L_main96
	NOP
	NOP
;MyProject.c,256 :: 		GetBot();                       //Bottom detection
	CALL       _GetBot+0
;MyProject.c,257 :: 		IsReadable();                     //Readings Validity Check
	CALL       _IsReadable+0
;MyProject.c,258 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11
	MOVLW      113
	MOVWF      R12
	MOVLW      30
	MOVWF      R13
L_main97:
	DECFSZ     R13, 1
	GOTO       L_main97
	DECFSZ     R12, 1
	GOTO       L_main97
	DECFSZ     R11, 1
	GOTO       L_main97
	NOP
;MyProject.c,259 :: 		if(run==0){
	MOVLW      0
	XORWF      _run+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main172
	MOVLW      0
	XORWF      _run+0, 0
L__main172:
	BTFSS      STATUS+0, 2
	GOTO       L_main98
;MyProject.c,260 :: 		run=1;
	MOVLW      1
	MOVWF      _run+0
	MOVLW      0
	MOVWF      _run+1
;MyProject.c,261 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main99:
	DECFSZ     R13, 1
	GOTO       L_main99
	DECFSZ     R12, 1
	GOTO       L_main99
	NOP
	NOP
;MyProject.c,262 :: 		GetDirection();                 //Direction detection
	CALL       _GetDirection+0
;MyProject.c,263 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main100:
	DECFSZ     R13, 1
	GOTO       L_main100
	DECFSZ     R12, 1
	GOTO       L_main100
	NOP
	NOP
;MyProject.c,264 :: 		GetAcc();                       //Direction Accuracy
	CALL       _GetAcc+0
;MyProject.c,265 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_main101:
	DECFSZ     R13, 1
	GOTO       L_main101
	DECFSZ     R12, 1
	GOTO       L_main101
	NOP
	NOP
;MyProject.c,266 :: 		inttostr(acc, accS);
	MOVF       _acc+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _acc+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _accS+0
	MOVWF      FARG_IntToStr_output+0
	MOVLW      hi_addr(_accS+0)
	MOVWF      FARG_IntToStr_output+1
	CALL       _IntToStr+0
;MyProject.c,267 :: 		inttostr(dir, dirS);
	MOVF       _dir+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _dir+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _dirS+0
	MOVWF      FARG_IntToStr_output+0
	MOVLW      hi_addr(_dirS+0)
	MOVWF      FARG_IntToStr_output+1
	CALL       _IntToStr+0
;MyProject.c,268 :: 		UART1_Write_text("ID= ");       //Priniting on Tx
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr5_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,269 :: 		UART1_Write_text(id);
	MOVLW      _id+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_id+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,270 :: 		UART1_Write_text("   Dir=");
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr6_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,271 :: 		UART1_Write_text(dirS);
	MOVLW      _dirS+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_dirS+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,272 :: 		UART1_Write_text(",   Acc=");
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr7_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,273 :: 		UART1_Write_text(accS);
	MOVLW      _accS+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_accS+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,274 :: 		UART1_Write_text(",");
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr8_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,275 :: 		if(j>1){                        //Check If Moving
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main173
	MOVF       _j+0, 0
	SUBLW      1
L__main173:
	BTFSC      STATUS+0, 0
	GOTO       L_main102
;MyProject.c,276 :: 		UART1_Write_text(moving);
	MOVLW      _moving+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_moving+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,277 :: 		}else{
	GOTO       L_main103
L_main102:
;MyProject.c,278 :: 		UART1_Write_text(notmoving);
	MOVLW      _notmoving+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(_notmoving+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,279 :: 		}                               //reset Variables
L_main103:
;MyProject.c,280 :: 		acc=0;
	CLRF       _acc+0
	CLRF       _acc+1
;MyProject.c,281 :: 		dir=0;
	CLRF       _dir+0
	CLRF       _dir+1
;MyProject.c,282 :: 		bot=0;
	CLRF       _bot+0
	CLRF       _bot+1
;MyProject.c,283 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;MyProject.c,284 :: 		UART1_Write_text("\n");
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?lstr9_MyProject+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;MyProject.c,285 :: 		}
L_main98:
;MyProject.c,286 :: 		if(UART1_Data_Ready()){           //stop command
	CALL       _UART1_Data_Ready+0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main104
;MyProject.c,287 :: 		read=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0, 0
	MOVWF      _read+0
;MyProject.c,288 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_main105:
	DECFSZ     R13, 1
	GOTO       L_main105
	DECFSZ     R12, 1
	GOTO       L_main105
	NOP
;MyProject.c,289 :: 		if(read=='s'){
	MOVF       _read+0, 0
	XORLW      115
	BTFSS      STATUS+0, 2
	GOTO       L_main106
;MyProject.c,290 :: 		break;
	GOTO       L_main94
;MyProject.c,291 :: 		}
L_main106:
;MyProject.c,292 :: 		}
L_main104:
;MyProject.c,293 :: 		}
	GOTO       L_main93
L_main94:
;MyProject.c,294 :: 		}
L_main90:
;MyProject.c,295 :: 		}
L_main88:
;MyProject.c,296 :: 		}
	GOTO       L_main86
;MyProject.c,297 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
