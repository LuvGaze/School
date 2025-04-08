#include "reg52.h" 

#define KEY_PORT P1 //矩阵按键
 
sbit rw=P2^5;            
sbit rs=P2^6;            
sbit e=P2^7; 
 
sbit KEY1=P3^1;
sbit KEY2=P3^0;
sbit KEY3=P3^2;
sbit KEY4=P3^3;
 
 
code unsigned char ERROR[]="     ERROR!";
code unsigned char wel[]="    Welcome!";
unsigned char negative1,negative2,fuhao,jjcc,jjcc,key_value,decimal1,decimal2,j1,x,symbol0,beep=200,be=0,be2,key=1;
float number1,number2,result,resulted;
unsigned int dec1,dec2,mul1,mul2;
long num1,num2;
 
void write_comm(unsigned int c);
void write_data(unsigned int dat);
void lcdinit();
void resultShow(float value);
void getFuhao(key_value);
void getNum(key_value);
void calculate(void);
void delect(void);
void numShow(unsigned int zhengshu);
void getNeg(key_value);
void buzzer(beep);
 
 
//延时
void delay(unsigned int x)
{
	while(x--);
}
 
void buzzer(beep)
{	
	while(beep--)//循环 200 次
	{
		rw=!rw;//产生一定频率的脉冲信号
		delay(100);
	}
	rw=0;//关闭蜂鸣器
}
 
//按键
void key_scan(void)
{	
	key_value=0;
	KEY_PORT=0xf7;//给第一列赋值 0，其余全为 1
	if(KEY_PORT!=0xf7)//判断第一列按键是否按下
	{
		delay(1000);
		switch(KEY_PORT)//保存第一列按键按下后的键值
		{
			case 0x77: key_value=1;buzzer(beep);getNum(key_value);break;
			case 0xb7: key_value=4;buzzer(beep);getNum(key_value);break;
			case 0xd7: key_value=7;buzzer(beep);getNum(key_value);break;
			case 0xe7: 
				buzzer(beep);
				key_value=10;//"."
				if(fuhao==0) 
				{
					decimal1 = 1;
					write_data('.');
				}
				else if(fuhao==1) 
				{
					decimal2 = 1;
					write_data('.');
				}
				break;
		}	
	}
	while(KEY_PORT!=0xf7);//等待按键松开
	KEY_PORT=0xfb;//给第二列赋值 0，其余全为 1
 
	if(KEY_PORT!=0xfb)//判断第二列按键是否按下
	{
		delay(1000);
		switch(KEY_PORT)//保存第二列按键按下后的键值
		{
			case 0x7b: key_value=2;buzzer(beep);getNum(key_value);break;
			case 0xbb: key_value=5;buzzer(beep);getNum(key_value);break;
			case 0xdb: key_value=8;buzzer(beep);getNum(key_value);break;
			case 0xeb: key_value=0;buzzer(beep);getNum(key_value);break;
		}
	}
	while(KEY_PORT!=0xfb);//等待按键松开
	KEY_PORT=0xfd;//给第三列赋值 0，其余全为 1
	if(KEY_PORT!=0xfd)//判断第三列按键是否按下
	{
		delay(1000);//消抖
		switch(KEY_PORT)//保存第三列按键按下后的键值
		{
			case 0x7d: key_value=3;buzzer(beep);getNum(key_value);break;
			case 0xbd: key_value=6;buzzer(beep);getNum(key_value);break;
			case 0xdd: key_value=9;buzzer(beep);getNum(key_value);break;
			case 0xed: 
				buzzer(beep);
				key_value=11;//"="
				write_data('=');
				calculate();
				if(symbol0==0)//显示错误时影响光标
				{
					resulted = result;
					write_comm(0xC0);
					resultShow(result);
				}
				else
					symbol0=0;
				break;
		}	
	}
	while(KEY_PORT!=0xfd);//等待按键松开
	KEY_PORT=0xfe;//给第四列赋值 0，其余全为 1
	if(KEY_PORT!=0xfe)//判断第四列按键是否按下
	{
		delay(1000);//消抖
		switch(KEY_PORT)//保存第四列按键按下后的键值
		{
			case 0x7e: key_value=12;buzzer(beep);getFuhao(key_value);break;//"+"
			case 0xbe: key_value=13;buzzer(beep);getNeg(key_value);break;//"-"
			case 0xde: key_value=14;buzzer(beep);getFuhao(key_value);break;//"*"
			case 0xee: key_value=15;buzzer(beep);getFuhao(key_value);break;//"/"
		}
	}
	while(KEY_PORT!=0xfe);//等待按键松开
	if(key==1 && (KEY1==0||KEY2==0||KEY3==0||KEY4==0))//任意按键按下
	{	
		delay(1000);//消抖
		key=0;
		if(KEY1==0)
		{	buzzer(beep);
			write_comm(0x01);
			lcdinit();//AC
			resulted=0;
		}
		else if(KEY2==0)
		{	buzzer(beep);
			delect();
		}
		else if(KEY3==0)
		{	buzzer(beep);
			write_comm(0x01);
			lcdinit();
			resultShow(resulted);//连续计算
		}
		else if(KEY4==0)
		{
			buzzer(beep);
			be=be+1;
			be2=be%2;
			if(be2==0)
			{
				beep=200;
			}
			else if(be2==1)
			{
				beep=0;
			}					
			
		}
	}
	else if(KEY1==1&&KEY2==1&&KEY3==1&&KEY4==1) //无按键按下
	{
		key=1;
	}
}
 
