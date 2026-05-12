void intro() {
  background(255);
  
  strokeWeight(1);
  fill(0);
  textSize(72);
  text("CLICKER GAME",400,300);
  
  textSize(36);
  text("START", 400, 550);
  rect(300,500,200,100);
  
  noFill();
  
  //tactile
  if(mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 550) {
    strokeWeight(200);
  } else {
    strokeWeight(0); 
  }
}

void introClicks () {
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
  }
}
