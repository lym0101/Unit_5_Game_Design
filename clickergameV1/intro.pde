void intro() {
  music.play();
  
  drawSky();
  
  strokeWeight(1);
  fill(0);
  textSize(72);
  text("CLICKER GAME",400,300);
  
  fill(10,0,216,190);
  stroke(255);
  textSize(36);
  rect(400,550,200,100,20);
  fill(255);
  text("START", 400, 550);
  
  fill(10,0,216,190);
  stroke(255);
  rect(400,700,200,100,20);
  fill(255);
  text("OPTIONS", 400, 700);
  
  noFill();
  
  //tactile
  if(mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    strokeWeight(200);
  } else {
    strokeWeight(0); 
  }
  if(mouseX > 300 && mouseX < 500 && mouseY > 650 && mouseY < 750) {
    strokeWeight(200);
  } else {
    strokeWeight(0); 
  }
}

void introClicks () {
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
  }
  if (mouseX > 300 && mouseX < 500 && mouseY > 650 && mouseY < 750) {
    mode = OPTION;
  }
}

void drawSky() {
  strokeWeight(1);
  for (int y = 0; y < 800; y++) {
    float t = map(y, 0, 500, 0, 1);
    //                  the darkest color the gradient go -> the lightest the color go and then the amount (t)
    color c = lerpColor(color(49, 71, 118), color(135, 206, 235), t); //gradient sky color from a sunny sky color to a darker midnight blue color
    stroke(c); //the color of the individual lines changing color to show the gradient
    line(0, y, width, y);
  }
}
