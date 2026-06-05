void gameover() {
  music.pause();
  gameover.play();
  background(255,0,0);
  textSize(70);
  fill(0,255,255);
  text("GAME OVER!",650,300);
  noFill();
}

void gameoverClicks () {
  mode = INTRO;
  music.rewind();
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(#42fa45);
    fill(#a2d2ff);
  } else {
    stroke(#03045e);
    fill(255,255,194);
  }
}
