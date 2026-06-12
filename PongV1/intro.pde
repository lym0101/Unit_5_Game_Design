void intro() {
  //music.play();

  drawIntro();

  strokeWeight(1);
  fill(0);
  textSize(72);
  text("PONG!", 650, 300);

  tactile(550, 500, 200, 100);
  //fill(10, 0, 216, 190);
  stroke(255);
  textSize(36);
  rect(650, 550, 200, 100, 20);
  fill(0);
  text("1 PLAYER", 650, 550);

  tactile(550, 650, 200, 100);
  //fill(10, 0, 216, 190);
  stroke(255);
  rect(650, 700, 200, 100, 20);
  fill(0);
  text("2 PLAYER", 650, 700);
  noFill();
}

void introClicks () {
  if (mouseX > 550 && mouseX < 750 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
    music.pause();
    music.rewind();
    AI = true;
  }
  if (mouseX > 550 && mouseX < 750 && mouseY > 650 && mouseY < 750) {
    mode = GAME;
    music.pause();
    music.rewind();
    AI = false;
  }
}

void drawIntro() {
  strokeWeight(1);
  for (int y = 0; y < 800; y++) {
    float t = map(y, 0, 500, 0, 1);
    //                  the darkest color the gradient go -> the lightest the color go and then the amount (t)
    color c = lerpColor(color(128, 0, 128), color(255, 182, 193), t);
    stroke(c); //the color of the individual lines changing color to show the gradient
    line(0, y, width, y);
  }
}
