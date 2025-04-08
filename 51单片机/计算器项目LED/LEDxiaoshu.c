void LCD_ShowSXiaoNum(unsigned char Line,unsigned char Column,float num)
{
	unsigned char i,length2=0,length1=0,pan=0;
	float num1,temp;
	long total;
	num1=num;
	temp=num;
	while((int)num!=0)
	{
		num/=10.0;
		length1++;
	}
	while((num1-(int)num1)!=0)
	{
		num1*=10;
		length2++;
		if(length2>=3)
			break;
	}
	total=temp*(LCD_Pow(10,length2));
	LCD_SetCursor(Line,Column);
	for(i=length1+length2;i>0;i--)
	{
		if(pan==0 && i==length2)
		{
			LCD_WriteData(0+'0');
		}
		if(i==length2)
		{
			LCD_WriteData('.');
		}
		LCD_WriteData(total/LCD_Pow(10,i-1)%10+'0');
		pan=1;
	}
}