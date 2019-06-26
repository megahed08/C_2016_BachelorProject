//Transmission Bracelet_________________________________________________________
//______________________________________________________________________________

int AX=0, AY=0, AZ=0, run=1,
Atemp=0, Aacc=0, i=0, j=0,
MX=0, MY=0, MZ=0,
acc=0, bot=0, dir=0;

unsigned char dirS [10], accS[10], botS[10];

char read, id[4]="B1,",
notmoving[13]="   NotMoving", moving[10]="   moving";
//______________________________________________________________________________
//Initializatios________________________________________________________________
void init(){
  //PortA initialization
  TRISA=0b001000;
  PortA=0b000101;
  //Internal Osc
  OSCCON=0b01110100;
  //I2C Init________________________
  I2C1_Init(100000);
  delay_ms(1000);
  //RN4020-Bluetooth Init___________
  UART1_Init(115200);
  Delay_ms(1000);
  UART1_Write_Text("SF,1\r");           //Factory default
  Delay_ms(1000);
  UART1_Write_Text("SR,32000000\r");    //Enable MLDP, Enable UART flow control
  Delay_ms(1000);
  UART1_Write_Text("R,1\r");            //Reboot
  Delay_ms(2000);
}//_____________________________________________________________________________
//defining the sensor Registers_________________________________________________
void set_I2CRegs(){
  //set CRA_REG_M register_________
    I2C1_Start();
    I2C1_Wr(0x3C);
    I2C1_Wr(0x00);
    I2C1_Wr(0x14);
    I2C1_Stop();
  //set MR_REG_M register__________
    I2C1_Start();
    I2C1_Wr(0x3C);
    I2C1_Wr(0x02);
    I2C1_Wr(0x00);
    I2C1_Stop();
  //set CRB_REG_M register__________
    I2C1_Start();
    I2C1_Wr(0x3C);
    I2C1_Wr(0x01);
    I2C1_Wr(0x80);
    I2C1_Stop();
  // set CTRL_REG1_A register______
    I2C1_Start();
    I2C1_Wr(0x32);
    I2C1_Wr(0x20);
    I2C1_Wr(0x27);
    I2C1_Stop();
  // set CTRL_REG4_A register______
    I2C1_Start();
    I2C1_Wr(0x32);
    I2C1_Wr(0x23);
    I2C1_Wr(0x20);
    I2C1_Stop();
}//_____________________________________________________________________________
//Reading Accelerometer values__________________________________________________
void Accelerometer(void){
    //read OUT_X_H_A_________________________
    I2C1_Start();
    I2C1_Wr(0x32);                         // device address with +W
    I2C1_Wr(0x29);
    I2C1_Repeated_Start();
    I2C1_Wr(0x33);                         // device address with +R
    AX = I2C1_Rd (0) << 8;
    I2C1_Stop();
  //read OUT_X_L_A_________________________
    I2C1_Start();
    I2C1_Wr(0x32);                         // device address with +W
    I2C1_Wr(0x28);
    I2C1_Repeated_Start();
    I2C1_Wr(0x33);                         // device address with +R
    AX =((int)(AX + I2C1_Rd (0)))/256;
    I2C1_Stop();
    Delay_ms(10);
  //read OUT_Y_H_A_________________________
    I2C1_Start();
    I2C1_Wr(0x32);                         // device address with +W
    I2C1_Wr(0x2B);
    I2C1_Repeated_Start();
    I2C1_Wr(0x33);                         // device address with +R
    AY = I2C1_Rd (0) << 8;
    I2C1_Stop();
  //read OUT_Y_L_A_________________________
    I2C1_Start();
    I2C1_Wr(0x32);                         // device address with +W
    I2C1_Wr(0x2A);
    I2C1_Repeated_Start();
    I2C1_Wr(0x33);                         // device address with +R
    AY =((int) (AY + I2C1_Rd (0)))/256;
    I2C1_Stop();
    Delay_ms(10);
  //read OUT_Z_H_A_________________________
    I2C1_Start();
    I2C1_Wr(0x32);                         // device address with +W
    I2C1_Wr(0x2D);
    I2C1_Repeated_Start();
    I2C1_Wr(0x33);                         // device address with +R
    AZ = I2C1_Rd (0) << 8;
    I2C1_Stop();
  //read OUT_Z_L_A_________________________
    I2C1_Start();
    I2C1_Wr(0x32);                         // device address with +W
    I2C1_Wr(0x2C);
    I2C1_Repeated_Start();
    I2C1_Wr(0x33);                         // device address with +R
    AZ =((int) (AZ +I2C1_Rd (0)))/256;
    I2C1_Stop();
}//_____________________________________________________________________________
//Reading Magnetometer values___________________________________________________
void Magnetometer(void){
    I2C1_Start();
    I2C1_Wr(0x3C);                         // device address with +W
    I2C1_Wr(0x03);
    I2C1_Repeated_Start();
    I2C1_Wr(0x3D);                         // device address with +R
    MX =((int) ((I2C1_Rd (1) << 8) + I2C1_Rd (1)))/16;
    MZ =((int) ((I2C1_Rd (1) << 8) + I2C1_Rd (1)))/16;
    MY =((int) ((I2C1_Rd (1) << 8) + I2C1_Rd (0)))/16;
    I2C1_Stop();
}//_____________________________________________________________________________
//Running Detection_____________________________________________________________
void  IsReadable(){
  if((abs(AX)+abs(AY)+abs(AZ))>25 ||
     (abs(AX)<14 && abs(AY)<14 && abs(AZ)<14)||
      bot==0){
    run=1;
    j++;
  }else{
    run=0;
  }
}//_____________________________________________________________________________
//Get Accuracy__________________________________________________________________
void GetAcc(){
  if(Aacc==14||Aacc==18)acc=1;
  else if(Aacc==15||Aacc==17)acc=2;
  else if(Aacc==16)acc=3;
  else acc=0;
}//_____________________________________________________________________________
//Get Bottom____________________________________________________________________
void GetBot(){
  if(AX>13 && AX<19){
    Aacc=AX;
    bot=1;
  }else if(AX<-13 && AX>-19){
    Aacc=-AX;
    bot=2;
  }else if(AY>13 && AY<19){
    Aacc=AY;
    bot=3;
  }else bot=0;
}//_____________________________________________________________________________
//Get Direction_________________________________________________________________
void GetDirection(){
  switch(bot){
    //AX+ve---------------------
    case 1:
      if(MY<-7){
        dir=270;
      }else if(MY<-4){
        if(MZ>0) dir=225;
        else dir=315;
      }else if( MY<1){
        if(MZ>0) dir=180;
        else dir=0;
      }else if(MY<5){
        if(MZ>0) dir=135;
        else dir=45;
      }else if(MY>4){
        dir=90;
      }
      break;
    //AX-ve---------------------
    case 2:
      if(MY>5){
        dir=270;
      }else if(MY>2){
        if(MZ>0) dir=225;
        else dir=315;
      }else if(MY>-4){
        if(MZ>0) dir=180;
        else dir=0;
      }else if(MY>-7){
        if(MZ>0) dir=135;
        else dir=45;
      }else if(MY<-6){
        dir=90;
      }
      break;
     //AY+ve---------------------------
     case 3:
      if(MX>3){
        dir=270;
      }else if(MX>0){
        if(MZ>0) dir=225;
        else dir=315;
      }else if(MX>-7){
        if(MZ>0) dir=180;
        else dir=0;
      }else if(MX>-11){
        if(MZ>0) dir=135;
        else dir=45;
      }else if(MX<-10){
        dir=90;
      }
      break;
     /*  //AY-ve---------------------
     case 4:
      if(MX>2){
        dir=90;
      }else if(MX<3){
        if(MZ>0) dir=135;
        else dir=45;
      }else if(MX<-5){
        if(MZ>0) dir=180;
        else dir=0;
      }else if(MX<-13){
        if(MZ>0) dir=225;
        else dir=315;
      }else if(MX<-17){
        dir=270;
      }
      break;   */
  }
}//_____________________________________________________________________________
//Main Code_____________________________________________________________________
void main() {
  init();
  set_I2CRegs();
  Delay_ms(500);
  while(1){
    if(UART1_Data_Ready()){
      read=UART1_Read();
      Delay_ms(10);
      if(read=='s'){
        if(i=0){
          i++;
          UART1_Write_text("I\r");
          Delay_ms(1000);
        }
        while(1){
          Magnetometer();                   //Get Magnetometer Readings
          Delay_ms(50);
          Accelerometer();                  //Get Accelerometer Readings
          Delay_ms(50);
          GetBot();                       //Bottom detection
          IsReadable();                     //Readings Validity Check
          Delay_ms(3000);
          if(run==0){
            run=1;
            Delay_ms(50);
            GetDirection();                 //Direction detection
            Delay_ms(50);
            GetAcc();                       //Direction Accuracy
            Delay_ms(50);
            inttostr(acc, accS);
            inttostr(dir, dirS);
            UART1_Write_text("ID= ");       //Priniting on Tx
            UART1_Write_text(id);
            UART1_Write_text("   Dir=");
            UART1_Write_text(dirS);
            UART1_Write_text(",   Acc=");
            UART1_Write_text(accS);
            UART1_Write_text(",");
            if(j>1){                        //Check If Moving
              UART1_Write_text(moving);
            }else{
              UART1_Write_text(notmoving);
            }                               //reset Variables
            acc=0;
            dir=0;
            bot=0;
            j=0;
            UART1_Write_text("\n");
          }
          if(UART1_Data_Ready()){           //stop command
            read=UART1_Read();
            Delay_ms(10);
            if(read=='s'){
              break;
            }
          }
        }
      }
    }
  }
}