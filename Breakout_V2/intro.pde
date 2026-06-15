void intro() {
  //music.play();

  drawIntro();

  strokeWeight(1);
  fill(0);
  textSize(52);
  text("BREAKKKKKKOUT!", width/2, 300);

  tactile(300, 550, 200, 100); // not working currently
  fill(10, 0, 216, 190);
  stroke(255);
  textSize(36);
  rect(width/2, 550, 200, 100, 20);
  fill(255);
  text("START", width/2, 550);

  noFill();
}

void introClicks () {
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
    music.pause();
    music.rewind();
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
