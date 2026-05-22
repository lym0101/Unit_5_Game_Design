void gameover() {
  music.pause();
  gameover.play();
  background(255,0,0);
  textSize(70);
  fill(0,255,255);
  text("GAME OVER!",400,400);
  noFill();
  
  tactile(400,600,100,50);
  rect(400,600,100,50);
}

void gameoverClicks () {
  mode = INTRO;
  music.rewind();
}
