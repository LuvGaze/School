#include "reg51.h"			 //Ջτݾא֨ӥեƬܺքһЩ͘ˢ٦Ŝ݄զǷ
#include "lcd.h"
#include "key.h"
#include "math.h"
#include "string.h"
#include "stdio.h"

#define u8  unsigned char
#define u16 unsigned int

//дݼ͘ˢػۅֵ
#define add 13    // +
#define sub 16    // -
#define mul 19    // *
#define div 22    // /
#define pot 10    // .
#define equ 12    // =
#define fuh 11    //غ˽
#define clr 14    //ȥԽ

#define MAXN 20

#define max(a, b) ((a) > (b) ? (a) : (b))

sbit beep=P1^0;

void LCD_ShowStr(char addr,char * str);

void delay(u16  t)     //ғʱگ˽
{
	while(t--);
}


//خճ9 9999 9999 9999 
u8  data0[16]={0};
u8  data1[16]={0};

u8  show0[16]={0};
u8  show1[16]={0};


char com(u8 *a1,u8 *b1)    //a1>b1 return 1   a1=b1 return 0 a1<b1 return -1
{
		u8 len0;
		u8 len1; 
		int i=0;
		len0 = strlen(a1);
		len1 = strlen(b1);
    if(len0>len1){ return 1;}
    else if(len0==len1)
			{ 
       while(a1[i]==b1[i]&&i<len1)
				 {
            i++;
         }
       if(i==len1) return 0;
       else if(a1[i]>b1[i]) return 1;
       else return -1;
    }
    else return -1;

}


void addx(u8 *s1,u8 *s2,u8 out[]) 
{
	char i,j=0;
	char an1[MAXN]=0;
  char an2[MAXN]=0;
	
	int len1=strlen(s1);
	int len2=strlen(s2);
	
  for(i=len1-1;i>=0;i--) an1[j++]=s1[i]-'0';     
	j=0;
  for(i=len2-1;i>=0;i--) an2[j++]=s2[i]-'0';    
  j=0;
	for(i=0;i<max(len1,len2)+1;i++)
	{
		an1[i]+=an2[i];
		if(an1[i]>=10)
			{
				an1[i]-=10;
				an1[i+1]++;
		}
		an1[i]+='0';
	}
	i=strlen(an1)-1;   
	while(an1[i]=='0')i--;    //Խȥ˗λ0
	memset(out,0,MAXN);
	for(;i>=0;i--)
	{
		out[j]=an1[i];
		j++;
	}
	
}

void subx(u8 *s1,u8 *s2,u8 out[]) 
{
	char i,j=0;
	char an1[MAXN]=0;
  char an2[MAXN]=0;

	int len1=strlen(s1);
	int len2=strlen(s2);
	
  for(i=len1-1;i>=0;i--) an1[j++]=s1[i]-'0';     
	j=0;
  for(i=len2-1;i>=0;i--) an2[j++]=s2[i]-'0';    
  j=0;
	for(i=0;i<max(len1,len2);i++)
	{
    an1[i]-=an2[i];
    if(an1[i]<0)
			{
        an1[i]+=10;
        an1[i+1]--;
      }
			an1[i]+='0';
		}
	i=strlen(an1)-1;   
	while(an1[i]=='0')i--;    //Խȥ˗λ0
	memset(out,0,MAXN);
	for(;i>=0;i--)
	{
		out[j]=an1[i];
		j++;
	}
}

void mulx(u8 *s1,u8 *s2,u8 out[])
{
	u16 c[40]=0;
	char an1[MAXN]=0;
  char an2[MAXN]=0;
	int len1=strlen(s1);
	int len2=strlen(s2);
  int len=len1+len2;
	char i,j=0;
	
	for(i=len1-1;i>=0;i--) an1[j++]=s1[i]-'0';     
	j=0;
  for(i=len2-1;i>=0;i--) an2[j++]=s2[i]-'0';    

		for(i=0;i<len1;i++)
	{
		for(j=0;j<len2;j++)
			c[i+j]+=an1[i]*an2[j];   
	}
	for(i=0;i<len;i++)
	{    
			if(c[i]>=10)
			{
				c[i+1]+=c[i]/10;
				c[i]%=10;
			}
			c[i]+='0';
		}  
	j=0;
	i=len-1;   
	if(c[i]=='0')i--;    //Խȥ˗λ0
	for(;i>=0;i--)
	{
		out[j]=c[i];
		j++;
	}
}


