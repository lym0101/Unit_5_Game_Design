//Eric Li
//Processing 11
//Project 3 V1 Painting APP

PImage lemon;
PImage blackHole;
PImage logo;

boolean lemonOn;
boolean blackHoleOn;

//Color Pallette
color brightRed = #fe3e51;
color warmOrange = #90e0ef;
color darkerBlue = #0096c7;
color warmYellow = #fed53e;
color pink = #f943c8;
color purple = #8b44f8;
color black = #000000;
color darkCyan = #008B8B;
color neonGreen = #42fa45;

color white = #FFFFFF;
color grey = #D3D3D3;

// for background and outlines
color darkestBlue = #03045e;
color paleYellow = #ffe6ac;
color blueHue = #a2d2ff;
color selectedColor;

//prepping variables
float sliderX;
float radius;
float weight;

void setup() {
  pixelDensity(1);
  textAlign(CENTER);
  imageMode(CENTER);
  background(grey);
  size(1000,800);
  strokeWeight(3);
  stroke(black);
  fill(black);
  sliderX = 940;
  radius = 0;
  weight = 0.25;
  selectedColor = black;
  
  lemon = loadImage("Lemon Transparent.png");
  blackHole = loadImage("Black Hole Transparent.png");
  logo = loadImage("paintlogo1.png");
  
  lemonOn = false;
  blackHoleOn = false;
  
  background(white);
  
  surface.setIcon(logo);
  surface.setTitle("Drawer Pro Minimum");
}

void draw() {
//the side bar
  fill(paleYellow,180);
  stroke(black);
  strokeWeight(3);
  rect(850,0,150,800);
  
  //Section labels and dividers
  textAlign(CENTER, CENTER);
  textSize(13);
  fill(darkestBlue);
  noStroke();

  // Colours section
  text("Colours", 925, 12);
  stroke(darkestBlue); 
  strokeWeight(3);

  // Selected section
  stroke(darkestBlue); 
  strokeWeight(3);
  line(850, 278, 1000, 278);
  noStroke(); 
  fill(darkestBlue);
  text("Selected Color\nand\nStroke Weight", 925, 310);

  // Size section
  stroke(darkestBlue); 
  strokeWeight(3);
  line(850, 430, 1000, 430);
  noStroke(); 
  fill(darkestBlue);
  text("Size", 925, 442);

  // Stamps section
  stroke(darkestBlue); 
  strokeWeight(3);
  line(850, 530, 1000, 530);
  noStroke(); 
  fill(darkestBlue);
  text("Stamps", 925, 545);
  
  // White backgrounds for stamps
  stampOnOff();
  tactile2(860, 560, 60, 60);
  rect(860, 560, 60, 60); // left stamp slot
  stampOnOff1();
  tactile2(930, 560, 60, 60);
  rect(930, 560, 60, 60); // right stamp slot
  
  // Draw the images inside the toolbar
  image(lemon, 890, 585, 60, 60);
  image(blackHole, 960, 590, 60, 60);
  
  //the slider (horizonal)
  fill(black);
  stroke(black);
  strokeWeight(3);
  line(870, 490, 980, 490);
  tactile1(sliderX, 490, 25);
  circle(sliderX, 490, 25);
  radius = map(sliderX,870,980,1,40);
  strokeWeight(3);
  
  //buttons
  
  //black button
  tactile(890, 40, 30);
  fill(black);
  circle(890, 40, 30);
  
  //white button
  tactile(965, 40, 30);
  fill(white);
  circle(965, 40, 30);
  
  //bright red button
  tactile(890, 90, 30);
  fill(brightRed);
  circle(890, 90, 30);
  
  //warm orange button
  tactile(965, 90, 30);
  fill(warmOrange);
  circle(965, 90, 30);
  
  //warm yellow button
  tactile(965, 140, 30);
  fill(warmYellow);
  circle(965, 140, 30);
  
  //pink button
  tactile(890, 140, 30);
  fill(pink);
  circle(890, 140, 30);
  
  //darker blue button
  tactile(965, 190, 30);
  fill(darkerBlue);
  circle(965, 190, 30);
  
  //dark cyan button
  tactile(890, 190, 30);
  fill(darkCyan);
  circle(890, 190, 30);
  
  //purple button
  tactile(965, 240, 30);
  fill(purple);
  circle(965, 240, 30);
  
   //neon green button
  tactile(890, 240, 30);
  fill(neonGreen);
  circle(890, 240, 30);
  
  //indicator
  stroke(darkestBlue);
  strokeWeight(3);
  fill(selectedColor);
  circle(925,375,50);
  noStroke();
  if (selectedColor == black) {
    fill(white);
  } else {
    fill(black);
  }
  circle(925, 375, radius);
  
  //file save/load/new button
  tactile2(890, 650, 70, 40);
  rect(890, 650, 70, 40);
  textSize(24);
  fill(0);
  text("New", 925, 670);
  
  tactile2(890, 700, 70, 40);
  rect(890, 700, 70, 40);
  textSize(24);
  fill(0);
  text("Save", 925, 720);
  
  tactile2(890, 750, 70, 40);
  rect(890, 750, 70, 40);
  textSize(24);
  fill(0);
  text("Load", 925, 770);
}
  