void getNeg(key_value)
{	
	if(key_value == 13) 
	{
		if(resulted==0)
		{	
			if(fuhao == 0)//第一个负号
			{
				if(num1 == 0 && dec1 == 0)
				{
					write_data('-');
					negative1 = 1;
				}
				else
				{
					write_data('-');
					jjcc=1;
					fuhao=1;
				}	
			}
			else if(fuhao == 1)//第二个负号
			{
				if(num2 == 0 && dec2 == 0)
				{
					negative2 = 1;
					write_data('-');
				}
			}
		}
		else if(resulted!=0)
		{
			if(fuhao == 0)
			{
				write_data('-');
				jjcc=1;
				fuhao=1;
			}
			else if(fuhao == 1)
			{
				if(num2 == 0 && dec2 == 0)
				{
				negative2 = 1;
				write_data('-');
				}
			}
		}
	}
}
 
 
 
 
//计算
void calculate()
{	
		if(resulted!=0)
		{	
			number1 = resulted;
			number2 = (float)num2 + (float)dec2/(float)mul2;
		}
		else
		{	
			number1 = (float)num1+ (float)dec1/(float)mul1;
			number2 = (float)num2 + (float)dec2/(float)mul2;//类型转换
		}
		if(negative1==1) number1 = -number1;//给负号
		if(negative2==1) number2 = -number2;
		switch(jjcc)
		{
			case 0:	result = number1 + number2;break;
			case 1: result = number1 - number2;break;
			case 2: result = number1 * number2;break;
			case 3:
				if(number2==0) 
				{	symbol0=1;
					write_comm(0x01);
					for(j1=0;j1<11;j1++)
					{
						write_data(ERROR[j1]);//显示语句：ERROR！	
					}
					delay(50000);
					lcdinit();
				}
				else
				{
					result = number1 / number2;
				}break;
		}
}
	
 
 
//获取整数、小数
void getNum(key_value)
{
	if(resulted!=0)//上次运算的结果
	{
		if(fuhao==1)
		{	
			if(decimal2==0)//输入不是小数
			{
				write_data(key_value + 0x30);
				num2 = key_value + num2*10;//第二个整数
			}
			else if(decimal2==1)
			{
				write_data(key_value + 0x30);
				dec2 = key_value + dec2*10;//第二个小数
				mul2=10*mul2;
			}
		}
	}
	else
	{
		if(fuhao==0 )
		{	
			if(decimal1==0)//输入不是小数
			{
				write_data(key_value + 0x30);
				num1 = key_value + num1*10;//第一个整数
			}
			else if(decimal1==1)
			{
				write_data(key_value + 0x30);
				dec1 = key_value + dec1*10;//第一个小数
				mul1=10*mul1;
			}
    }
		else if(fuhao==1)
		{	
			if(decimal2==0)//输入不是小数
			{
				write_data(key_value + 0x30);
				num2 = key_value + num2*10;//第二个整数
			}
			else if(decimal2==1)
			{
				write_data(key_value + 0x30);
				dec2 = key_value + dec2*10;//第二个小数
				mul2=10*mul2;
			}
		}
	}
}
 
//获取加减乘除符号值
void getFuhao(key_value)
{
	if(fuhao==0 && ( key_value==12||key_value==13||key_value==14||key_value==15))
	{
		if(key_value==12) 
		{
			jjcc = 0;
			write_data('+');
			fuhao = 1;
		}
		else if(key_value==14)
		{
			jjcc = 2;
			write_data('*');
			fuhao = 1;
		}
		else if(key_value==15)
		{
			jjcc = 3;
			write_data('/');
			fuhao = 1;
		}
		
	}
}	
 
