void game(){
  background(255,0,0);
  
  //display target
  fill(255);
  stroke(0);
  strokeWeight(5);
  circle(x,y,d);
  
  x = x + vx;
  y = y + vy;
  
  //bouncing
  
}

void gameClicks () {
  mode = GAMEOVER;
}
