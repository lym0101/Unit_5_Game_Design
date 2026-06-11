void intro() {
  //music.play();
  background(#03045e);

  //animated gif
  imageMode(CENTER);
  //image(introGif, width/2, height/2 + 120, 300, 300);

  //pulsing title for some design flair
  float pulse = 70 + 8 * sin(frameCount * 0.08);
  fill(#ffca3a);
  textSize(pulse);
  text("BREAKOUT", width/2, 200);

  fill(255);
  textSize(30);
  text("Move the paddle with your mouse. Break every brick!", width/2, 320);
  text("Click anywhere to start", width/2, 380);
}

void introClicks() {
  mode = GAME;
}
