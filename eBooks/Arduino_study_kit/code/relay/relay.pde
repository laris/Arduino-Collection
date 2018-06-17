int RelayPin =8; //定义数字接口8 连接三极管基极
void setup()
{
pinMode(RelayPin, OUTPUT); //定义RelayPin 接口为输出接口
}
void loop()
{
digitalWrite(RelayPin, HIGH); //驱动继电器闭合导通
delay(1000); //延时1 秒钟
digitalWrite(RelayPin, LOW); //驱动继电器断开
delay(1000); //延时1 秒钟
}

