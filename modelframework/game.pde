void game(){
  background(255,0,0);
  
  fill(0);
  text("Score: " + score, width/6, 50);
  text("Lives: " + lives, width/6, 100);
  
  //display target
  fill(255);
  stroke(0);
  strokeWeight(5);
  circle(x,y,d);
  
  x = x + vx;
  y = y + vy;
  
  //bouncing
  if (x < d/2 || x > width -d/2) {
    vx = vx * -1;
  }
  if( y < d/2 || y > height -d/2) {
    vy = vy * -1;
  }
}

void gameClicks () {
  if (dist(mouseX, mouseY, x, y) < d) {
    score = score + 1;
  } else {
    lives = lives - 1;
    if (lives == 0) mode = GAMEOVER;
  }
}
