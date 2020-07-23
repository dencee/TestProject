//Make a variable to hold the X co-ordinate of the dot and set it to void setup() {
import ddf.minim.*;
boolean soundPlayed = false;
void playSound(String s) {
  if (!soundPlayed) {
    Minim minim = new Minim(this);
    AudioSample sound = minim.loadSample(s);
    sound.trigger();
    soundPlayed = true;
  }
}
boolean soundPlayed2 = false;
void playSound2(String s) {
  if (!soundPlayed2) {
    Minim minim = new Minim(this);
    AudioSample sound = minim.loadSample(s);
    sound.trigger();
    soundPlayed2 = true;
  }
}
boolean finished= false;
int[] ia = new int[4];
int a=20 ;
int z=20 ;
int y=20 ;
int x=20 ;

PImage raceCar1;
PImage raceCar2;
PImage raceCar3;
PImage raceCar4;
int carSize = 100;

void setup() {
  size(1600, 600);
  raceCar1 = loadImage("raceCar1.png");
  raceCar2 = loadImage("raceCar2.png");
  raceCar3 = loadImage("raceCar3.png");
  raceCar4 = loadImage("raceCar4.png");
  raceCar1.resize(carSize,carSize/2);
  raceCar2.resize(carSize,carSize);
  raceCar3.resize(carSize,carSize);
  raceCar4.resize(carSize,carSize);
}

void draw() {
  //make it a nice color
  noStroke();
  //if the mouse is pressed...
  background(#3A00FF);
  
  fill(0);
  int finishLineWidth = 50;
  rect(width-finishLineWidth, 0, finishLineWidth, height);
  for( int i = 0; i < height/10; i++ ){
    if( i%2 == 0 ){
      fill(#FFFFFF);
      rect( width-finishLineWidth + 5, i*10, 10, 10);
      rect( width-finishLineWidth + 15, i*10 + 10, 10, 10);
      rect( width-finishLineWidth + 25, i*10, 10, 10);
      rect( width-finishLineWidth + 35, i*10 + 10, 10, 10);
    }
  }
  
  fill(#90063B);
//  ellipse(x, 75, 100, 100);
  image(raceCar1, x - 50, 75 - 50);
  
  fill(#498604);
//  ellipse(a, 225, 100, 100);
  image(raceCar2, a - 50, 225 - 50);
  
  fill(#FF0303);
//  ellipse(y, 375, 100, 100);
  image(raceCar3, y - 50, 375 - 50);
  
  fill(#2100AA);
//  ellipse(z, 525, 100, 100);
  image(raceCar4, z - 50, 525 - 50);


  playSound("groove.mp3");

  if (mousePressed && finished==false) {
    a=a+(int)random(15);
    z=z+(int)random(15);
    x=x+(int)random(15);
    y=y+(int)random(15);
    //... change the X co-ordinate so that the dot moves to the right
    //Draw an ellipse of height and width 10Make sure to use your variable for the X position.


    //Make your dot move really fast so that it can win the race
  }
  if (x>width-finishLineWidth-carSize/2 + 10) {
    finished=true ;


    playSound2("jeopardy.wav");
  }
  if (y>width-finishLineWidth-carSize/2 + 10)
  {
    finished = true;


    playSound2("jeopardy.wav");
  }
  if (z>width-finishLineWidth-carSize/2 + 10)
  {
    finished=true;

    playSound2("jeopardy.wav");
  }
  if (a>width-finishLineWidth-carSize/2 + 10) {
    finished=true ;


    playSound2("jeopardy.wav");
  }

  if (finished) {
    ia[0]=x;
    ia[1]=y;
    ia[2]=z;
    ia[3]=a;
    ia=sort(ia);
    println(ia);

    if (ia[3]== x) {
      fill(#EAC118);
      ellipse(width - 500, 75, 20, 20);
    } else if (ia[3]== y) {
      fill(#EAC118);
      ellipse(width - 500, 225, 20, 20);
    } else if (ia[3]== z) {
      fill(#EAC118);
      ellipse(width - 500, 375, 20, 20);
    } else if (ia[3]== a ){
      fill(#EAC118);
      ellipse(width - 500, 525, 20, 20);
    }
    if (ia[2]== x) {
      fill(#D3D2CD);
      ellipse(width - 500, 75, 20, 20);
    } else if (ia[2]== y) {
      fill(#D3D2CD);
      ellipse(width - 500, 225, 20, 20);
    } else if (ia[2]== z ){
      fill(#D3D2CD);
      ellipse(width - 500, 375, 20, 20);
    } else if (ia[2]== a) {
      fill(#D3D2CD);
      ellipse(width - 500, 525, 20, 20);
    }
    if (ia[1]== x ){
      fill(#DB7B04);
      ellipse(width - 500, 75, 20, 20);
    } else if (ia[1]== y) {
      fill(#DB7B04);
      ellipse(width - 500, 225, 20, 20);
    } else if (ia[1]== z ){
      fill(#DB7B04);
      ellipse(width - 500, 375, 20, 20);
    } else if (ia[1]== a) {
      fill(#DB7B04);
      ellipse(width - 500, 525, 20, 20);
    }
  }
  
}


// lohkjbkjb
  //(you have to figure out what part of your code to change)
  //Use this method to play a ding when your dot crosses the finish line.