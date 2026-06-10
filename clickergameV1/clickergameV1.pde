//Eric Li
//Processing 11
//Clicker Game

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage lemon;
PImage avatar;
int targetType = 3;
PImage target;

//Mode Variables 

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTION = 4;

//Target Variables
float x,y,d;
float vx,vy;
float angle = random(0,2*PI);
float sliderX;
float radius;

//Sound Variables
Minim minim;
AudioPlayer failure, success, music, gameover;

int score, lives, highScore;

void setup () {
  size(800,800);
  pixelDensity(1);
  mode = INTRO;
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
  //target initialization
  x= width/2;
  y= height/2;
  d= 100;
  
  vx = 6;
  vy = 5*sin(angle);
  
  score = 0;
  lives = 3;
  highScore = 0;
  
  //minim
  minim = new Minim(this);
  music = minim.loadFile("MUSIC.mp3");
  failure = minim.loadFile("FAILURE.wav");
  success = minim.loadFile("SUCCESS.wav");
  gameover = minim.loadFile("Gameover.mp3");
  
  lemon = loadImage("Lemon Transparent.png");
  avatar = loadImage("sandrone1.png");
  targetType = 1;
  sliderX = 102.5;
  
  println(music, failure, success, gameover, lemon, avatar);
}

//Colour Pallette

void draw() {
  if (mode == INTRO) {
    intro();
  }else if (mode == GAME) {
    game();
  }else if (mode == PAUSE) {
    pause();
  }else if (mode == GAMEOVER) {
    gameover();
  }else if (mode == OPTION) {
    option();
  }else {
    println("Error: Mode = " + mode);
  }
}
