void gameover() {
  music.pause();
  gameover.play();
  drawGameover();
  //textSize(70);
  fill(0, 255, 255);
  //text("GAME OVER!", 650, 300);

  if (score > 3) {
    text("YOU \n WIN!", width/2, 500);
    success.rewind();
    success.play();
  } else if (lives <= 0) {
    text("YOU \n LOSE!", width/2, 500);
    failure.rewind();
    failure.play();
  }
}

void gameoverClicks () {
  reset();
}

void drawGameover() {
  strokeWeight(1);
  for (int y = 0; y < 800; y++) {
    float t = map(y, 0, 500, 0, 1);
    //                  the darkest color the gradient go -> the lightest the color go and then the amount (t)
    color c = lerpColor(color(255,0,0), color(255,255,0), t);
    stroke(c); //the color of the individual lines changing color to show the gradient
    line(0, y, width, y);
  }
}