void divx(u8 *s1,u8 *s2,u8 out1[])
{
	u8 i,j;
	 char an1[MAXN]=0;
   char an2[MAXN]=0;
	 char an3[MAXN]=0;
	 char an4[MAXN]=0;
		 
	 int len,len1,len2;
   if(com(s1,s2)==0){
        out1[0]='1';
   }
   else if(com(s1,s2)<0){
		    len=strlen(s1);
         out1[0]='0';
   }
   else
	{	
		   i=0;while(s1[i]=='0')i++;j=0;              //Խȥ˗λ0
			 for(;i<strlen(s1);i++)an1[j++]=s1[i];
		   
			 while(com(an1,s2)>=0)
				 {
					  memset(an2,0,MAXN);
					  i=0;while(s2[i]=='0')i++;j=0;             //Խȥ˗λ0
					  for(;i<strlen(s2);i++)an2[j++]=s2[i];
					  len1=strlen(an1)-strlen(an2)-1;
					  len2=strlen(an2);
						for(i=0;i<len1;i++)an2[len2+i]='0';				
					  while(com(an1,an2)>=0)
						{						 
							subx(an1,an2,an1);
							addx(an3,"1",an3);	
						}
						len2=strlen(an3);
						for(i=0;i<len1;i++)an3[len2+i]='0';							
            addx(an4,an3,an4);
						memset(an3,0,MAXN);
         } 

			len=strlen(an4);
			for(i=0;i<len;i++)out1[i]=an4[i];
   }
}



