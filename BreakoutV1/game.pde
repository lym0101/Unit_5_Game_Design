void game() {
  background(#03045e);

  drawBricks();
  movePaddle();
  moveBall();
  checkBrickHits();
  checkPaddleHit();
  drawScore();

  //win condition: all bricks gone
  if (score == totalBricks) {
    won = true;
    mode = GAMEOVER;
  }
}

void drawBricks() {
  noStroke();
  for (int i = 0; i < totalBricks; i++) {
    if (alive[i]) {
      fill(brickcol[i]);
      circle(brickx[i], bricky[i], brickd[i]);
    }
  }
}

void movePaddle() {
  //mouse control, clamped so the paddle can't leave the screen
  paddlex = constrain(mouseX, paddled/2, width - paddled/2);
  fill(#a2d2ff);
  noStroke();
  circle(paddlex, paddley, paddled);
}

void moveBall() {
  ballx += vx;
  bally += vy;

  //walls (left, right, top)
  if (ballx - balld/2 < 0) {
    ballx = balld/2;
    vx = -vx;
    //bounce.rewind();
    //bounce.play();
  }
  if (ballx + balld/2 > width) {
    ballx = width - balld/2;
    vx = -vx;
    //bounce.rewind();
    //bounce.play();
  }
  if (bally - balld/2 < 0) {
    bally = balld/2;
    vy = -vy;
    //bounce.rewind();
    //bounce.play();
  }

  //bottom of screen = lose a life
  if (bally - balld/2 > height) {
    lives = lives - 1;
    //failure.rewind();
    //failure.play();
    if (lives == 0) {
      won = false;
      mode = GAMEOVER;
    } else {
      resetBall();
    }
  }

  fill(255);
  circle(ballx, bally, balld);
}

//Circle-circle collision + reflection so the ball bounces at the CORRECT angle:
//reflect the velocity across the line connecting the two centers (the normal).
void bounceOff(float cx, float cy) {
  float d = dist(ballx, bally, cx, cy);
  float nx = (ballx - cx) / d;          //normal vector (unit length)
  float ny = (bally - cy) / d;
  float dot = vx*nx + vy*ny;
  vx = vx - 2*dot*nx;
  vy = vy - 2*dot*ny;
  //push the ball out so it doesn't get stuck inside
  ballx = cx + nx * (balld/2 + balld/2 + 1);
}

void checkBrickHits() {
  for (int i = 0; i < totalBricks; i++) {
    if (alive[i] && dist(ballx, bally, brickx[i], bricky[i]) < balld/2 + brickd[i]/2) {
      //reflect at correct angle off the brick
      float d = dist(ballx, bally, brickx[i], bricky[i]);
      float nx = (ballx - brickx[i]) / d;
      float ny = (bally - bricky[i]) / d;
      float dot = vx*nx + vy*ny;
      vx = vx - 2*dot*nx;
      vy = vy - 2*dot*ny;

      alive[i] = false;     //brick disappears
      score = score + 1;    //score goes up by 1
      //success.rewind();
      //success.play();
      break;                //only one brick per frame
    }
  }
}

void checkPaddleHit() {
  if (dist(ballx, bally, paddlex, paddley) < balld/2 + paddled/2 && vy > 0) {
    float d = dist(ballx, bally, paddlex, paddley);
    float nx = (ballx - paddlex) / d;
    float ny = (bally - paddley) / d;
    float dot = vx*nx + vy*ny;
    vx = vx - 2*dot*nx;
    vy = vy - 2*dot*ny;
    //move ball to the paddle surface so it can't tunnel through
    ballx = paddlex + nx * (balld/2 + paddled/2);
    bally = paddley + ny * (balld/2 + paddled/2);
    //  bounce.rewind();
    //  bounce.play();
  }
}

void gameClicks() {
  mode = PAUSE;   //clicking the screen pauses
}