void tactile(float x, int y, int r) {
  if (dist(x,y,mouseX,mouseY) < r) {
    stroke(blueHue);
    strokeWeight(3);
  } else {
    stroke(darkestBlue);
    strokeWeight(3);
  }
}

void tactile1(float x, int y, int r) {
  if (dist(x,y,mouseX,mouseY) < r) {
    stroke(blueHue);
    strokeWeight(3);
  } else {
    stroke(darkestBlue);
    strokeWeight(3);
  }
}

void tactile2(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(neonGreen);
    fill(blueHue);
  } else {
    stroke(darkestBlue);
    fill(255);
  }
}
  
void mouseReleased() {
  //light cyan button
  if (dist(890, 40,mouseX,mouseY) < 30) {
    selectedColor = black;
  }
  //medium sky blue button
  if(dist(965, 40,mouseX,mouseY) < 30) {
    selectedColor = white;
  }
  //darker blue button
  if(dist(890, 90,mouseX,mouseY) < 30) {
    selectedColor = brightRed;
  }
  //darker blue button
  if(dist(965, 90,mouseX,mouseY) < 30) {
    selectedColor = warmOrange;
  }
  //darker blue button
  if(dist(890, 140,mouseX,mouseY) < 30) {
    selectedColor = pink;
  }
  //darker blue button
  if(dist(965, 140,mouseX,mouseY) < 30) {
    selectedColor = warmYellow;
  }
  //darker blue button
  if(dist(890, 190,mouseX,mouseY) < 30) {
    selectedColor = darkCyan;
  }
  //darker blue button
  if(dist(965, 190,mouseX,mouseY) < 30) {
    selectedColor = darkerBlue;
  }
  //darker blue button
  if(dist(890, 240,mouseX,mouseY) < 30) {
    selectedColor = neonGreen;
  }
  //darker blue button
  if(dist(965, 240,mouseX,mouseY) < 30) {
    selectedColor = purple;
  }
  controlSlider();
  
  //stamps
  if (mouseX > 860 && mouseX < 920 && mouseY > 560 && mouseY < 620) {
    lemonOn = !lemonOn;
  }
  if (mouseX > 930 && mouseX < 990 && mouseY > 560 && mouseY < 620) {
    blackHoleOn = !blackHoleOn;
  }
  
  //new,save,load buttons
  
  //new button
  if (mouseX > 890 && mouseX < 960 && mouseY > 650 && mouseY < 690) {
    fill(white);
    noStroke();
    rect(0,0,849,800);
  }
  
  //save button
  if (mouseX > 890 && mouseX < 960 && mouseY > 700 && mouseY < 740) {
    selectOutput("Choose a name for your new image file", "saveImage");
  }
  
  //load button
  if (mouseX > 890 && mouseX < 960 && mouseY > 750 && mouseY < 790) {
    selectInput("Pick an image to load", "openImage"); 
  }
}

void mouseDragged() {
  if (lemonOn == true && mouseX < 850) {
    image(lemon, mouseX, mouseY,3*radius,3*radius);
  } else if (blackHoleOn == true && mouseX < 850) {
    image(blackHole, mouseX, mouseY, 3*radius, 3*radius);
  } else {
    controlSlider();
    stroke(selectedColor);
    strokeWeight(radius);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void controlSlider() {
  strokeWeight(3);
   if(mouseX > 870 && mouseX < 980 && mouseY > 480 && mouseY < 500){
    sliderX = mouseX;
    weight = map(sliderX,870,980,0.25,8);
   }
}

void stampOnOff() {
  if (lemonOn == true) {
    strokeWeight(5);
    stroke(neonGreen);
    fill(blueHue);
  } else {
    strokeWeight(3);
    stroke(darkestBlue);
    fill(255);
    }
}

void stampOnOff1() {
  if (blackHoleOn == true) {
    strokeWeight(5);
    stroke(neonGreen);
    fill(blueHue);
  } else {
    strokeWeight(3);
    stroke(darkestBlue);
    fill(255);
  }
}

void saveImage(File f) {
  if(f !=null) {
    PImage canvas = get(71,1,width-71,height-1);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if (f !=null) {
    //Kludge
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic,0,0);
      n = n + 1;
    }
  }
}
