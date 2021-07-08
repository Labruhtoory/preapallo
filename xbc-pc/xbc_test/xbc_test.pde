String config = "xboxHID"; //This is the name of your config file from the GCP configurator
String errmess1 = "could not connect to the controller";

/*
For this program, you need to install these folowing libraries:
 - Arduino
 - G4P
 - Game Control Plus
*/

import processing.serial.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
import cc.arduino.*; 
import org.firmata.*;

ControlDevice cont;
ControlIO control;
Arduino arduino;


float thrust;
float yaw;
float sZ;
float sX;
float ign;
float rotRL;
float lB;
float rB;
float a;
float b;
float x;
float y;
float bV;
float bM;
float lJD;
float rJD;
float trim;


void setup() {
  System.out.println("Setting up...");
  control = ControlIO.getInstance(this);
  cont = control.getMatchedDevice(config);
   if (cont == null) {
    println(errmess1);
    System.exit(-1);
  }
  
  Arduino.list();
  //arduino = new Arduino(this, Arduino.list()[2], 57600);
  arduino.pinMode(2, Arduino.SERVO); //
  arduino.pinMode(3, Arduino.SERVO); //
  arduino.pinMode(4, Arduino.SERVO); //
  arduino.pinMode(5, Arduino.SERVO); // 
  arduino.pinMode(6, Arduino.SERVO); // Setup Pins to be used
  arduino.pinMode(7, Arduino.SERVO); //
  arduino.pinMode(8, Arduino.SERVO); //
  arduino.pinMode(9, Arduino.SERVO); //
  arduino.pinMode(10, Arduino.SERVO); //
}


public void getUserInput(){                   
  
 //Get input from controller and assign a value
  
 // Input from joysticks & triggers
 
 thrust = map(cont.getSlider("thrust").getValue(), -1, 1, 0, 180); // Toggle left joystick: up>+ down>- 
 yaw = map(cont.getSlider("yaw").getValue(), -1, 1, 0, 180); // Toggle left joystick: right>+ left>-
 sZ = map(cont.getSlider("slideZ").getValue(), -1, 1, 0, 180); // Toggle right joystick: up>+ down>- 
 sX = map(cont.getSlider("slideX").getValue(), -1, 1, 0, 180); // Toggle right joystick: right>+ left>-
 ign = map(cont.getSlider("ign").getValue(), -1, 1, 0, 180); // Toggle triggers: right>+ left>-
 
 //Buttons are valued @: on>1 off>0
  
 a = map(cont.getButton("butA").getValue(), -1, 1, 0, 180); // A button
 b = map(cont.getButton("butB").getValue(), -1, 1, 0, 180); // B button
 x = map(cont.getButton("butX").getValue(), -1, 1, 0, 180); // X button
 y = map(cont.getButton("butY").getValue(), -1, 1, 0, 180); // Y button
 lB = map(cont.getButton("lBump").getValue(), -1, 1, 0, 180); // Left Bumper
 rB = map(cont.getButton("rBump").getValue(), -1, 1, 0, 180); // Right Bumper
 bV = map(cont.getButton("butView").getValue(), -1, 1, 0, 180); // View Button
 bM = map(cont.getButton("butMenu").getValue(), -1, 1, 0, 180); // Menu Button
 lJD = map(cont.getButton("lJoyDown").getValue(), -1, 1, 0, 180); // Pressing the left joysitck down
 rJD = map(cont.getButton("rJoyDown").getValue(), -1, 1, 0, 180); //  Pressing the right joysitck down
 
 //The dpad values: up>2 right>4 down>6 left>8
 
 trim = map(cont.getButton("trim").getValue(), -1, 1, 0, 180); // directional pad
}


void draw(){
 getUserInput();
 
 /*arduino.servoWrite(2, (int)thrust); //Toggle left joystick to the up & down to make brighter and dimmer 
 arduino.servoWrite(3, (int)yaw); //Toggle left joystick to the right & left to make brighter and dimmer
 arduino.servoWrite(4, (int)sZ); //Toggle right joystick to the up & down to make brighter and dimmer
 arduino.servoWrite(5, (int)sX); //Toggle right joystick to the right & left to make brighter and dimmer
 arduino.servoWrite(6, (int)ign); //Toggle left and right triggers to make brighter and dimmer
 arduino.servoWrite(7, (int)a); //push A to make brighter
 arduino.servoWrite(8, (int)b); //push B to make brighter
 arduino.servoWrite(9, (int)x); //push X to make brighter
 arduino.servoWrite(10, (int)y); //push Y to make brighter*/
}
