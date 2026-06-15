void reset() {
  mode = INTRO;
  music.rewind();
  //initialize paddles
  px = 0;
  py = height/2;
  pd = 200;
  
  //initialize ball
  bx = width/2;
  by = height/2;
  bd = 100;
  
  //initialize keyboard variables
  akey = dkey = leftkey = rightkey = false;
  
  vx = 8;
  vy = 7*sin(cos(angle));
  
  //initialize score
  score = 0;
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
