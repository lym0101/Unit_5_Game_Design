void intro() {
  //music.play();
  
  drawIntro();
  
  strokeWeight(1);
  fill(0);
  textSize(72);
  text("PONG!",650,300);
  
  fill(10,0,216,190);
  stroke(255);
  textSize(36);
  rect(650,550,200,100,20);
  fill(255);
  text("1 PLAYER", 650, 550);
  
  fill(10,0,216,190);
  stroke(255);
  rect(650,700,200,100,20);
  fill(255);
  text("2 PLAYER", 650, 700);
  
  noFill();
  
  //tactile
  if(mouseX > 650 && mouseX < 850 && mouseY > 550 && mouseY < 650) {
    strokeWeight(200);
  } else {
    strokeWeight(0); 
  }
  if(mouseX > 650 && mouseX < 850 && mouseY > 650 && mouseY < 750) {
    strokeWeight(200);
  } else {
    strokeWeight(0); 
  }
}

void introClicks () {
  if (mouseX > 650 && mouseX < 850 && mouseY > 550 && mouseY < 650) {
    mode = GAME;
  }
  //if (mouseX > 650 && mouseX < 850 && mouseY > 700 && mouseY < 800) {
  //  mode = OPTIONS;
  //}
}

void drawIntro() {
  for (int y = 0; y < 800; y++) {
    float t = map(y, 0, 500, 0, 1);
    //                  the darkest color the gradient go -> the lightest the color go and then the amount (t)
    color c = lerpColor(color(128,0,128), color(255,182,193), t);
    stroke(c); //the color of the individual lines changing color to show the gradient
    line(0, y, width, y);
  }
}
