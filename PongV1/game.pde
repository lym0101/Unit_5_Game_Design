void game() {
  background(0);
  
  //paddles
  circle(leftx, lefty, leftd);
  circle(rightx,righty,rightd);
  
  //move ball paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;
  
  if (upkey == true) righty = righty - 5;
  if (downkey == true) righty = righty + 5;
  
  //ball
  circle(ballx, bally, balld);
  
  ballx = ballx + vx;
  bally = bally + vy;
  
  //bouncing
  if( bally < balld/2 || bally > height -balld/2) {
    vy = vy * -1;
  }
}

void gameClicks() {
  
}
