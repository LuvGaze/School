
#include"reg52.h"
#include"LCD1602.h"

sbit play_up=P1^3;	   
sbit play_down=P3^5; 
sbit pause=P3^2;       
sbit power=P3^3;       
sbit speaker=P1^0;     
unsigned char timer0h,timer0l,time;
unsigned char music_num;    
unsigned int num;
unsigned int haomiao=0,miao=0;
signed int fre;                 
bit play_enable,power_enable=0;               
void delay(unsigned char t);	   
void delayms(unsigned int t);	  
void song(void);		         
void music_play(void);	       

unsigned char code song1[]={
     5,2,1, 3,2,1, 2,2,2, 2,2,4, 3,2,1, 1,2,1, 2,2,1, 3,2,4, 
	 5,2,1, 3,2,1, 2,2,2, 2,2,2, 5,1,1, 3,2,1, 4,2,1, 3,2,4, 
	 3,2,1, 3,2,1, 7,2,1, 3,2,1, 2,2,2, 1,2,1, 7,1,1, 1,2,1, 
	 2,2,1, 3,2,1, 6,2,3, 6,1,1, 1,2,1, 3,2,1, 2,2,1, 6,1,1, 
	 1,2,1, 7,1,1, 5,1,1, 6,1,6, 5,2,1, 3,2,1, 2,2,2, 2,2,1, 
	 2,2,1, 3,2,1, 1,2,1, 2,2,1, 3,2,4, 5,2,1, 3,2,1, 2,2,2, 
	 2,2,1, 2,2,1, 5,1,1, 3,2,1, 4,2,1, 3,2,4, 3,2,1, 3,2,1, 
	 7,2,3, 3,2,1, 2,2,2, 1,2,1, 7,1,1, 1,2,1, 2,2,1, 3,2,1, 
	 6,2,3, 6,1,1, 1,2,1, 3,2,1, 2,2,1, 6,1,1, 1,2,1, 7,1,2, 
	 5,1,2, 6,1,6, 0,0,0 };

unsigned char code song2[]={
     5,1,1, 2,2,1, 3,2,2, 2,2,1, 3,2,1, 5,2,1, 6,2,1, 5,2,3, 1,2,1, 2,2,1, 
	 3,2,1, 6,2,1, 5,2,1, 3,2,1, 5,2,3, 5,2,1, 6,2,1, 1,3,2, 6,2,1, 5,2,1, 
	 3,2,1, 5,2,1, 3,2,2, 1,2,1, 2,2,1, 3,2,1, 1,2,1, 6,1,1, 3,2,1, 2,2,1, 
	 5,1,1, 2,2,1, 3,2,2, 2,2,1, 3,2,1, 5,2,1, 6,2,1, 5,2,3, 1,2,1, 2,2,1, 
	 3,2,1, 6,2,1, 5,2,3, 5,2,1, 6,2,1, 1,3,2, 6,2,1, 
	 5,2,1, 3,2,1, 5,2,1, 3,2,2, 1,2,1, 6,1,1, 3,2,1, 2,2,1, 1,2,1, 6,1,1, 
	 1,2,1, 2,2,1, 2,2,1, 1,2,4, 0,0,0 };


unsigned char code song3[]={
     5,1,1, 1,2,1, 2,2,1, 3,2,1, 2,2,1, 3,2,1, 4,2,1, 5,2,1, 5,2,1, 5,2,1, 
	 4,2,1, 3,2,1, 2,2,3, 5,1,1, 1,2,1, 2,2,1, 3,2,1, 4,2,1, 5,2,1, 5,2,1, 
	 5,2,1, 6,2,1, 5,2,2, 2,2,1, 3,2,1, 1,2,2, 1,2,1, 6,1,1, 2,2,1, 2,2,1, 
	 3,2,1, 3,2,1, 1,2,1, 5,2,1, 1,2,1, 5,2,1, 1,2,1, 7,1,1, 1,2,1, 1,2,1, 6,1,1, 
	 2,2,1, 2,2,1, 3,2,1, 3,2,1, 5,2,1, 5,2,1, 
	 5,2,1, 6,2,1, 5,2,2, 2,2,1, 3,2,1, 1,2,2,  
	 5,1,1, 1,2,1, 2,1,2, 3,2,1, 2,2,1, 3,2,1, 4,2,1, 5,2,1, 5,2,1, 5,2,1, 
	 4,2,1, 3,2,1, 2,2,3, 5,1,1, 1,2,1, 2,2,1, 3,2,1, 2,2,1, 3,2,1, 4,2,1, 
	 5,2,1, 5,2,1, 5,2,2, 2,2,1, 3,2,1, 1,2,2, 1,2,1, 6,1,1, 2,2,1, 2,2,1, 
	 3,2,1, 3,2,1, 1,2,2, 5,2,1, 1,2,1, 5,2,1, 5,2,1, 7,1,1, 1,2,1, 0,0,0 };