//删除
void delect()
{
	write_comm(0x04);
	write_data(0x20);
	write_comm(0x06);
	write_data(0x20);
	write_comm(0x04);
	write_data(0x20);
	write_comm(0x06);
	if(fuhao==1)
	{	
		if(num2==0 && dec2==0)//删符号
		{	
			if(negative2==1)
			{
				negative2=0;//删第二个负号
			}
			else
			{
				fuhao=0;//删运算符号
				jjcc=4;
			}
		}
		else if(decimal2 == 0)//删第二个整数
			num2=num2/10;
		else if(decimal2 == 1)
		{
			if(dec2 == 0) decimal2 = 0;//删小数点
			else 
			{
				dec2=dec2/10;//删第二个小数
				mul2=mul2/10;
			}
		}
	}
	else if(fuhao==0)
	{	
		if(negative1==1 && num1==0 && dec1==0)//第一个负号
		{
			negative1=0;
		}
		else if(decimal1 == 0)
			num1=num1/10;//第一个整数
		else if(decimal1 == 1)//第一个小数
		{
			if(dec1 == 0) decimal1 = 0;//第一个小数符号
			else 
			{
				dec1=dec1/10;
				mul1=mul1/10;//第一个小数数字
			}
		}
	}
}
 
void write_comm(unsigned int c)
{
 delay(1000);
 rs=0;
 rw=0;
 e=0;
 P0=c;
 e=1;
 delay(1000);
 e=0;
}//写命令
 
 
 
void write_data(unsigned int dat) //设置LCD写数据
{
 delay(1000);
 rs=1;
 rw=0;
 e=0;
 P0=dat;
 e=1;
 delay(1000);
 e=0;
 rs=0;
}
 
void lcdinit()   //初始化LCD
{
	delay(1500);
  write_comm(0x38);//写指令38H
  delay(500);
  write_comm(0x38);//显示模式设置
  delay(500);
  write_comm(0x38);
  delay(500);
  write_comm(0x38);//功能设定指令
  write_comm(0x08);
  write_comm(0x01);//清屏
  write_comm(0x06);//显示光标移动设置写入数据后移
  write_comm(0x0c); //显示开关控制指令
  write_comm(0x0f); //显示光标并闪烁
	negative1=0,negative2=0;
	fuhao=0,jjcc=4;
	mul1=1,mul2=1,key_value=0,j1=0;
	num1=0,num2=0,dec1=0,dec2=0,decimal1=0,decimal2=0;
	number1 = 0.0, number2 = 0.0, result = 0.0;
}
 
 
 
void resultShow(float value)//结果显示
{	
	long z_value = 0;
	long dec_value = 0;
	long z_value2=0;
	long value3=0;
	long z_value4=0;
	if(value<0)
	{ 
		write_data('-');
		value=-value;
	}
	if(value<=13000)//小数精度问题
	{	
		z_value = value * 10;//unsigned int放大保留
		z_value2 = value;//unsigned int截断
		z_value4 = value * 100;
		dec_value = z_value - z_value2*10;//要保留的小数
		value3=(z_value4 - z_value2*100)-dec_value*10;//四舍五入的小数
		if(value3>=5 && value3<=9)
		{
			dec_value = dec_value + 1;//获取小数
			if(dec_value==10)
			{
				value=value+1;
				dec_value=0;
			}
		}
		if(dec_value==0)//整数
		{	
			if(z_value2==0)
				write_data('0');
			else
				numShow(value);
		}
		else//有小数
		{	
			if(z_value2==0)
				write_data('0');
			else
				numShow(value);
			write_data('.');
//			if(dec_value<10)//一位小数补两个0
//			{
//				write_data('0');
				write_data('0');
//			}
//			else if(dec_value<100 && dec_value>=10)//两位小数补一个
//				write_data('0');
			numShow(dec_value);
		}
	}
	else
	{
		numShow(value);
	}
}
 
//数字显示
void numShow(long c)//加减乘
{	unsigned char cc[15];
	unsigned int nn=0;
	unsigned int ss=0;
	for(c;c>0;c=c/10)//按位存入数组，倒序存储，最左边是个位
	{ 
		cc[++ss]=c%10;//从个位开始存，然后存的位数加1并向右移位
		nn++;//结果位数加1
	}
  for(nn;nn>0;nn--)//循环显示结果
  {
    write_data(0x30+(cc[nn]));//从数组的右向左显示
  }  
} 
 
//主函数
void main ()
{
	
	lcdinit();
	
	for(x=0;x<12;x++)
	{
    write_data(wel[x]);//显示欢迎语句：Welcome 
		delay(3000); 
	}
	
	write_comm(0x01);
 
	
	while (1) 
	{
		key_scan();	
	}
}