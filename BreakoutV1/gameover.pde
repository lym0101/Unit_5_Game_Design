void gameover() {
  //music.pause();
  //gameoversound.play();

  if (won) {
    background(#1a7431);
    fill(#ffca3a);
    textSize(80);
    text("YOU WIN!", width/2, 300);
  } else {
    background(#6a040f);
    fill(0, 255, 255);
    textSize(80);
    text("GAME OVER!", width/2, 300);
  }

  fill(255);
  textSize(36);
  text("Final Score: " + score, width/2, 420);
  text("Click to return to the menu", width/2, 490);
}

void gameoverClicks() {
  //full reset: score, lives, paddle, ball, velocity, all bricks back
  reset();
  //gameoversound.pause();
  //gameoversound.rewind();
  //music.rewind();
  mode = INTRO;
}
