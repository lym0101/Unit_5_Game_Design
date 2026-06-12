void game() {
  background(0, 100, 0);

  //center line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, 50);
  line(width/2, 150, width/2, 800);

  //paddles
  fill(255);
  stroke(0);
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);

  //move ball paddles
  // Move left paddle — half submerged at edges
  if (skey && lefty + leftd/2 <= height + leftd/2) lefty += 8;
  if (wkey && lefty - leftd/2 >= -leftd/2) lefty -= 8;

  //move ball
  if (timer == 0) {
    ballx = ballx + (vx * angle)/2.5;
    bally = bally + (vy * angle)/2.5;
    fill(255);
    if (timer > 240 && timer< 300) {
      text("GO!", width/2, height/2);
    }
  }

  // Move right paddle — half submerged at edges
  if (AI == false) {
    if (downkey && righty + rightd/2 <= height + rightd/2) righty += 8;
    if (upkey && righty - rightd/2 >= -rightd/2) righty -= 8;
  } else {
    if (bally < righty) {
      righty = righty - 5.5;
    }
    if (bally > righty) {
      righty = righty + 5.5;
    }
  }

  //ball
  circle(ballx, bally, balld);

  //bouncing
  if ( bally < balld/2) {
    vy = abs(vy);
  }
  if (bally > height -balld/2) {
    vy = -abs(vy);
  }

  //Circle Paddle Collisions
  if (dist (ballx, bally, leftx, lefty) <= balld/2 + leftd/2) {
    vx = (ballx - leftx)/9.75;
    vy = (bally - lefty)/9.75;
  }
  if (dist (ballx, bally, rightx, righty) <= balld/2 + rightd/2) {
    vx = (ballx - rightx)/9.75;
    vy = (bally - righty)/9.75;
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
  if (leftscore == 3||rightscore ==3) {
    mode = GAMEOVER;
  }
  rectMode(CORNER);
  drawButton("HOME", 20, height-60, 100, 40);
  rectMode(CENTER);
}

void gameClicks() {
  if (mouseX > 20 && mouseX < 120 && mouseY > height-60 && mouseY < height-20) {
    mode = INTRO;
  } else {
    mode = PAUSE;
  }
}

void drawButton(String label, float bx, float by, float bw, float bh) {
  stroke(0);
  fill(255);
  rect(bx, by, bw, bh, 8);
  fill(0);
  textSize(18);
  text(label, bx + bw/2, by + bh/2);
}
