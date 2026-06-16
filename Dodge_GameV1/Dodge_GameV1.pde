//Eric Li
//Programming 11
//Dodge Game V1

//mode framework
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;

//entity variables
float px, py, pd, bx, by, bd, brickd;

//keyboard variables
boolean akey, dkey, leftkey, rightkey;

//ball variables
float vx, vy;
//float angle = random(0,2*PI);

//Scoring 
int score;
float timer;

//Brick Variables
int[] x;  //declaration
int[] y;
int n;
int tempx, tempy;
boolean [] alive;
int lives;

PImage [] gif;
int numberOfFrames;
int f;

//setting up player variables
float px, py;
final float PW = 40, PH = 20; // player width/height

// === OBJECTS ===
ArrayList<float[]> objects; // each entry: {x, y, w, h}
float fallSpeed;
int spawnTimer, spawnRate; // spawnRate in frames

// === SCORE ===
int score;

// ========================

void setup() {
  size(500, 600);
  initGame();
}

void initGame() {
  px = width / 2;
  py = height - 50;
  objects = new ArrayList<float[]>();
  fallSpeed = 3;
  spawnTimer = 0;
  spawnRate = 60; // spawn every 60 frames
  score = 0;
}

void draw() {
  if      (mode == START) drawStart();
  else if (mode == GAME)  drawGame();
  else if (mode == OVER)  drawOver();
}

void drawGame() {
  background(30);
  movePlayer();
  handleObjects();
  drawPlayer();
  drawObjects();
  drawScore();
  
  score++;
  // ramp up difficulty every 300 frames
  if (frameCount % 300 == 0) {
    fallSpeed += 0.5;
    spawnRate = max(20, spawnRate - 5);
  }
}

////Sound Variables
//Minim minim;
//AudioPlayer failure, success, music, gameover;

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
  by = 6*height/8 +20 ;
  bd = 20;
  brickd = 40;
  lives = 3;
  
  //initialize keyboard variables
  akey = dkey = leftkey = rightkey = false;
  
  vx = 0;
  vy = 7;
  
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
  n = 35; //5*7
  x = new int[n];  //instantiation
  y = new int[n];
  alive = new boolean [n];

  tempx = 100;
  tempy = 75;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 100;
    }
    i = i + 1;
  }
  numberOfFrames = 90;
  gif = new PImage [numberOfFrames];
  
  int f = 0;
  while (f < numberOfFrames) {
    gif[f] = loadImage("frame_"+f+"_delay-0.04s.gif");
    f++;
  }
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
