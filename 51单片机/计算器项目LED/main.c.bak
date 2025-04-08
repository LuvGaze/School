#include <REGX52.H>
#include "Delay.h"
#include "LCD1602.h"
#include "MatriKey.h"
void main()
{
	unsigned char KeyNum,d;
	int k=0,i=0,g=1,j=0;
	long float a=0,b[10];
	LCD_Init();
	while(1)
	{
		KeyNum=MatrixKey();
		if(KeyNum!=16)
		{
			if(KeyNum<10)//输入数据
			{				
					a*=10;
					a+=KeyNum%10;
					k++;								
				LCD_ShowXiaoNum(1,g,a);//打印输入数据
				b[i]=a;
			}
			if(9<KeyNum&&KeyNum<15)//计算符号
			{
				j++;
				a=0;//清零输入数据
				k++;
				g=k+1;//下一个输入数据的位置
				if(j>1)//连续输入计算			
				{
					switch (d)
				{
					case 10:b[i]=b[i-1]+b[i];break;
					case 11:b[i]=b[i-1]-b[i];break;
					case 12:b[i]=b[i-1]*b[i];break;
					case 13:b[i]=b[i-1]/b[i];break;
				}                         
				}
				i++;
				d=KeyNum;
				switch (KeyNum)//打印计算符号
				{
					case 10:LCD_ShowString(1,k,"+");break;
					case 11:LCD_ShowString(1,k,"-");break;
					case 12:LCD_ShowString(1,k,"*");break;
					case 13:LCD_ShowString(1,k,"/");break;
					case 14:LCD_ShowString(1,k,".");break;
				}
			}
			if(KeyNum==15)//“=”输出
			{
				k++;
				LCD_ShowString(1,k,"=");//打印‘=’符号			
				switch (d)
				{
					case 10:b[i]=b[i-1]+b[i];break;
					case 11:b[i]=b[i-1]-b[i];break;
					case 12:b[i]=b[i-1]*b[i];break;
					case 13:b[i]=b[i-1]/b[i];break;
				}					                 
				LCD_ShowXiaoNum(2,1,b[i]);//打印计算结果
				break;
			}
		}
	}
	while(1);
}
