void gameover() {
  music.pause();
  gameover.play();
  drawGameover();
  textSize(70);
  fill(0, 255, 255);
  text("GAME OVER!", 650, 300);
  noFill();

  if (leftscore > rightscore) {
    text("LEFT SIDE \n WINS!", 650, 500);
    success.rewind();
    success.play();
  } else {
    text("RIGHT SIDE \n WINS!", 650, 500);
    success.rewind();
    success.play();
  }
}

void gameoverClicks () {
  reset();
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(#42fa45);
    fill(#a2d2ff);
  } else {
    stroke(#03045e);
    fill(255, 255, 194);
  }
}

void reset() {
  mode = INTRO;
  music.rewind();
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
  timer = 180;
}

void drawGameover() {
  strokeWeight(1);
  for (int y = 0; y < 800; y++) {
    float t = map(y, 0, 500, 0, 1);
    //                  the darkest color the gradient go -> the lightest the color go and then the amount (t)
    color c = lerpColor(color(255, 0, 0), color(255, 255, 0), t);
    stroke(c); //the color of the individual lines changing color to show the gradient
    line(0, y, width, y);
  }
}
