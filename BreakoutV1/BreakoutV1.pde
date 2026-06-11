import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Eric Li
//Programming 11
//Breakout V1

import gifAnimation.*; 

//mode framework
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;

//paddle (a circle)
float paddlex, paddley, paddled;

//keyboard variables
boolean akey, dkey, leftkey, rightkey;

//ball
float ballx, bally, balld;
float vx, vy;

//bricks (all circles)
int totalBricks; //int n in video
float[] brickx, bricky, brickd;
color[] brickcol;
boolean[] alive;
color[] rowColors = {#ff595e, #ff924c, #ffca3a, #8ac926, #1982c4, #6a4c93};

//scoring + lives
int score, lives;
boolean won;

//sound
//Minim minim;
//AudioPlayer music, bounce, success, failure, gameoversound;

//gif
//Gif introGif;

void setup() {
  size(1300, 800);
  pixelDensity(1);
  textAlign(CENTER, CENTER);

  //minim = new Minim(this);
  //music = minim.loadFile("MUSIC1.mp3");
  //bounce = minim.loadFile("BOUNCE1.wav");
  //success = minim.loadFile("SUCCESS1.wav");
  //failure = minim.loadFile("FAILURE1.wav");
  //gameoversound = minim.loadFile("Gameover1.mp3");

  //introGif = new Gif(this, "intro.gif");  //put intro.gif in the data folder
  //introGif.loop();

  makeBricks();
  reset();
  mode = INTRO;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error: " + mode);
  }
}
