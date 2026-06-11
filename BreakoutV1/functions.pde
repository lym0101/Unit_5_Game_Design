void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(#42fa45);
    fill(#a2d2ff);
  } else {
    stroke(#03045e);
    fill(255,255,194);
  }
}

void drawScore() {
  fill(255);
  textSize(28);
  text("Score: " + score, 100, 35);
  text("Lives: " + lives, width - 100, 35);
}

//Builds a staggered pyramid pattern: each row has a DIFFERENT number of
//bricks (12, 11, 10, 9, 8, 7), centered, with gaps from the sides and top.
//Each row gets its own color. Different from the class grid pattern.

void makeBricks() {
  int rows = 6;
  totalBricks = 0;
  for (int r = 0; r < rows; r++) totalBricks += 12 - r;   

  brickx   = new float[totalBricks];
  bricky   = new float[totalBricks];
  brickd   = new float[totalBricks];
  brickcol = new color[totalBricks];
  alive    = new boolean[totalBricks];

  float d = 60;          //brick diameter
  float gap = 18;        //space between bricks
  float topGap = 80;     //gap from top of screen
  int i = 0;

  for (int r = 0; r < rows; r++) {
    int cols = 12 - r;                                  //fewer bricks each row
    float rowWidth = cols * d + (cols - 1) * gap;
    float startx = (width - rowWidth) / 2 + d/2;        //centers row = side gaps

    for (int c = 0; c < cols; c++) {
      brickx[i] = startx + c * (d + gap);
      bricky[i] = topGap + r * (d + gap) + d/2;
      brickd[i] = d;
      brickcol[i] = rowColors[r];
      alive[i] = true;
      i++;
    }
  }
}

//Resets EVERYTHING: score, lives, paddle, ball, velocity, and all bricks.
void reset() {
  score = 0;
  lives = 3;
  won = false;

  paddled = 140;
  paddlex = width/2;
  paddley = height - 40;

  resetBall();

  for (int i = 0; i < totalBricks; i++) alive[i] = true;
}

//Ball back to start position + starting velocity (used after losing a life too)
void resetBall() {
  balld = 30;
  ballx = width/2;
  bally = height/2 + 100;
  vx = random(-5, 5);
  vy = -7;
}
