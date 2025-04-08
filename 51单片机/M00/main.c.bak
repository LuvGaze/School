#include <REGX52.H>
#include "LCD1602.h"
#include "Delay.h"
#include "MatrixKey.h"
void main()
{
	unsigned char KeyNum;
	unsigned char Num=0;//一个数第几位
	unsigned int Mat=0;//计算几个数
	char Str[20];//把第几位的符号存在数组中
	long int Ch[20];//存储最后结果
	long int a[20];
	long int Result=0;//计算结果
	long int Sum=0;
	unsigned int i=1;
	unsigned int j=0;
    unsigned int flag1=0,flag2=0;
	LCD_Init();
 	while(1)
	{
		KeyNum=MatrixKey();
		if(KeyNum)
		{
			switch(KeyNum)
			{	
				case 1:Num++;LCD_ShowChar(1,Num,'1');Result=Result*10+1;break;
				case 2:Num++;LCD_ShowChar(1,Num,'2');Result=Result*10+2;break;
				case 3:Num++;LCD_ShowChar(1,Num,'3');Result=Result*10+3;break;
				case 4:Num++;LCD_ShowChar(1,Num,'+');Mat++;Str[Mat]='+';a[Mat]=Result;Result=0;break;
				case 5:Num++;LCD_ShowChar(1,Num,'4');Result=Result*10+4;break;
				case 6:Num++;LCD_ShowChar(1,Num,'5');Result=Result*10+5;break;
				case 7:Num++;LCD_ShowChar(1,Num,'6');Result=Result*10+6;break;
				case 8:Num++;LCD_ShowChar(1,Num,'-');Mat++;Str[Mat]='-';a[Mat]=Result;Result=0;break;
				case 9:Num++;LCD_ShowChar(1,Num,'7');Result=Result*10+7;break;
				case 10:Num++;LCD_ShowChar(1,Num,'8');Result=Result*10+8;break;
				case 11:Num++;LCD_ShowChar(1,Num,'9');Result=Result*10+9;break;
				case 12:Num++;LCD_ShowChar(1,Num,'*');Mat++;Str[Mat]='*';a[Mat]=Result;Result=0;break;
				case 13:Num=0;LCD_Init();Mat=0;Result=0;break;
				case 14:Num++;LCD_ShowChar(1,Num,'0');Result=Result*10+0;break;
				case 15:Num++;LCD_ShowChar(1,Num,'=');Mat++;Str[Mat]='=';a[Mat]=Result;Result=0;break;
				case 16:Num++;LCD_ShowChar(1,Num,'/');Mat++;Str[Mat]='/';a[Mat]=Result;Result=0;break;	
			}	
			if(KeyNum==15)
			{
				Sum=a[1];//初始值
				for(i=1;i<=Mat;i++)
				{
					if(Str[i]=='+')
					Sum=Sum+a[i+1];
					else if(Str[i]=='-')
					Sum=Sum-a[i+1];
					else if(Str[i]=='*')
					Sum=Sum*a[i+1];
					else if(Str[i]=='/')
					Sum=Sum/a[i+1];
                    if(a[i+1]==0){LCD_ShowString(2,1,"error");flag1=1;}//被除数不能为0
				}