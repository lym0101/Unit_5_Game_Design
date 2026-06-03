void pause() {
  //music.pause();
  fill(255);
  textSize(88);
  text("PAUSE!",400,400);
  textSize(32);
}

void pauseClicks () {
  if (dist(mouseX,mouseY,700,100) < 50) {
    mode = GAME;
  }
}
