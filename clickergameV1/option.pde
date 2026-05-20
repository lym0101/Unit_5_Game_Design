void option() {
  music.pause();
  background(255,0,0);
  textSize(70);
  fill(0);
  text("OPTIONS",400,200);
  noFill();
}

void optionclicks () {
  mode = INTRO;
  music.rewind();
}
