import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Eric Li
//Processing 11
//Clicker Game

//Mode Variables 

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//Target Variables
float x,y,d;
float vx,vy;
float angle = random(0,2*PI);

//Sound Variables
Minim minim;
AudioPlayer failure, success, music;

int score, lives;

void setup () {
  size(800,800);
  mode = INTRO;
  textAlign(CENTER,CENTER);
  //rectMode(CENTER);
  
  //target initialization
  x= width/2;
  y= height/2;
  d= 100;
  
  vx = 5*cos(angle);
  vy = 5*sin(angle);
  
  score = 0;
  lives = 3;
  
  //minim
  minim = new Minim(this);
  music = minim.loadFile("MUSIC.mp3");
  failure = minim.loadFile("FAILURE.wav");
  success = minim.loadFile("SUCCESS.wav");
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
  }else {
    println("Error: Mode = " + mode);
  }
}
