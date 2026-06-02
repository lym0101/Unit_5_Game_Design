void game() {
  background(0);

  //center line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, 800);

  //paddles
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);

  //move ball paddles
  if (wkey == true) lefty = lefty - 10;
  if (skey == true) lefty = lefty + 10;

  if (upkey == true) righty = righty - 10;
  if (downkey == true) righty = righty + 10;

  //ball
  circle(ballx, bally, balld);

  //move ball
  if (timer == 0) {
    ballx = ballx + (vx * angle)/3;
    bally = bally + (vy * angle)/3;
    fill(255);
    text("GO!", width/2, height/2);
  }

  //bouncing
  if ( bally < balld/2) {
    vy = abs(vy);
  }
  if (bally > height -balld/2) {
    vy = -abs(vy);
  }

  //Circle Paddle Collisions
  if (dist (ballx, bally, leftx, lefty) <= balld/2 + leftd/2) {
    vx = (ballx - leftx)/10;
    vy = (bally - lefty)/10;
  }
  if (dist (ballx, bally, rightx, righty) <= balld/2 + rightd/2) {
    vx = (ballx - rightx)/10;
    vy = (bally - righty)/10;
  }

  //scoreboard
  textSize(50);
  fill(255);
  text(leftscore, width/4, 100);
  text(rightscore, 3*width/4, 100);

  if (timer > 0) {
    fill(255);
    text(timer/60, width/2, 100);
    timer = timer - 1;
  } else {
    noFill();
  }

  fill(255);

  //scoring
  if (ballx < 0 - balld/2) {
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 240;
  }
  if (ballx > width + balld/2) {
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 240;
  }
  if (lefty+leftd/2<=height-3) {
    if (skey) lefty+=7;
  }
  if (lefty-leftd/2>=3) {
    if (wkey) lefty -=7;
  }
  if (righty-rightd/2>=3) {
    if (upkey) righty-=7;
  }
  if (righty+rightd/2<=height-3) {
    if (downkey) righty+=7;
  }
}

void gameClicks() {
  mode = PAUSE;
}
