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
  
  //the slider (horizonal)
  fill(0);
  stroke(0);
  strokeWeight(3);
  line(870, 490, 980, 490);
  tactile1(sliderX, 490, 25);
  circle(sliderX, 490, 25);
  radius = map(sliderX,870,980,1,40);
  strokeWeight(3);
  
  image(lemon, 200, 585, 60, 60);
  image(avatar, 100,100,100,100);
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

void optionClicks () {
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = INTRO;
  }
  music.rewind();
}

void tactile1(float x, int y, int r) {
  if (dist(x,y,mouseX,mouseY) < r) {
    stroke(#a2d2ff);
    strokeWeight(3);
  } else {
    stroke(#03045e);
    strokeWeight(3);
  }
}
