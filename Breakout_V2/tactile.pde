void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(#42fa45);
    fill(#a2d2ff);
  } else {
    stroke(#03045e);
    fill(255, 255, 194);
  }
}
