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
	LCDWriteCommand(0x38);/*设置8位格式，2行，5x7*/
	LCDWriteCommand(0x38);/*设置8位格式，2行，5x7*/
	LCDWriteCommand(0x38);/*设置8位格式，2行，5x7，有的液晶做的不好，写三遍保险！！！！*/ 
	LCDWriteCommand(0x0c);/*整体显示，关光标，不闪烁*/ 
	LCDWriteCommand(0x06);/*设定输入方式，增量不移位*/
	LCDWriteCommand(0x01);/*清除屏幕显示*/	  
	DelayN40us(100);	  /*清屏延时*/ 
}
void LCDWriteCommand(unsigned char dat)
{
	LCD_DB=dat;
	LCD_RS=0;/*选择写指令*/	 
	LCD_RW=0;/*写入指令值*/	 
	LCD_E=1; /*使能LCD1602*/ 	 
	LCD_E=0;
	DelayN40us(1);/*写命令延时*/   
}
void LCDWriteData(unsigned char dat)	  //写数据函数 
{
	LCD_DB=dat;
	LCD_RS=1;/*选择写数据*/	  
	LCD_RW=0;/*写入数据值*/	  
	LCD_E=1; /*使能LCD1602*/  
	LCD_E=0;
	DelayN40us(1);/*写数据延时*/ 
}

void LCDDispChar(unsigned char x,unsigned char y,unsigned char dat)
{
	unsigned char address;
	if(y==1)
	         address=0x80+x;	 /*显示在第一排的时候的x的地址*/ 
	else
	         address=0xc0+x;	 /*显示在第二排的时候的x的地址*/ 
	LCDWriteCommand(address);	 /*输入地址*/ 
	LCDWriteData(dat);		 	 /*输入数据*/ 
}

void LCDDispNum(unsigned char x,unsigned char y,unsigned char dat)
{
	unsigned char address;
	if(y==1)
	         address=0x80+x;	 /*显示在第一排的时候的x的地址*/ 
	else
	         address=0xc0+x;	 /*显示在第二排的时候的x的地址*/ 
	LCDWriteCommand(address);	 /*输入地址*/ 
	LCDWriteData(dat+48);		 /*输入数据*/ 
}
void LCDDispString(unsigned char x,unsigned char y,unsigned char *string)
{
	while(*string != 0)	           /*没有检测到字符串结尾时*/
	{
		LCDDispChar(x,y,*string++);/*逐个显示字符串*/
		x++;					   /*行地址加1*/
	}
}

