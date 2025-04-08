#include <reg51.h>
#include <Delay.h>
#include <LCD1602.h>
#include <MatrixKey.h>
//#include <math.h>
#include <string.h>

#define INF 0x3f3f3f3f

sbit Beef = P2^5;

int i,j,k,pos,f=0,lentem,flag;
int tmp,tmp2=0,borrow=0,len1,len2,carry,len;
char s1[10]="",s2[10]="";
int  a[10],b[10],c[20];
long int x,y,z;
int  tep[10]={0},temp[10]={0},temp2[10]={0};
char KeyNumber;																			//	记录按键
int  str_len=0;																		//	字符串的位置
char str[20]="";																			//	记录整个字符串
int  symlen=0;																			//	符号的位置
char sym=' ';																			//	符号

void Buzzer(unsigned int ms)
{
	unsigned int i;
	for(i=0;i<ms*2;i++)
	{
		Beef=!Beef;
		Delay(1);
	}
}

int max(int a,int b){
	if(a>b)return a;
	else return b;
}

//将数组设置为0 
int setZero(int*num,int len){
	for(i=0;i<len;i++)
		num[i]=0;
}

//比较两个数组形式数字大小 
int compare(int*num1,int*num2){
	f=0;
	for(i=9;num1[i]==0;i--);
	for(j=9;num2[j]==0;j--);
	if(i<j)return -1;
	else if(i>j)return 1;
	else{
		for(;i>=0;i--){
			if(num1[i]>num2[i])
			{
				f=1;
				return f;
			}
			else if(num1[i]<num2[i])
			{
				f=-1;
				return f;
			}
		}
		return f;
	}
}

//将一个数组赋给另一个数组 
int copy(int*num1,int*num2){
	for(i=0;i<20;i++)
		num1[i]=0;
	for(i=9;num2[i]==0;i--);
	for(j=0;j<=i;j++)
		num1[j]=num2[j];
	return i+1;
}

//大数加法 
void add(char*str1,char*str2){
	setZero(a,10);
	setZero(b,10);
	setZero(c,20);
//	printf("%s + %s = ",str1,str2);
		
	carry=0;
	len1=strlen(str1),len2=strlen(str2),len=max(len1,len2);
	for(i=0;i<len1;i++)
		a[i]=str1[len1-1-i]-'0';
	for(i=0;i<len2;i++)
		b[i]=str2[len2-1-i]-'0';
	for(i=0;i<len;i++){
		c[i]=(a[i]+b[i]+carry)%10;
		carry=(a[i]+b[i]+carry)/10;
	}
	

	if(carry!=0)
		c[len++]=1;
//	LCD_Init();
	for(i=len-1;i>=0;i--)								//	显示结果
		LCD_ShowNum(2,len-i,c[i],1);
//		printf("%d",c[i]);
//	printf("\n");
}

//大数减法 
void sub(char*str1,char*str2){
	setZero(a,10);
	setZero(b,10);
	setZero(c,20);
	
	borrow=0;
	len1=strlen(str1),len2=strlen(str2),len=max(len1,len2);
	for(i=0;i<len1;i++)
		a[i]=str1[len1-1-i]-'0';
	for(i=0;i<len2;i++)
		b[i]=str2[len2-1-i]-'0';	
	//初步根据位数判断两数大小	
	if(len2>len1){ 
//		printf("-");
		f=1;
		for(i=0;i<len;i++){
			c[i]=b[i]-a[i]-borrow;
			if(c[i]<0){
				borrow=1;
				c[i]+=10;
			}
			else
				borrow=0;
		}
	}
	else{
		for(i=0;i<len;i++){
			c[i]=a[i]-b[i]-borrow;
			if(c[i]<0&&i+1<len){
				borrow=1;
				c[i]+=10;
			}
			else
				borrow=0;
		}
	}
	//如果被减数小于减数，则重新计算，用小减去大数，输出负号 
	if(c[len-1]<0)
	{
//		printf("-");
		f=1;
		for(i=0;i<len;i++){
			c[i]=b[i]-a[i]-borrow;
			if(c[i]<0&&i+1<len){
				borrow=1;
				c[i]+=10;
			}
			else
				borrow=0;
		}
	}
	while(c[len-1]==0&&len>1)
		len--;
//	LCD_Init();
	if(f==0)									//	结果为正数
	{
		for(i=len-1;i>=0;i--)
			LCD_ShowNum(2,len-i,c[i],1);
	}
	else
	{
		LCD_ShowChar(2,1,'-');
		for(i=len-1;i>=0;i--)					//	显示结果
			LCD_ShowNum(2,len-i+1,c[i],1);
	}
}

