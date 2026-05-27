//Eric Li
//Programming 11
//Pong V1

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
int leftscore, rightscore, timer;

void setup() {
  size(1000,800);
  pixelDensity(1);
  mode = GAME;
  
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
  
  vx = 7*cos(angle);
  vy = 7*sin(angle);
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
  }else if (mode == OPTIONS) {
    options();
  }else {
    println("Mode Error: " + mode);
  }
}
