void game() {
  background(0,255,0);
  
  //pause button
  stroke(0);
  fill(255);
  circle(700,100,100);
  line(675,85,675,125);
  line(725,85,725,125);
  
  //Scoring Chart
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
    success.rewind();
    success.play();
  } else if (dist(mouseX,mouseY,700,100) < 50) {
    mode = PAUSE;
  }else {
    lives = lives - 1;
    if (lives == 0) mode = GAMEOVER;
    failure.rewind();
    failure.play();
  }
}
