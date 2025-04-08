#ifndef __LCD_H_
#define __LCD_H_

#include<reg51.h>

//---ט֨ӥژݼՊ---//
#ifndef uchar
#define uchar unsigned char
#endif

#ifndef uint 
#define uint unsigned int
#endif

/**********************************
PINࠚ֨ӥ
**********************************/
#define LCD1602_DATAPINS P0
sbit LCD1602_E=P1^3;
sbit LCD1602_RW=P1^1;
sbit LCD1602_RS=P1^2;

/**********************************
گ˽ʹķ
**********************************/
/*՚51եƬܺ12MHZʱדЂքғʱگ˽*/
void Lcd1602_Delay1ms(uint c);   //ϳӮ 0us
/*LCD1602дɫ8λļ®ؓگ˽*/
void LcdWriteCom(uchar com);
/*LCD1602дɫ8λ˽ߝؓگ˽*/	
void LcdWriteData(uchar dat)	;
/*LCD1602ԵʼۯؓԌѲ*/		
void LcdInit();						  

#endif
