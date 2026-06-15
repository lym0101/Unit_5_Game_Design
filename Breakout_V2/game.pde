void game() {
  background(0, 100, 0);

  //paddles
  circle(px, py, pd);

  //move paddles
  // Move left paddle — half submerged at edges
  if (akey && px + pd/2 <= width + pd/2) px += 8;
  if (dkey && px - pd/2 >= width - pd/2) px -= 8;

  //move paddle
  if (timer == 0) {
    bx = bx + (vx * angle)/3;
    by = by + (vy * angle)/3;
    fill(255);
    if (timer > 240 && timer< 300) {
      text("GO!", width/2, height/2);
    }
    //bricks
    //circle(x[0], y[0], bd);
    //circle(x[1], y[1], bd);
    //circle(x[2], y[2], bd);
    
    int i = 0;
    while (i<4) {
      circle(x[i],y[i],bd);
      i++;
    } 
  }

  // Move right paddle — half submerged at edges
  if (rightkey && px + pd/2 <= width + pd/2) px += 8;
  if (leftkey && px - pd/2 >= width -pd/2) px -= 8;

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
  if (dist (bx, by, px, py) <= bd/2 + pd/2) {
    vx = (bx - px)/9.75;
    vy = (by - py)/9.75;
  }

  //scoreboard
  textSize(50);
  fill(255);
  text(score, 7*width/8, 700);

  if (timer > 0) {
    fill(255);
    text(timer/60, width/2, 100);
    timer = timer - 1;
  } else {
    noFill();
  }

  fill(255);
  
  }

//  //scoring
//  if (bx < 0 - bd/2) {
//    rightscore++;
//    bx = width/2;
//    by = height/2;
//    timer = 240;
//  }
//  if (bx > width + bd/2) {
//    leftscore++;
//    bx = width/2;
//    by = height/2;
//    timer = 240;
//  }
//  if (leftscore == 3||rightscore ==3) {
//    mode = GAMEOVER;
//  }
//}

void gameClicks() {
  mode = PAUSE;
}