unsigned char code song4[]={
     6,2,3, 5,2,1, 3,2,2, 5,2,2, 1,3,2, 6,2,1,
     5,2,1,6,2,4, 3,2,2, 5,2,1, 6,2,1, 5,2,2, 3,2,2, 1,2,1,6,1,1, 5,2,1, 
	 3,2,1, 2,2,4, 2,2,3, 3,2,1, 5,2,2, 5,2,1, 6,2,1, 3,2,2, 2,2,2, 
	 1,2,4, 5,2,3, 3,2,1,2,2,1, 1,2,1, 6,1,1, 1,2,1, 5,1,6, 0,0,0};

unsigned char code song5[]={
     3,2,2, 3,2,1, 4,2,1, 3,2,2, 2,2,1, 1,2,1,  2,2,2, 5,2,2, 2,2,2, 2,2,3,
	 1,2,2, 1,2,1, 2,2,1, 1,2,2, 7,1,1, 6,1,1, 7,1,2, 3,2,2, 7,1,2, 7,1,3, 
	 6,1,2, 2,2,1, 3,2,1, 2,2,1, 1,2,1, 6,1,2, 5,1,2, 2,2,1, 3,2,1, 2,2,1, 
	 1,2,1, 6,1,2, 6,1,2, 2,2,1, 3,2,1, 2,2,1, 1,2,1, 6,1,1, 7,1,1, 1,2,6, 0,0,0 };

unsigned char code song6[]={
     3,1,2, 3,1,1, 3,1,1, 6,0,1, 6,0,1, 1,1,2,
     6,0,1, 5,0,1, 6,0,4, 6,0,2, 6,0,1 ,6,0,1, 6,0,2, 6,0,1, 1,1,1, 
     2,1,2, 2,1,1, 3,1,1, 2,1,4, 3,1,1, 3,1,1, 3,1,1, 2,1,1, 4,1,2,
     4,1,2, 3,1,2, 2,1,1, 1,1,1, 2,1,4, 7,0,1, 7,0,1, 7,0,1, 6,0,1, 
     5,0,1, 5,0,1, 6,0,1, 7,0,1, 7,0,1, 6,0,1, 5,0,1, 6,0,4, 6,1,2,
     3,1,1, 6,1,1, 7,1,1, 6,1,1, 5,1,1, 5,1,2, 5,1,1, 2,1,1, 5,1,1, 
     6,1,1, 5,1,1, 4,1,1, 4,1,2, 4,1,1, 3,1,1, 2,1,2, 1,1,1, 2,1,1, 
     3,1,1, 2,1,1, 1,1,1, 2,1,1, 3,1,4, 6,1,2, 3,1,1, 6,1,1, 7,1,1, 
	 6,1,1, 5,1,1, 5,1,2, 2,1,1, 5,1,1, 6,1,1, 5,1,1, 4,1,1, 0,0,0};     

