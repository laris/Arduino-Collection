#include <RBD_Light.h>

#define key 2
#define outputA 3
#define outputB 4
int statKey=0;
int statA=0;
int statB=0;
RBD::Light led13(13);

void setup() {
	pinMode(LED_BUILTIN, OUTPUT);
	pinMode (key, INPUT);
	pinMode (outputA, INPUT);
	pinMode (outputB, INPUT);
	Serial.begin(9600);
	led13.blink(200,200);
}

void scanPIN(){
	statKey=digitalRead(key);
	statA=digitalRead(outputA);
	statB=digitalRead(outputB);
}
void printStatus(){
/*	Serial.print("status Key:             ");
	Serial.println(statKey,DEC);
	Serial.print("status outputA: ");
	Serial.println(statA,DEC);
	Serial.print("status outputB: ");
	Serial.println(statB,DEC);
*/
	Serial.print(millis());
	Serial.print(" ");
	Serial.print(statA);
	Serial.print(" ");
	Serial.print(statB);
	Serial.println();
}
void printStatus1(){
	if (statA > statB){
		Serial.println("A>B");
	}
	else if (statA < statB){
		Serial.println("A<B");
	}
	else { 
		Serial.println("A=B");
	}
}

void loop() {
	scanPIN();
	printStatus();
//	led13.update();
//	delay(500);
}