void dat_add(u8 symb0,u8 pot0,u8 s0[],u8 symb1,u8 pot1,u8 s1[],u8 out[])       //ػۅìС˽λ˽ì˽ߝؖػԮ   symb=0 Ϊֽ˽ ״֮Ϊغ˽
{
	
	char i;
	u8 len;
	u8 sout[MAXN]=0;
	u8 sout1[MAXN]=0;
	if(symb0 == symb1)
	{
		if(pot0==0 && pot1==0)
		{
			addx(s0,s1,sout1);
		}
		else if(pot0>=pot1)
		{
			len = strlen(s1);
			for(i=0;i<pot0-pot1;i++) s1[len+i] = '0';	               //С˽֣הǫ
			addx(s0,s1,sout);
			
			len = strlen(sout); 
		
			for(i=0;i<len-pot0;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
			sout1[len-pot0]='.';                                       //ͭݓС˽֣
			for(i=len-pot0;i<len;i++)sout1[i+1]=sout[i];                //С˽֣۳ք˽
		}
		else if(pot1>pot0)
		{
			len = strlen(s0);
			for(i=0;i<pot1-pot0;i++) s0[len+i] = '0';	               //С˽֣הǫ
			addx(s0,s1,sout);
			
			len = strlen(sout);                                     
			for(i=0;i<len-pot1;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
			sout1[len-pot1]='.';                                       //ͭݓС˽֣
			for(i=len-pot1;i<len;i++)sout1[i+1]=sout[i];                //С˽֣۳ք˽
		}
		
		len = strlen(sout1);
		if(symb0 == 1)
		{
			out[0]='-';                                                //ͭݓغۅ
			for(i=0;i<len;i++) out[i+1]=sout1[i];
		}
		else for(i=0;i<len;i++) out[i]=sout1[i];
	}
	
	else if(symb0>symb1)  //֚һٶΪغ˽
		{
			if(pot0==0 && pot1==0)
			{
					if(com(s0,s1)==1)         //֚һٶք˽ֵճԚ֚׾ٶ
					{
						subx(s0,s1,sout1);
						len = strlen(sout1);	
						out[0]='-';   
						for(i=0;i<len;i++) out[i+1]=sout1[i];
						
					}
					
					else if(com(s0,s1)<=0)
					{
						subx(s1,s0,sout1);
						len = strlen(sout1);
						for(i=0;i<len;i++) out[i]=sout1[i];
					}
				}
			
			
			
			else if(pot0>=pot1)
			{
				len = strlen(s1);
		    for(i=0;i<pot0-pot1;i++) s1[len+i] = '0';	               //С˽֣הǫ
				if(com(s0,s1)==1)         //֚һٶք˽ֵճԚ֚׾ٶ
					{
						subx(s0,s1,sout);
						len = strlen(sout); 
		
						for(i=0;i<len-pot0;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot0]='.';                                       //ͭݓС˽֣
						for(i=len-pot0;i<len;i++)sout1[i+1]=sout[i];    
						
						len = strlen(sout1); 
						out[0]='-';   
						for(i=0;i<len;i++) out[i+1]=sout1[i];
					}
					else if(com(s0,s1)<=0)
					{
						subx(s1,s0,sout);
						len = strlen(sout);
						
						for(i=0;i<len-pot0;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot0]='.';                                       //ͭݓС˽֣
						for(i=len-pot0;i<len;i++)sout1[i+1]=sout[i];
						
						len = strlen(sout1);
						for(i=0;i<len;i++) out[i]=sout1[i];
					}
			}
			
				else if(pot0<pot1)
			{
				len = strlen(s0);
		    for(i=0;i<pot1-pot0;i++) s0[len+i] = '0';	               //С˽֣הǫ
				if(com(s0,s1)==1)         //֚һٶք˽ֵճԚ֚׾ٶ
					{
						subx(s0,s1,sout);
						len = strlen(sout); 
		
						for(i=0;i<len-pot1;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot1]='.';                                       //ͭݓС˽֣
						for(i=len-pot1;i<len;i++)sout1[i+1]=sout[i];    
						
						len = strlen(sout1); 
						out[0]='-';   
						for(i=0;i<len;i++) out[i+1]=sout1[i];
					}
					else if(com(s0,s1)<=0)
					{
						subx(s1,s0,sout);
						len = strlen(sout);
						
						for(i=0;i<len-pot1;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot1]='.';                                       //ͭݓС˽֣
						for(i=len-pot1;i<len;i++)sout1[i+1]=sout[i];
						
						len = strlen(sout1);
						for(i=0;i<len;i++) out[i]=sout1[i];
					}
			}

		}
		
	else if(symb0<symb1)  //֚2ٶΪغ˽
		{
			if(pot0==0 && pot1==0)
			{
				if(com(s0,s1)>=0)         //֚һٶք˽ֵճԚ֚׾ٶ
				{
					subx(s0,s1,sout1);
					len = strlen(sout1);
					for(i=0;i<len;i++) out[i]=sout1[i];
				}
				else if(com(s0,s1)==-1)
				{
					subx(s1,s0,sout1);
					len = strlen(sout1);
					out[0]='-';   
					for(i=0;i<len;i++) out[i+1]=sout1[i];					
				}
			}
			
				
			else if(pot0>=pot1)
			{
				len = strlen(s1);
		    for(i=0;i<pot0-pot1;i++) s1[len+i] = '0';	               //С˽֣הǫ
				if(com(s0,s1)>=0)         //֚һٶք˽ֵճԚ֚׾ٶ
					{
						subx(s0,s1,sout);
						len = strlen(sout); 
		
						for(i=0;i<len-pot0;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot0]='.';                                       //ͭݓС˽֣
						for(i=len-pot0;i<len;i++)sout1[i+1]=sout[i];    
						
						len = strlen(sout1);  
						for(i=0;i<len;i++) out[i]=sout1[i];
					}
					else if(com(s0,s1)==-1)
					{
						subx(s1,s0,sout);
						len = strlen(sout);
						
						for(i=0;i<len-pot0;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot0]='.';                                       //ͭݓС˽֣
						for(i=len-pot0;i<len;i++)sout1[i+1]=sout[i];
						
						len = strlen(sout1);
						out[0]='-';
						for(i=0;i<len;i++) out[i+1]=sout1[i];
					}
			}
			
				else if(pot0<pot1)
			{
				len = strlen(s0);
		    for(i=0;i<pot1-pot0;i++) s0[len+i] = '0';	               //С˽֣הǫ
				if(com(s0,s1)==1)         //֚һٶք˽ֵճԚ֚׾ٶ
					{
						subx(s0,s1,sout);
						len = strlen(sout); 
		
						for(i=0;i<len-pot1;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot1]='.';                                       //ͭݓС˽֣
						for(i=len-pot1;i<len;i++)sout1[i+1]=sout[i];    
						
						len = strlen(sout1); 
					  
						for(i=0;i<len;i++) out[i]=sout1[i];
					}
					else if(com(s0,s1)<=0)
					{
						subx(s1,s0,sout);
						len = strlen(sout);
						
						for(i=0;i<len-pot1;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
						sout1[len-pot1]='.';                                       //ͭݓС˽֣
						for(i=len-pot1;i<len;i++)sout1[i+1]=sout[i];
						
						len = strlen(sout1);
						out[0]='-'; 
						for(i=0;i<len;i++) out[i+1]=sout1[i];
					}
			}
			
			
		}
}


void dat_sub(u8 symb0,u8 pot0,u8 s0[],u8 symb1,u8 pot1,u8 s1[],u8 out[])       //ػۅìС˽λ˽ì˽ߝؖػԮ   symb=0 Ϊֽ˽ ״֮Ϊغ˽	
{
//	//////////////////////////////////////////
//	
//	//  a - b = a + -b                  //ݵרַԃݓר֨É
//	
//	/////////////////////////////////////////
	dat_add(symb0,pot0,s0,1-symb1,pot1,s1,out);
}

void dat_mul(u8 symb0,u8 pot0,u8 s0[],u8 symb1,u8 pot1,u8 s1[],u8 out[])       //ػۅìС˽λ˽ì˽ߝؖػԮ   symb=0 Ϊֽ˽ ״֮Ϊغ˽	
{
	char i;
	u8 len;
	u8 sout[MAXN*2]=0;
	u8 sout1[MAXN*2]=0;
	
		if(pot0==0 && pot1==0)
		{
			mulx(s0,s1,sout1);
		}
		else
		{
			mulx(s0,s1,sout);
			len = strlen(sout);

			for(i=0;i<len-pot0-pot1;i++)sout1[i]=sout[i];                       //С˽֣ǰք˽
			sout1[len-pot0-pot1]='.';                                       //ͭݓС˽֣
			for(i=len-pot0-pot1;i<len;i++)sout1[i+1]=sout[i];                //С˽֣۳ք˽
			
	  }
		
		len = strlen(sout1);
		if(symb0 == symb1)
		{	
			for(i=0;i<len;i++) out[i]=sout1[i];
		}
		else
		{
			out[0]='-';                                                //ͭݓغۅ
			for(i=0;i<len;i++) out[i+1]=sout1[i];
		}
	
}

void dat_div(u8 symb0,u8 pot0,u8 s0[],u8 symb1,u8 pot1,u8 s1[],u8 out[])
{
	char i=0;
	u8 len;
	u8 sout[15]=0;
	u8 ss[MAXN]=0;

	divx("1000000000000000",s1,ss);            //1e15
	len=strlen(ss);
	for(i=0;i<16-len;i++)sout[i]='0';
	strcat(sout,ss);                         //ؖػԮǰĦͭݓ0ì15λӤ׈הǫ
	dat_mul(symb0,pot0,s0,symb1,15-pot1,sout,out); 
	
}


void display_ans(u8 *ans)
{
	u8 len=0;
	u8 addr=0xC0;
	if(strstr(ans,"."))
	{
		while(ans[len]!='.')len++;	
	}
	else 
	{
		len = strlen(ans);
	}
		if(len>16)
		{
			if(ans[0]=='-')
			{
				  LcdWriteCom(addr++);LcdWriteData(ans[0]);
					LcdWriteCom(addr++);LcdWriteData(ans[1]);
		  		LcdWriteCom(addr++);LcdWriteData('.');
					LcdWriteCom(addr++);LcdWriteData(ans[2]);
					LcdWriteCom(addr++);LcdWriteData(ans[3]);
					LcdWriteCom(addr++);LcdWriteData(ans[4]);
					LcdWriteCom(addr++);LcdWriteData(ans[5]);
					LcdWriteCom(addr++);LcdWriteData(ans[6]);
					LcdWriteCom(addr++);LcdWriteData(ans[7]);
					LcdWriteCom(addr++);LcdWriteData(ans[8]);
					LcdWriteCom(addr++);LcdWriteData(ans[9]);
					LcdWriteCom(addr++);LcdWriteData(ans[10]);
					LcdWriteCom(addr++);LcdWriteData(ans[11]);
					LcdWriteCom(addr++);LcdWriteData('e');
					LcdWriteCom(addr++);LcdWriteData((len-2)/10 + '0');
					LcdWriteCom(addr++);LcdWriteData((len-2)%10 + '0');	
			}
			else
			{
					LcdWriteCom(addr++);LcdWriteData(ans[0]);
					LcdWriteCom(addr++);LcdWriteData('.');
					LcdWriteCom(addr++);LcdWriteData(ans[1]);
					LcdWriteCom(addr++);LcdWriteData(ans[2]);
					LcdWriteCom(addr++);LcdWriteData(ans[3]);
					LcdWriteCom(addr++);LcdWriteData(ans[4]);
					LcdWriteCom(addr++);LcdWriteData(ans[5]);
					LcdWriteCom(addr++);LcdWriteData(ans[6]);
					LcdWriteCom(addr++);LcdWriteData(ans[7]);
					LcdWriteCom(addr++);LcdWriteData(ans[8]);
					LcdWriteCom(addr++);LcdWriteData(ans[9]);
					LcdWriteCom(addr++);LcdWriteData(ans[10]);
					LcdWriteCom(addr++);LcdWriteData(ans[11]);
					LcdWriteCom(addr++);LcdWriteData('e');
					LcdWriteCom(addr++);LcdWriteData((len-1)/10 + '0');
					LcdWriteCom(addr++);LcdWriteData((len-1)%10 + '0');	
			}
		}
		else
		{
			LCD_ShowStr(1,ans);
		}
	
}


void main()
{
	char key=0;   //дݼֵ
	u8 i;
  u8	cnt0 = 0,cnt1 = 0;          //ԃԚДʾք˽ߝӤ׈
	u8 dat_cnt0=0,dat_cnt1=0;      //ԃԚ݆̣ք˽ߝӤ׈
	u8 buf[MAXN]={0};

	u8 dat_flag = 0;
	u8 symbol=0;   //Ջ̣ػۅ
	
	u8 pot0_flag = 0;           //С˽֣λ׃
	u8 pot1_flag = 0;
	
	u8 neg0 = 0;               //ֽغۅ
	u8 neg1 = 0;
	
	LcdInit();
	LCD_ShowStr(0,"welcome!!!!");
	delay(30000);
	LCD_ShowStr(0,"0          ");
	delay(30000);
	
//	subx(data0,data1,buf);
//	LCD_ShowStr(1,buf);
	
	while(1)
	{
		//LCD_ShowStr(1,show0);
			key=keyscan();    //ܱȡдݼֵ
		if(key!=-1)          //ԐдݼдЂ
		{
			
			
									if(key<12) //дݼֵΪ 0123456789.
									{
												if(dat_flag==0)
												{
													
													      if(key == fuh && cnt0==0)
																{
																	show0[cnt0++] = '-';
																	neg0=1;
																}
																else if(key == pot)
																{
																				if(strstr(show0,".")==0 && cnt0!=0)     //ԐС˽֣Ңһˇ˽ߝ֚һλ
																				{
																					show0[cnt0++] = '.';
																				}
																}
																else if(key != fuh)
																{
																      	if(strstr(show0,"."))pot0_flag++;
																				show0[cnt0++] = key + '0';
																				data0[dat_cnt0++] = key + '0';
																}
																
																LCD_ShowStr(0,show0);
												}
												else
												{
													      if(key == fuh && cnt1==0)
																{
																	show1[cnt1++] = '-';
																	neg1=1;
																}
																else if(key == pot)
																{
																				if(strstr(show1,".")==0 && cnt1!=0)     //ԐС˽֣Ңһˇ˽ߝ֚һλ
																				{
																					show1[cnt1++] = '.';
																				}
																}
																else if(key != fuh)
																{
																	      if(strstr(show1,"."))pot1_flag++;
																				show1[cnt1++] = key + '0';
																				data1[dat_cnt1++] = key + '0';
																}
																
																LCD_ShowStr(1,show1);
												}
									}
									else if(key>12 && dat_cnt0>0)              //Ջ̣ػۅдЂҢȒ˽ߝ0Ԑ˽ߝ
									{
													symbol = key;
										     switch(symbol)
												 {
													 case add:LcdWriteCom(0x8f);LcdWriteData('+');break;
												   case sub:LcdWriteCom(0x8f);LcdWriteData('-');break;
													 case mul:LcdWriteCom(0x8f);LcdWriteData('*');break;
													 case div:LcdWriteCom(0x8f);LcdWriteData('/');break;
												 }
													dat_flag = 1;                 //ҭʾكˤɫ֚׾ٶ˽
									}
									else if(key==equ && dat_cnt1>0)  
									{			//дЂֈԚػۅ
														switch(symbol)
														{
															case add:dat_add(neg0,pot0_flag,data0,neg1,pot1_flag,data1,buf);break;
															case sub:dat_sub(neg0,pot0_flag,data0,neg1,pot1_flag,data1,buf);break;
															case mul:dat_mul(neg0,pot0_flag,data0,neg1,pot1_flag,data1,buf);break;
															case div:dat_div(neg0,pot0_flag,data0,neg1,pot1_flag,data1,buf);break;
														//	case sub:subx(data0,data1,buf);break;
														//	case add:addx(data0,data1,buf);break;
														//	case div:divx(data0,data1,buf,buf1);break;
														}
														LCD_ShowStr(0,"ans=            ");
														LCD_ShowStr(1,"                ");
														display_ans(buf);
									}
												
												
												
		}
		if(key == clr)             //ȥԽ
		{
			for(i=0;i<MAXN;i++)show0[i]=0;
			for(i=0;i<MAXN;i++)show1[i]=0;
			for(i=0;i<MAXN;i++)data0[i]=0;
			for(i=0;i<MAXN;i++)data1[i]=0;
			for(i=0;i<MAXN;i++)buf[i]=0;
			cnt0 = 0;cnt1 = 0;
			dat_cnt0=0;dat_cnt1=0;
			dat_flag = 0;
			symbol=0;   
			pot0_flag = 0;
			pot1_flag = 0;
		  neg0 = 0;
	    neg1 = 0;
			LCD_ShowStr(0,"0               ");
			LCD_ShowStr(1,"                ");
		}
	}
}


void LCD_ShowStr(char addr,char * str)
{
	char i=0;
	if(addr == 0)LcdWriteCom(0x80);
	else if(addr == 1)LcdWriteCom(0xC0);
	while(*str != '\0')
	{
		LcdWriteData(*str);
		str++;
	}
}
