#include <reg52.h>

sbit P1_0 = P1^0;

void Timer0_Init(void)
{
	TMOD &= 0xF0;		//设置定时器模式
	TMOD |= 0x01;		//设置定时器模式
	TL0 = 0x66;		//设置定时初值
	TH0 = 0xFC;		//设置定时初值
	TF0 = 0;		//清除TF0标志
	TR0 = 1;		//定时器0开始计时
	ET0=1;
	EA=1;
	PT0=0;
}

void Delay(unsigned int x)
{
	unsigned char i,j;
	while(x--)
	{
		i = 2;
		j = 239;
		do
		{
			while (--j);
		} while (--i);
	}
}

unsigned int moshi=0;			// 0右移	1左移
unsigned int a=0,b=0;

void LED()
{
	switch(moshi)
	{
		case 0:P2=0x80>>a;a++;if(a==8)a=0;b=8-a;break;	// 右移
		case 1:P2=0x01<<b;b++;if(b==8)b=0;a=8-b;break;	// 左移
	}
}

void main()
{
	Timer0_Init();
	while(1)
	{
		if(P1_0==1)
		{	
			Delay(20);
			while(P1_0==1);
			Delay(20);
			moshi=1-moshi;
		}
	}
}
unsigned int count = 922;
void Timer0() interrupt 1
{
	TL0 = 0x66;
	TH0 = 0xFC;
	count++;
	if(count>922)			//	1000ms*(11.0592/12)≈922
	{
		LED();
		count = 0;
	}
}