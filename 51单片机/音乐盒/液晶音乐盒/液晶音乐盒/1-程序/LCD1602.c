#include"reg52.h"
#include"LCD1602.h"
void DelayN40us(unsigned int n)
{
	unsigned int i;
	unsigned char j;            
	for(i=n;i>0;i--)
		for(j=0;j<150;j++);          
}
void LCDInit(void)	
{
	LCDWriteCommand(0x38);/*����8λ��ʽ��2�У�5x7*/
	LCDWriteCommand(0x38);/*����8λ��ʽ��2�У�5x7*/
	LCDWriteCommand(0x38);/*����8λ��ʽ��2�У�5x7���е�Һ�����Ĳ��ã�д���鱣�գ�������*/ 
	LCDWriteCommand(0x0c);/*������ʾ���ع�꣬����˸*/ 
	LCDWriteCommand(0x06);/*�趨���뷽ʽ����������λ*/
	LCDWriteCommand(0x01);/*�����Ļ��ʾ*/	  
	DelayN40us(100);	  /*������ʱ*/ 
}
void LCDWriteCommand(unsigned char dat)
{
	LCD_DB=dat;
	LCD_RS=0;/*ѡ��дָ��*/	 
	LCD_RW=0;/*д��ָ��ֵ*/	 
	LCD_E=1; /*ʹ��LCD1602*/ 	 
	LCD_E=0;
	DelayN40us(1);/*д������ʱ*/   
}
void LCDWriteData(unsigned char dat)	  //д���ݺ��� 
{
	LCD_DB=dat;
	LCD_RS=1;/*ѡ��д����*/	  
	LCD_RW=0;/*д������ֵ*/	  
	LCD_E=1; /*ʹ��LCD1602*/  
	LCD_E=0;
	DelayN40us(1);/*д������ʱ*/ 
}

void LCDDispChar(unsigned char x,unsigned char y,unsigned char dat)
{
	unsigned char address;
	if(y==1)
	         address=0x80+x;	 /*��ʾ�ڵ�һ�ŵ�ʱ���x�ĵ�ַ*/ 
	else
	         address=0xc0+x;	 /*��ʾ�ڵڶ��ŵ�ʱ���x�ĵ�ַ*/ 
	LCDWriteCommand(address);	 /*�����ַ*/ 
	LCDWriteData(dat);		 	 /*��������*/ 
}

void LCDDispNum(unsigned char x,unsigned char y,unsigned char dat)
{
	unsigned char address;
	if(y==1)
	         address=0x80+x;	 /*��ʾ�ڵ�һ�ŵ�ʱ���x�ĵ�ַ*/ 
	else
	         address=0xc0+x;	 /*��ʾ�ڵڶ��ŵ�ʱ���x�ĵ�ַ*/ 
	LCDWriteCommand(address);	 /*�����ַ*/ 
	LCDWriteData(dat+48);		 /*��������*/ 
}
void LCDDispString(unsigned char x,unsigned char y,unsigned char *string)
{
	while(*string != 0)	           /*û�м�⵽�ַ�����βʱ*/
	{
		LCDDispChar(x,y,*string++);/*�����ʾ�ַ���*/
		x++;					   /*�е�ַ��1*/
	}
}

