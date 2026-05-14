void gameover() {
  music.pause();
  //gameover.play(); //not yet inputed
  background(255,0,0);
  textSize(70);
  fill(0,0,255);
  text("GAME OVER!",400,400);
  noFill();
}

void gameoverClicks () {
  mode = INTRO;
  music.rewind();
}
