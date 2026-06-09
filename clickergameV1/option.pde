void option() {
  music.pause();
  background(255);
  textSize(70);
  fill(0);
  text("OPTIONS",400,150);
  noFill();
  
  stroke(0);
  strokeWeight(3);

  rectMode(CORNER);
  
  tactile(140,300,100,100);
  rect(140,300,100,100);
  
  tactile(355,300,100,100);
  rect(355,300,100,100);
  
  tactile(566,300,100,100);
  rect(566,300,100,100);
  
  rectMode(CENTER);
  
  //the slider (horizonal)
  fill(255);
  text("Size of target", 100, height-150);
  controlSlider();
  if (mouseX > 40 && mouseX < 165 && mouseY > height-115 && mouseY < height-85) {
    stroke(255);
  } else {
    stroke(25, 100, 255);
  }
  fill(255);
  strokeWeight(5);
  line(40, (height-100), 165, (height-100));
  circle(sliderX, (height-100), 15);

  
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

void rectButton(String text, float x, float y, float w, float h) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    strokeWeight(5); 
    stroke(255, 0, 0); 
    fill(255); 
  } else {
    strokeWeight(2); 
    stroke(0); 
    fill(255); 
  }
  textSize(50); 
  rect(x, y, w, h); 
  fill(0); 
  text(text, x, y); 
  
}
void rectButton(PImage pic, float x, float y, float w, float h){
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
   strokeWeight(5); 
    stroke(255, 0, 0); 
  } else {
    strokeWeight(2); 
    stroke(0); 

  }
  fill(255); 
  textSize(60); 
  rect(x, y, w, h); 
  image(pic, x, y, w*0.75, h*0.75); 
}

void controlSlider() {
  if (mousePressed && mouseX > 40 && mouseX < 165 && mouseY > height-115 && mouseY < height-85) {
    sliderX = mouseX;
  } else {
    stroke(0);
  }
  d = map(sliderX, 40, 165, 50, 150);
  //d1 = map(sliderX, 40, 165, 50, 150);
  //d2 = map(sliderX, 40, 165, 50, 150);
}