//大数乘法 
void mul(char*str1,char*str2) {
	setZero(a,10);
	setZero(b,10);
	setZero(c,20);
	
	i,j,k,carry=0,tmp; 
	len1=strlen(str1),len2=strlen(str2);
	for(i=0;i<len1;i++)
		a[i]=str1[len1-1-i]-'0';
	for(i=0;i<len2;i++)
		b[i]=str2[len2-1-i]-'0';
	
	for(i=0;i<len1;i++){
		for(k=i,j=0;j<len2;j++,k++){
			c[k]+=a[i]*b[j];
		}
	}
	for(i=0;i<=k;i++) {
		c[i]+=carry;
		tmp=c[i];
		c[i]=tmp%10;
		carry=tmp/10;
	}
	for(i=k;c[i]==0;i--);
//	LCD_Init();
	for(;i>=0;i--)								//	显示结果
		LCD_ShowNum(2,k-i+1,c[i],1);
}


//大数除法 
void div(char *str1,char *str2)
{
	//两个字符串的长度
	len1=strlen(str1),len2=strlen(str2);
	//被除数小于除数
	if (len1<len2||(len1==len2&&strcmp(s1,s2)==-1))
	{
	//	LCD_Init();
		LCD_ShowString(2,1,"0");
		return;
	}

	//被除数大于除数
	else
	{
		x=0;	//被除数 str1
		y=0;	//除数   str2
		for(i=0;i<len1;i++)
		{
			x =10 * x + str1[i] - 48;
		}
		for(i=0;i<len2;i++)
		{
			y =10 * y + str2[i] - 48;
		}
		z = x / y;
		i = -1;
		while(z>0)
		{
			i++;
			c[i] = z%10;
			z/=10;
		}
		k=0;
//		LCD_Init();
		for(;i>=0;i--)							//	显示结果
		{
			k++;
			LCD_ShowNum(2,k,c[i],1);
		}
	}
}


void Char()										//	将输入的长字符串分为2个短字符串
{
	i=0;
	for(j=0;i<strlen(str);i++,j++)				//	第一个字符串
	{
		if(str[i]>='0'&&str[i]<='9')
		{
			s1[j]=str[i];
		}
		else break;
	}
	i++;
	for(j=0;i<strlen(str);i++,j++)				//	第二个字符串
	{
		if(str[i]>='0'&&str[i]<='9')
		{
			s2[j]=str[i];
		}
		else break;
	}
	if(strlen(str)>strlen(s1)+strlen(s2)+1)		//	判断输入是否正确
	{
	}
	switch(sym)
	{
		case '+':add(s1,s2);
			break;
		case '-':sub(s1,s2);
			break;
		case '*':mul(s1,s2);
			break;
		case '/':div(s1,s2);
			break;
	}
}


void main()
{
	LCD_Init();
	while(1)
	{
		KeyNumber = MatrixKey();														//	获取按键
		if(KeyNumber!='!'&&KeyNumber!='=')												//	判断按键
		{
																				//	字符串中字符初始位置为-1，字符位置加1
			if(KeyNumber>='0'&&KeyNumber<='9')
			{
				str[str_len]=KeyNumber;str_len++;
			}
			else if(KeyNumber=='+'||KeyNumber=='-'||KeyNumber=='*'||KeyNumber=='/')
			{
				if(str[str_len-1]=='+'||str[str_len-1]=='-'||str[str_len-1]=='*'||str[str_len-1]=='/')
				{
					str_len--;
				}
				str[str_len]=KeyNumber;str_len++;
			}
			else if(KeyNumber=='C')																		//	删除
			{
				LCD_Init();
				str_len--;
				str[str_len]=' ';
			}
			for(i=0;i<strlen(str);i++)																	//	赋符号
			{
				sym = ' ';
				if(str[i]=='+'||str[i]=='-'||str[i]=='*'||str[i]=='/')
				{
					sym=str[i];
					break;
				}
			}
			LCD_ShowString(1,1,str);
		}
		else if(KeyNumber=='=')																			//	输出结果
		{
			Buzzer(20);
			Char();
		}
	}
}