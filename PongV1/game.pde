void game() {
  background(0);
  
  //paddles
  circle(leftx, lefty, leftd);
  circle(rightx,righty,rightd);
  
  //move ball paddles
  if (wkey == true) lefty = lefty - 8;
  if (skey == true) lefty = lefty + 8;
  
  if (upkey == true) righty = righty - 8;
  if (downkey == true) righty = righty + 8;
  
  //ball
  circle(ballx, bally, balld);
  
  ballx = ballx + vx;
  bally = bally + vy;
  
  //bouncing
  if( bally < balld/2 || bally > height -balld/2) {
    vy = vy * -1;
  }
  
  //Circle Paddle Collisions
  if (dist (ballx,bally,leftx,lefty) <= balld/2 + leftd/2) {
    vx = (ballx - leftx)/10;
    vy = (bally - lefty)/10;
  }
  if (dist (ballx,bally,rightx,righty) <= balld/2 + rightd/2) {
    vx = (ballx - rightx)/10;
    vy = (bally - righty)/10;
  }
  
  //scoreboard
  textSize(50);
  fill(255);
  text(leftscore, width/4, 100);
  text(rightscore, 3*width/4, 100);
}

void gameClicks() {
  
}
