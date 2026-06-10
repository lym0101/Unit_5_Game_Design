void pause() {
  music.pause();
  textSize(88);
  text("PAUSE!",400,400);
  textSize(32);
  text("Score: " + score, width/4, 600);
  text("Lives: " +lives, width-width/4, 600);
}

void pauseClicks () {
  if (dist(mouseX,mouseY,700,100) < 50) {
    mode = GAME;
  } else if (mouseX > 20 && mouseX < 120 && mouseY > height-60 && mouseY < height-20) {
    mode = INTRO;
  }
}