unsigned char code song7[]={
     5,1,2, 3,1,3, 5,1,1, 1,2,3, 6,1,2, 1,2,2, 
     5,1,4, 5,1,2, 1,1,1, 2,1,1, 3,1,2, 2,1,1, 1,1,1, 2,1,4, 5,1,2, 
	 3,1,1, 5,1,1, 1,2,2, 7,1,1, 6,1,2, 1,2,2, 5,1,4, 5,1,2, 2,1,1, 
	 3,1,1, 4,1,2, 7,0,1, 1,1,4, 6,1,2, 1,2,2, 1,2,4, 7,1,2, 6,1,1,
	 7,1,1, 1,2,4, 6,1,1, 7,1,1, 1,2,1, 6,1,1, 6,1,1, 5,1,1, 3,1,1, 
	 1,1,1, 2,1,8, 5,1,2, 3,1,1, 5,1,1, 1,2,2, 7,1,1, 6,1,2, 1,2,2, 
	 5,1,4, 5,1,2, 2,1,1, 3,1,1, 4,1,2, 7,0,2, 1,1,4, 0,0,0};

unsigned char code song8[]={
     5,1,1, 6,1,1, 1,2,1, 6,1,2, 6,1,1, 5,1,1, 6,1,1, 5,1,1, 3,1,1, 5,1,5, 
	 5,1,1, 6,1,1, 1,2,1, 6,1,2, 6,1,1, 5,1,1, 6,1,1, 5,1,1, 6,1,1, 1,1,5, 
	 1,1,1, 2,1,1, 3,1,1, 2,1,1, 2,1,1, 2,1,1, 1,1,1, 2,1,1, 1,1,1, 6,1,1, 
	 3,1,2, 2,1,3, 5,1,1, 6,1,1, 1,2,1, 6,1,2, 6,1,1, 5,1,1, 6,1,1, 5,1,1, 
	 6,1,1, 1,1,5, 1,1,1, 2,1,1, 3,1,1, 4,1,2, 4,1,1, 5,1,1, 6,1,1, 6,1,1, 
	 5,1,1, 6,1,2, 1,2,1, 6,1,3, 1,2,1, 6,1,1, 5,1,1, 5,1,4, 1,1,1, 6,1,1, 
	 5,1,5, 5,1,1, 6,1,1, 1,2,1, 3,1,1, 2,1,1, 3,1,1, 1,1,6, 0,0,0}; 

unsigned char code FREQH[]={
    0xF2, 0xF3, 0xF5, 0xF5, 0xF6, 0xF7, 0xF8,   
    0xF9, 0xF9, 0xFA, 0xFA, 0xFB, 0xFB, 0xFC, 0xFC,
    0xFC, 0xFD, 0xFD, 0xFD, 0xFD, 0xFE,          
    0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF};  

unsigned char code FREQL[]={
    0x42, 0xC1, 0x17, 0xB6, 0xD0, 0xD1, 0xB6,    
    0x21, 0xE1, 0x8C, 0xD8, 0x68, 0xE9, 0x5B, 0x8F, 
    0xEE, 0x44, 0x6B, 0xB4, 0xF4, 0x2D,            
    0x47, 0x77, 0xA2, 0xB6, 0xDA, 0xFA, 0x16};   
void KEY()
{
	if(!pause)		
		{
		delayms(5);
		if(!pause)
		{
			TR0=0;
			
			speaker=1;
			if(music_num==0)  
			{
				music_num=1;   
				num=0;	       
				play_enable=1;	
			}
			else
			{
				play_enable=~play_enable;
			    speaker=1;
			}
			while(!pause)	
			{
			if(play_enable==0){TR1  = 0;}	     
			else 
			{  
				TR1  = 1;
				LCDDispString(11,2,"00:");
				LCDDispString(0,2,"PLAY:");

			}
		
			}

		  }
	}

		if((!play_up)&&(music_num!=0)) 
		{
		delayms(5);
		if((!play_up)&&(music_num!=0))
		{
		   TR0=0;
		   speaker=1;
			music_num-=1;
			if(music_num<=0)
			music_num=5;
			num=0;		
			delayms(500);
			miao=0;
		} 
		while(!play_up); 	
		}

		if((!play_down)&&(music_num!=0))
		{
		delayms(5);
		if((!play_down)&&(music_num!=0))
		{   
			TR0=0;
			speaker=1;
			music_num+=1;
			if(music_num>=6)
			music_num=1;
			num=0;	 
			delayms(500);
			miao=0;
		}
		 while(!play_down); 
		}
	if(!power)
		{
		delayms(5);
		if(!power)
		{
			TR0=0;
			
			speaker=1;

			power_enable=~power_enable;
					
			while(!power)
			{
				if(power_enable==1)
					{
					LCDDispString(1,1,"WELCOME MUSIC");
					miao=0;
					}	        
				else 
				{   TR1  = 0;
					LCDDispString(0,1,"                ");
					LCDDispString(0,2,"                ");
					music_num=1;
					num=0;
					play_enable=0;
	
				}
		
			}

		  }
	}


}

