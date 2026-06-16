void reset() {
  mode = INTRO;
  music.rewind();
  //initialize paddles
  px = width/2;
  py = height;
  pd = 100;
  
  //initialize ball
  bx = width/2;
  by = 6*height/8 + 20;
  bd = 20;
  brickd = 40;
  brickLayout(35);
  
  //initialize keyboard variables
  akey = dkey = leftkey = rightkey = false;
  
  vx = 0;
  vy = 7;
  
  //initialize score
  score = 0;
  lives =  3;
  timer = 180;
}


void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(#42fa45);
    fill(#a2d2ff);
  } else {
    stroke(#03045e);
    fill(255, 255, 194);
  }
}
