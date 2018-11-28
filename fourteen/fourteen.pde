import processing.serial.*;
Serial myPort;
PImage logo;
int bgcolor=0;

void setup(){
  logo=loadImage("https://www.arduino.cc/en/pub/skins/arduinoWide/img/logo.png");
  size(400,200);
  colorMode(HSB,255);
  println("Available serial ports:");
  println(Serial.list());
  myPort=new Serial(this,Serial.list()[1],9600);
}

void draw(){
  if(myPort.available()>0){
    bgcolor=myPort.read();
    println(bgcolor);
  }
  background(bgcolor,255,255);
  image(logo,0,0);
}
