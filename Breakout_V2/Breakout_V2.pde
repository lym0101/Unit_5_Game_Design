//Eric Li
//Programming 11
//Breakout V2

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

//entity variables
float px, py, pd, bx, by, bd;

//keyboard variables
boolean akey, dkey, leftkey, rightkey;

//ball variables
float vx, vy;
float angle = random(0,2*PI);

//Scoring 
int score;
float timer;

//Brick Variables
int[] x;  //declaration
int[] y;

//Sound Variables
Minim minim;
AudioPlayer failure, success, music, gameover;

void setup() {
  size(800,800);
  pixelDensity(1);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  //initialize paddles
  px = width/2;
  py = height;
  pd = 100;
  bx = width/2;
  by = 5*height/8;
  bd = 40;
  
  //initialize keyboard variables
  akey = dkey = leftkey = rightkey = false;
  
  vx = 8;
  vy = 7*sin(cos(angle));
  
  //initialize score
  score = 0;
  timer = 180;
  
  //minim
  minim = new Minim(this);
  music = minim.loadFile("MUSIC1.mp3");
  failure = minim.loadFile("FAILURE1.wav");
  success = minim.loadFile("SUCCESS1.wav");
  gameover = minim.loadFile("Gameover1.mp3");
  
  println(music, failure, success, gameover);
  
  //set up array of bricks
  x = new int[4];  //instantiation
  y = new int[4];

  x[0] = 100;
  y[0] = 100;

  x[1] = 400;
  y[1] = 100;

  x[2] = 700;
  y[2] = 100;
  
  x[3] = 100;
  y[3] = 200;
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
