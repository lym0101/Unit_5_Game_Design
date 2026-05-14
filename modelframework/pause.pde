void pause() {
  music.pause();
  textSize(68);
  text("PAUSE!",400,400);
}

void pauseClicks () {
  if (dist(mouseX,mouseY,700,100) < 50) {
    mode = PAUSE;
  }
}
