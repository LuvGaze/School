#include <regx52.H>

unsigned char SMG[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7c,0x39,0x5e,0x79,0x71};
unsigned int t=0;

void Delay(unsigned int ms)
{
	unsigned char i, j;
	while(ms--)
	{
		i = 2;
		j = 239;
		do
		{
			while (--j);
		} while (--i);
	}
}

void main()
{
	P2_4=0;P2_3=0;P2_2=0;
	while(1)
	{
		P0=SMG[t];
		Delay(500);
		t++;
		if(t==16)t=0;
	}
}
