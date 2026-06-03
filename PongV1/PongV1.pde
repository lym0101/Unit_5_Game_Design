//Eric Li
//Programming 11
//Pong V1

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode framework
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;
final int OPTIONS  = 5;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball

//keyboard variables
boolean wkey, skey, upkey, downkey;

//ball variables
float vx, vy;
float angle = random(0,2*PI);

//Scoring 
int leftscore, rightscore;
float timer;

//Sound Variables
Minim minim;
//AudioPlayer failure, success, music, gameover;

void setup() {
  size(1300,800);
  pixelDensity(1);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  
  //initialize keyboard variables
  wkey = skey = upkey = downkey = false;
  
  vx = 8;
  vy = 7*sin(cos(angle));
  
  //initialize score
  rightscore = leftscore = 0;
  timer = 240;
  
  //minim
  minim = new Minim(this);
  //music = minim.loadFile("MUSIC.mp3");
  //failure = minim.loadFile("FAILURE.wav");
  //success = minim.loadFile("SUCCESS.wav");
  //gameover = minim.loadFile("Gameover.mp3");
}

void draw() {
  if (mode == INTRO) {
    intro();
  }else if (mode == GAME) {
    game();
  }else if (mode == PAUSE) {
    pause();
  }else if (mode == GAMEOVER) {
    gameover();
  }else {
    println("Mode Error: " + mode);
  }
}
