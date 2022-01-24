import processing.video.*;

PImage theimage;
int imageNum= 0;
int numOfPixels= 1;
Movie mov;
void setup() {
  size(1000, 700); 
  ourLoadImage(imageNum);
   mov = new Movie(this, "Marilyn Monroe.mov");
     mov.loop();
  noStroke();
}

void draw() {
  int cellSize = width/numOfPixels;

  loadPixels();
  if (imageNum==2){ // do the movie
   theimage.copy (mov,0,0,width, height,0,0,width, height);
  }
  theimage.loadPixels();
  for (int x = 0; x < width; x+= cellSize) {
    for (int y = 0; y < height; y+=cellSize) {
      color imageColor = theimage.pixels[x+ y*width] ;
     if( keyCode == UP)imageColor= color((red(imageColor)+green(imageColor)+blue(imageColor))/3,(red(imageColor)+green(imageColor)+blue(imageColor))/3,(red(imageColor)+green(imageColor)+blue(imageColor))/3);
      fill (imageColor);
      rect (x, y, cellSize, cellSize);
    }
  }

  fill (255);
  rect(80, 80, 150, 40);
  fill (0);
  text("Num of Pixels ="+numOfPixels, 100, 100);
 //image(mov, 0, 0, width, height);
}

void mousePressed() {
  numOfPixels++;
}

void keyPressed() {  
  imageNum++;
  imageNum%=3;
  ourLoadImage(imageNum);
  numOfPixels=1;
}

void ourLoadImage(int num) {
  switch(imageNum) {
  case 0:
    theimage=loadImage("http://i2.cdn.turner.com/cnnnext/dam/assets/150213095929-27-obama-0213-super-169.jpg");
    break;
  case 1:
    theimage=loadImage("https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/dan-osullivan1.jpg.preset.square.jpeg");
    break;

  }
  theimage.resize(width, height);
}

void movieEvent(Movie m) {
  m.read();
}
