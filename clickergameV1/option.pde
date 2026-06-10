void option() {
  music.pause();
  
  drawOption();
  
  textAlign(CENTER, CENTER);
  textSize(70);
  fill(0);
  text("OPTIONS", 400, 150);
  rectMode(CORNER);
  strokeWeight(3);
  // ---- target choice boxes ----
  tactile(140, 300, 100, 100);
  rect(140, 300, 100, 100);
  tactile(355, 300, 100, 100);
  rect(355, 300, 100, 100);
  tactile(566, 300, 100, 100);
  rect(566, 300, 100, 100);
  imageMode(CORNER);
  image(lemon, 140, 300, 100, 100);
  image(avatar, 355, 300, 100, 100);
  // green outline around the currently selected target
  noFill();
  stroke(0, 200, 0);
  strokeWeight(6);
  if (targetType == 1) {
    rect(135, 295, 110, 110);
  } else if (targetType == 2) {
    rect(350, 295, 110, 110);
  } else {
    rect(561, 295, 110, 110);
  }
  //size slider
  fill(0);
  textSize(25);
  text("Size of target", 100, height-150);
  controlSlider();
  if (mouseX > 40 && mouseX < 165 && mouseY > height-115 && mouseY < height-85) {
    stroke(255, 0, 0);
  } else {
    stroke(25, 100, 255);
  }
  strokeWeight(5);
  line(40, height-100, 165, height-100);
  fill(255);
  circle(sliderX, height-100, 15);
  // live preview at current size
  if (targetType == 3) {
    fill(255);
    stroke(0);
    strokeWeight(5);
    circle(width/2, height-220, d);
  } else {
    imageMode(CENTER);
    image(target, width/2, height-220, d, d);
  }
  //back button
  rectMode(CENTER);
  rectButton("BACK", 650, 700, 200, 80);
}

void optionClicks() {
  if (clicked(140, 300, 100, 100)) {
    targetType = 1;
    target = lemon;
  }
  if (clicked(355, 300, 100, 100)) {
    targetType = 2;
    target = avatar;
  }
  if (clicked(566, 300, 100, 100)) {
    targetType = 3;
    targetCircle();
  }
  // BACK button clicks
  if (clicked(550, 660, 200, 80)) {
    mode = INTRO;
    music.rewind();
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    strokeWeight(4);
    stroke(#42fa45);
    fill(#a2d2ff);
  } else {
    strokeWeight(2);
    stroke(#03045e);
    fill(255, 255, 194);
  }
}

void tactile1(float x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
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
void rectButton(PImage pic, float x, float y, float w, float h) {
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

boolean clicked(float bx, float by, float bw, float bh) {
  //button logic
  return mouseX > bx && mouseX < bx + bw && mouseY > by && mouseY < by + bh;
}

void controlSlider() {
  if (mousePressed && mouseX > 40 && mouseX < 165 && mouseY > height-115 && mouseY < height-85) {
    sliderX = mouseX;
  }
  d = map(sliderX, 40, 165, 50, 300);
}
void targetCircle() {
  fill(255);
  stroke(0);
  strokeWeight(5);
  circle(x, y, d);
}

void drawOption() {
  strokeWeight(1);
  for (int y = 0; y < 800; y++) {
    float t = map(y, 0, 500, 0, 1);
    //                  the darkest color the gradient go -> the lightest the color go and then the amount (t)
    color c = lerpColor(color(#06B6D4), color(#3B82F6), t); //gradient sky color from a sunny sky color to a darker midnight blue color
    stroke(c); //the color of the individual lines changing color to show the gradient
    line(0, y, width, y);
  }
}
