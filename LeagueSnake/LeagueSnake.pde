//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.

int x ;

int y ;
// Add a constructor with parameters to initialize each variable.

Segment(int x  , int y){
this.x = x;
this.y = y ;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

Segment head;
int fx ;
int fy ;
int sd = UP ;
int fe = 0 ;
ArrayList<Segment>body = new ArrayList<Segment>();
int direction = UP;
//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);
 head = new Segment(100,100) ;
frameRate(20);
dropFood();
}
   //knmnl
void dropFood() {
  //Set the food in a new random location
    fx = ((int)random(50)*10);
    fy = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(#000000);
  drawFood();
  drawSnake();
  drawTail();
  move();
}

void drawFood() {
  //Draw the food
  fill(#62FF55);
  rect(fx,fy,10,10);

  
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(#FA0313);
  rect(head.x,head.y,10,10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for(int i= 0;i<body.size();i++){
 fill(#FA0313);
 rect(body.get(i).x,body.get(i).y,10,10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  body.add(new Segment(head.x,head.y));
body.remove(body.size()-1);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  //if(){
  
  }
//}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode==38){
    direction = UP;
}
else if(keyCode==40){
    direction = DOWN;
}
else if(keyCode==37){
    direction = LEFT;
}
else if(keyCode==39){
    direction = RIGHT;
}
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  checkBoundaries();
    
  switch(direction) {
  case UP:
  head.y = head.y-10;
    // move head up here 
    break;
  case DOWN:
  head.y = head.y+10;
    // move head down here 
    break;
  case LEFT:
  head.x = head.x-10;
   // figure it out 
    break;
  case RIGHT:
  head.x = head.x+10;
    // mystery code goes here 
    break;
    
  }
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x <0-10){
 head.x= 500-10;
 }
  if(head.x >500+10){
 head.x= 0+10;}
  if(head.y <0-10){
 head.y= 500-10;
 }
  if(head.y >500+10){
 head.y= 0+10;}
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.x == fx && head.y == fy)
print("yes");
drawTail();
}
