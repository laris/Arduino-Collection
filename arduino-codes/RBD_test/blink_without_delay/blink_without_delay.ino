// Arduino RBD Light Library v2.1.7 Example - Blink the Arduino LED without delay.
// https://github.com/alextaujenis/RBD_Light
// Copyright 2016 Alex Taujenis
// MIT License

#include <RBD_Timer.h> // https://github.com/alextaujenis/RBD_Timer
#include <RBD_Light.h> // https://github.com/alextaujenis/RBD_Light

//RBD::Light light(3);
RBD::Light light1(13);
RBD::Light light2(11);

void setup() {
//  light1.blink(250,250);
  light1.blink(50,250);
  light2.blink(250,50);
}

void loop() {
  light1.update();
  delay(300);
  light2.update();
  delay(300);
}
