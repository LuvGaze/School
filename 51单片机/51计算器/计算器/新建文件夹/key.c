#include "reg52.h"
#include "key.h"
#define keydata P2

sbit key1 = P3^0;
sbit key2 = P3^1;

void delay1ms(void)   
{
    unsigned char a,b,c;
    for(c=1;c>0;c--)
        for(b=142;b>0;b--)
            for(a=2;a>0;a--);
}


//дݼ׵ܘֵ
//  1   2   3   13
//  4   5   6   16
//  7   8   9   19
//  10  0   12  22
//ϞдЂ -1



char keyscan()    //
{
	  char Dat;
		keydata = 0xf0;
	 if(keydata != 0xf0)
	 {
			delay1ms();
		   if(keydata != 0xf0)
			 {
					switch(keydata)
					{
						case 0xe0:Dat=1;break;
						case 0xd0:Dat=2;break;
						case 0xb0:Dat=3;break;
						case 0x70:Dat=13;break;
					}

					keydata = 0x0f;
					
					switch(keydata)
					{
						case 0x0e:Dat+=0;break;
						case 0x0d:Dat+=3;break;
						case 0x0b:Dat+=6;break;
						case 0x07:Dat+=9;break;
					}
					
				while(keydata != 0x0f);	
				if(Dat!=11)	return Dat;
					else return 0;
			 }
	   
	 }
	 if(key1==0)
	 {
		delay1ms();
		 if(key1==0)
		 {
			while(key1==0);
			 return 11;
		 }
	 }
	 if(key2==0)
	 {
		delay1ms();
		 if(key2==0)
		 {
			while(key2==0);
			 return 14;
		 }
	 }
     return -1;
}