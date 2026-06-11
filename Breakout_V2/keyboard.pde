void keyPressed() {
  if (key == 'a' || key == 'A') {
    akey = true ;
  }
  if (key == 'd' || key == 'D') {
    dkey = true;
  }
  if (keyCode == LEFT) {
    leftkey = true;
  }
  if (keyCode == RIGHT) {
    rightkey = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    akey = false ;
  }
  if (key == 's' || key == 'S') {
    dkey = false;
  }
  if (keyCode == LEFT) {
    leftkey = false;
  }
  if (keyCode == RIGHT) {
    rightkey = false;
  }
}
