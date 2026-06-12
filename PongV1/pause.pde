void pause() {
  music.pause();
  fill(255, 190);
  textSize(88);
  text("PAUSE!", width/2, width/2);
  textSize(32);
  text("<CLICK ANYWHERE TO RESUME>", width/2, width/2 +75);

  rectMode(CORNER);
  drawButton("HOME", 20, height-60, 100, 40);
  rectMode(CENTER);
}

void pauseClicks () {
  if (mouseX > 20 && mouseX < 120 && mouseY > height-60 && mouseY < height-20) {
    mode = INTRO;
  } else {
    mode = GAME;
  }
}
