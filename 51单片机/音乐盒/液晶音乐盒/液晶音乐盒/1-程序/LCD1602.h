#ifndef _LCD1602_H_
#define _LCD1602_H_
#define LCD_DB     P0	/*数据信号*/ 
sbit   LCD_RS=P2^0;	    /*片选信号*/ 
sbit   LCD_RW=P2^1;	    /*读写信号*/ 
sbit   LCD_E=P2^2; 	    /*使能信号*/ 
void DelayN40us(unsigned int n);
void LCDInit(void);
void LCDDispString(unsigned char x,unsigned char y,unsigned char *string);   
void LCDDispChar(unsigned char x,unsigned char y,unsigned char dat);
void LCDDispNum(unsigned char x,unsigned char y,unsigned char dat); 
void LCDWriteCommand(unsigned char command); 
void LCDWriteData(unsigned char dat);	   
void DelayN40us(unsigned int n);
#endif 