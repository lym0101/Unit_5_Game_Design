void game() {
  background(0, 100, 0);

  //center line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, 50);
  line(width/2, 150, width/2, 800);

  //paddles
  circle(px, py, pd);

  //move b paddles
  // Move left paddle — half submerged at edges
  if (akey && py + pd/2 <= height + pd/2) py += 8;
  if (dkey && py - pd/2 >= -pd/2) py -= 8;
  
   //move b
  if (timer == 0) {
    bx = bx + (vx * angle)/3;
    by = by + (vy * angle)/3;
    fill(255);
    if (timer > 240 && timer< 300){
      text("GO!", width/2, height/2);
  }
  }

  // Move right paddle — half submerged at edges
  //if (AI == false) {
    if (rightkey && righty + rightd/2 <= height + rightd/2) righty += 8;
    if (leftkey && righty - rightd/2 >= -rightd/2) righty -= 8;
  }
  //} else {
  //  if (by < righty) {
  //    righty = righty - 5.5;
  //  } 
  //  if (by > righty) {
  //    righty = righty + 5.5;
  //  }
  //}

  //ball
  circle(bx, by, bd);

  //bouncing
  if ( by < bd/2) {
    vy = abs(vy);
  }
  if (by > height -bd/2) {
    vy = -abs(vy);
  }

  //Circle Paddle Collisions
  if (dist (bx, by, px, lefty) <= bd/2 + leftd/2) {
    vx = (bx - px)/9.75;
    vy = (by - lefty)/9.75;
  }
  if (dist (bx, by, rightx, righty) <= bd/2 + rightd/2) {
    vx = (bx - rightx)/10;
    vy = (by - righty)/10;
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
  if (bx < 0 - bd/2) {
    rightscore++;
    bx = width/2;
    by = height/2;
    timer = 240;
  }
  if (bx > width + bd/2) {
    leftscore++;
    bx = width/2;
    by = height/2;
    timer = 240;
  }
  if (leftscore == 3||rightscore ==3) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  mode = PAUSE;
}