void main(void)
{
	TMOD=0x11; //T0 T1
	TH1  = (65536-50000)/256;
	TL1  = (65536-50000)%256; 
	ET1  = 1;  
	ET0=1;              
	TR1  = 0;
	EA=1; 
    LCDInit();
	
	while(1)
	{
		music_play();


		KEY();


	}
} 

void delayms(unsigned int t)	  
{
	unsigned int i,j;
	for(i=0;i<t;i++)
	{
		for(j=0;j<123;j++)
			;
	}
}

void delay(unsigned char t)	   
{
	unsigned char t1;
	unsigned long t2;
	for(t1=0;t1<t;t1++)	    
	{
    	for(t2=0;t2<6500;t2++)
        {
        	KEY();
        }
	}
	TR0=0;		              
}

void timer0(void) interrupt 1  
{
	speaker=!speaker;
	TH0=timer0h;	
	TL0=timer0l;
 }
void Timer1() interrupt 3
{
	TH1  = (65536-50000)/256;
	TL1  = (65536-50000)%256; 
	haomiao++;
	{
		if(haomiao==20)	 
		{
		haomiao=0;
		miao++;
		LCDDispNum(14,2,miao/10);
		LCDDispNum(15,2,miao%10);

		}
	}




}
void song(void)  	
{
	TH0=timer0h;  
	TL0=timer0l;
	TR0=1;		    
	delay(time);    
}

void music_play(void)
{
	if(((music_num==1)&&(play_enable==1))&&(power_enable==1))
	{
		LCDDispNum(5,2,music_num);
		fre=song1[num]+7*song1[num+1]-1;
		timer0h=FREQH[fre];	          
    	timer0l=FREQL[fre];
    	time=song1[num+2];             
    	num+=3;
		if(fre<0)	
		{
			num=0;	   
			miao=0;
			music_num=2;
    	}
		song();	       
	}

	if(((music_num==2)&&(play_enable==1))&&(power_enable==1))
	{  
		LCDDispNum(5,2,music_num);
		fre=song2[num]+7*song2[num+1]-1;
		timer0h=FREQH[fre];
    	timer0l=FREQL[fre];
    	time=song2[num+2];
    	num+=3;
		if(fre<0)
		{
			num=0;
			miao=0;
			music_num=3;
    	}
		song();		
	}

		if(((music_num==3)&&(play_enable==1))&&(power_enable==1))
	{  
		LCDDispNum(5,2,music_num);
		fre=song3[num]+7*song3[num+1]-1;
		timer0h=FREQH[fre];
    	timer0l=FREQL[fre];
    	time=song3[num+2];
    	num+=3;
		if(fre<0)
		{
			num=0;
			miao=0;
			music_num=4;
    	}
		song();		
	}
	if(((music_num==4)&&(play_enable==1))&&(power_enable==1))
	{
		LCDDispNum(5,2,music_num);
		fre=song4[num]+7*song4[num+1]-1;
		timer0h=FREQH[fre];
    	timer0l=FREQL[fre];
    	time=song4[num+2];
    	num+=3;
		if(fre<0)
		{
			num=0;
			miao=0;
			music_num=5;
    	}
		song();		
	}
	if(((music_num==5)&&(play_enable==1))&&(power_enable==1))
	{
		LCDDispNum(5,2,music_num);
		fre=song5[num]+7*song5[num+1]-1;
		timer0h=FREQH[fre];
    	timer0l=FREQL[fre];
    	time=song5[num+2];
    	num+=3;
		if(fre<0)
		{
			num=0;
			miao=0;
			music_num=1;
    	}
		song();		
	}

}