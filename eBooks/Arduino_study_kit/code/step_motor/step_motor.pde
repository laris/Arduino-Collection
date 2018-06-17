//定义与 Arduino 的端口连接引脚；
int IN1 = 5;
int IN2 = 6;
int IN3 = 7;
int IN4 = 8;
int key = 9; //外部按键，控制电机的正反转，有按下时，电机状态反转；
boolean direct = false; //电机转向，初始化为正转；
int steps = 0; //电机八拍中的某一拍值； 
void setup()  //端口属性初始化；
{
pinMode(IN1,OUTPUT); //四相八拍步进电机
pinMode(IN2,OUTPUT);
pinMode(IN3,OUTPUT);
pinMode(IN4,OUTPUT);
pinMode(key,INPUT); //外部按键；
}
void step_code(int steps) 
{
switch(steps) //下面的驱动电平可参阅上表格所示；
{
case 1:
{
digitalWrite(IN1,LOW);
digitalWrite(IN2,LOW);
digitalWrite(IN3,LOW);
digitalWrite(IN4,HIGH);
break;
}
case 2:
{
digitalWrite(IN1,LOW);
digitalWrite(IN2,LOW);
digitalWrite(IN3,HIGH);
digitalWrite(IN4,HIGH);
break;
}
case 3:
{
  http://keyes-arduino.taobao.com
digitalWrite(IN1,LOW);
digitalWrite(IN2,LOW);
digitalWrite(IN3,HIGH);
digitalWrite(IN4,LOW);
break;
}
case 4:
{
digitalWrite(IN1,LOW);
digitalWrite(IN2,HIGH);
digitalWrite(IN3,HIGH);
digitalWrite(IN4,LOW);
break;
}
case 5:
{
digitalWrite(IN1,LOW);
digitalWrite(IN2,HIGH);
digitalWrite(IN3,LOW);
digitalWrite(IN4,LOW);
break;
}
case 6:
{
digitalWrite(IN1,HIGH);
digitalWrite(IN2,HIGH);
digitalWrite(IN3,LOW);
digitalWrite(IN4,LOW);
break;
}
case 7:
{
digitalWrite(IN1,HIGH);
digitalWrite(IN2,LOW);
digitalWrite(IN3,LOW);
digitalWrite(IN4,LOW);
break;
}
case 8:
//http://keyes-arduino.taobao.com
{
digitalWrite(IN1,HIGH);
digitalWrite(IN2,LOW);
digitalWrite(IN3,LOW);
digitalWrite(IN4,HIGH);
break;
}
default:
{
digitalWrite(IN1,LOW);
digitalWrite(IN2,LOW);
digitalWrite(IN3,LOW);
digitalWrite(IN4,LOW);
break;
}
}
}
boolean key_scan() //检测外部按键是否有按下；
{
if(digitalRead(key) == LOW)
{
delay(20); //前沿延时消抖；
if(digitalRead(key) == LOW)
{
direct = ! direct; //有按下，取反 direct；
}
while(digitalRead(key) == LOW); //等待按键松开,后沿不消抖处理；
}
return direct;
}
void loop()
{
while(1)
{
if(! key_scan())
{
steps --;
if(steps < 1) steps = 8;
}
//http://keyes-arduino.taobao.com
else 
{
steps ++;
if(steps > 8) steps = 1;
}
step_code(steps);
delay(1);
}
}
