void option() {
  music.pause();
  background(255);
  textSize(70);
  fill(0);
  text("OPTIONS",400,150);
  noFill();
  
  stroke(0);
  strokeWeight(3);
  
  tactile(140,300,100,100);
  rect(140,300,100,100);
  
  tactile(355,300,100,100);
  rect(355,300,100,100);
  
  tactile(566,300,100,100);
  rect(566,300,100,100);
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

void optionclicks () {
  mode = INTRO;
  music.rewind();
}
