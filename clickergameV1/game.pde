void game() {
  music.play();
  background(#ffb703);

  //pause button
  stroke(0);
  strokeWeight(5);
  fill(255);
  circle(700, 100, 100);
  line(675, 85, 675, 125);
  line(725, 85, 725, 125);

  //Scoring Chart
  fill(0);
  textSize(32);
  text("Score: " + score, width/6, 50);
  text("Lives: " + lives, width/6, 100);

  //display target
   if (targetType == 3) {
    targetCircle();
  } else {
    imageMode(CENTER);
    image(target, x, y, d, d);
  }

  //move target
  x = x + vx;
  y = y + vy;

  //bouncing
  if (x < d/2 || x > width -d/2) {
    vx = vx * -1.025;
  }
  if ( y < d/2 || y > height -d/2) {
    vy = vy * -1.025;
  }
  rectMode(CORNER);
  drawButton("BACK", 20, height-60, 100, 40);
  rectMode(CENTER);
}

void gameClicks() {
  if (dist(mouseX, mouseY, 700, 100) < 50) {
    mode = PAUSE;
  } else if (mouseX > 20 && mouseX < 120 && mouseY > height-60 && mouseY < height-20) {
    mode = INTRO;
  } else if (dist(mouseX, mouseY, x, y) < d/2) {
    score = score + 1;
    success.rewind();
    success.play();
  } else {
    lives = lives - 1;
    if (lives == 0) {
      if (score > highScore) {
        highScore = score;
      }
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
