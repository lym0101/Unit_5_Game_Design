void gameover() {
  music.pause();
  gameover.play();
  background(255, 0, 0);
  textSize(70);
  fill(0, 255, 255);
  text("GAME OVER!", 400, 350);
  textSize(40);
  text("Score: " + score, 400, 450);
  text("High Score: " + highScore, 400, 510);
  noFill();
  
  text("<Click anywhere to continue>", 400, 650);
}

void gameoverClicks () {
  reset();
}

void reset() {
  mode = INTRO;
  music.rewind();
  //target initialization
  x= width/2;
  y= height/2;
  d= 100;
  
  vx = 5*cos(angle);
  vy = 5*sin(angle);
  
  score = 0;
  lives = 3; 
}
