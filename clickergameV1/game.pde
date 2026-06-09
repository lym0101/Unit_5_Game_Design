void game() {
  background(#ffb703);
  
  //pause button
  stroke(0);
  fill(255);
  circle(700,100,100);
  line(675,85,675,125);
  line(725,85,725,125);
  
  //Scoring Chart
  fill(0);
  textSize(32);
  text("Score: " + score, width/6, 50);
  text("Lives: " + lives, width/6, 100);
  
  //display target
  
  x = x + vx;
  y = y + vy;
  
  //bouncing
  if (x < d/2 || x > width -d/2) {
    vx = vx * -1;
  }
  if( y < d/2 || y > height -d/2) {
    vy = vy * -1;
    
    drawButton("BACK", 20, 20, 100, 40);
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
    if (lives == 0) {
      mode = GAMEOVER;
      lives = 3;
    }
    failure.rewind();
    failure.play();
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
