#include <reg52.h>

sbit P1_0=P1^0;
sbit P1_1=P1^1;

void Delay(unsigned int xms)
{
	unsigned char i, j;
	while(xms--)
	{
		i = 2;
		j = 239;
		do
		{
			while (--j);
		} while (--i);
	}
}

unsigned char key,a=0;

void main()
{
	while(1)
	{
		
			Delay(10);
			if(P1_0==0)
			{
				key=1;
			}
			else if(P1_1==0)
			{
				key=2;
			}
		}
		switch(key)
		{
			case 1:a=0xf0;break;
			case 2:a=0xaa;break;
			default:a=0xff;break;
		}
		P0 = ~a; // 将LED_STATUS取反后输出至P0口以控制LED的亮灭
        key = 0;
}