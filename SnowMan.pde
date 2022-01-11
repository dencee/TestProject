public class SnowMan {
  int x;
  int y;
  color bodyColor;
  color inverted;
  float scale;

  int radiusBot = int(175 * scale);
  int radiusMid = int(140 * scale);
  int radiusTop = int(100 * scale);
  int offsetBot = this.y - radiusBot - 20;
  int offsetMid = offsetBot - (radiusBot);
  int offsetTop = offsetMid - (2*radiusTop);
  float fingerlength = 30;
  float snowballSize = 0;
  float snowballX;
  float snowballY;
  float snowballThrowX;
  float snowballThrowY;

  public SnowMan() {
    this.scale = height / 800.0;    // scale 1 for height = 800
    this.x = width/2;  // centered
    this.y = height;   // bottom of screen
    this.bodyColor = color(#FAEA5B);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }

  public SnowMan(int bodyColor) {
    this.scale = height / 800.0;
    this.x = width/2;  // centered
    this.y = height;   // bottom of screen
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }

  public SnowMan(int bodyColor, int x, int y) {
    this.scale = height / 800.0;
    this.x = x;
    this.y = y;
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }

  public SnowMan(float scale, int bodyColor) {
    this.scale = scale;
    this.x = width/2;  // centered
    this.y = height;   // bottom of screen
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }

  public SnowMan(float scale, int bodyColor, int x, int y) {
    this.scale = scale;
    this.x = x;
    this.y = y;
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }

  public void drawBody() {
    push();

    noStroke();
    radiusBot = int(175 * scale);
    radiusMid = int(140 * scale);
    radiusTop = int(100 * scale);
    offsetBot = this.y - radiusBot - 20;
    offsetMid = offsetBot - (radiusBot);
    offsetTop = offsetMid - (2*radiusTop);
    fill(this.bodyColor);
    ellipse(this.x, offsetBot, 2.15*radiusBot, 2*radiusBot);
    ellipse(this.x, offsetMid, 2.15*radiusMid, 2*radiusMid);
    ellipse(this.x, offsetTop, 2*radiusTop, 2*radiusTop);

    pop();
  }

  public void drawNose() {
    push();

    float noseHeight = 0.2 * radiusTop;
    float noseLength = 1.2 * radiusTop;

    noStroke();
    fill(#FFA500);
    triangle(x, offsetTop, x, offsetTop + noseHeight, x + noseLength, offsetTop);

    pop();
  }

  public void drawEyesMouth() {
    push();

    float radiusEyes = 0.25 * radiusTop; 

    // Inverted color
    fill(inverted);
    ellipse(x - (radiusTop/4), offsetTop - (radiusTop/4), radiusEyes, radiusEyes);
    ellipse(x + (radiusTop/4), offsetTop - (radiusTop/4), radiusEyes, radiusEyes);

    float radiusSmile = 1.25 * radiusTop;
    float smileWidth = 0.15 * radiusTop;

    noFill();
    stroke(inverted);
    strokeWeight(smileWidth);
    arc(x, offsetTop, radiusSmile, radiusSmile, PI/4, 3*PI/4, OPEN);

    pop();
  }

  public void drawHat() {
    push();

    float brimWidth = 2.5 * radiusTop;
    float brimHeight = 0.3 * radiusTop;
    float topWidth = 0.5 * brimWidth;
    float topHeight = radiusTop;

    fill(1);
    rect(x - brimWidth/2, offsetTop - radiusTop, brimWidth, brimHeight);
    rect(x - topWidth/2, offsetTop - radiusTop - topHeight, topWidth, topHeight);

    pop();
  }

  private void drawArms() {

    push();

    float armY = offsetMid - (0.3 * radiusMid);
    float leftArmX =  x - (0.9 * radiusMid);
    float rightArmX = x + (0.9 * radiusMid);
    float armLength = 1.2 * radiusMid;
    float armWidth =  0.1 * radiusMid;

    stroke(#4C322B);
    strokeWeight(armWidth);
    strokeCap(SQUARE);

    // Left arm angle and lengths
    float thetaL = atan( abs(mouseY - armY) / abs(mouseX - leftArmX) );
    float leftHandX = armLength * cos(thetaL);
    float leftHandY = armLength * sin(thetaL);

    // If mouseX is farther to the right, add to x position
    // If mouseY is farther below, add to the y position

    if (mouseX < leftArmX) {
      leftHandX = -leftHandX;
    }
    if (mouseY<armY) {
      leftHandY = -leftHandY;
    }
    leftHandX += leftArmX;
    leftHandY += armY;

    float thetaR = atan( abs(mouseY - armY) / abs(mouseX - rightArmX) );
    float rightHandX = armLength * cos(thetaR);
    float rightHandY = armLength * sin(thetaR);

    rightHandX = ( mouseX > rightArmX ) ? rightHandX : -rightHandX;
    rightHandY = ( mouseY > armY ) ? rightHandY : -rightHandY;
    rightHandX += rightArmX;
    rightHandY += armY;

    float rightfingerx = rightHandX;
    float rightfingery = rightHandY;
    float rmidfingery = rightHandY;
    float rmidfingerx = rightHandX ;

    float oofingerx = rightHandX;
    float oofingery = rightHandY;

    float leftfingerx =  leftHandX;
    float leftfingery =leftHandY;
    float lmidfingery = leftHandY;
    float lmidfingerx = leftHandX ;

    float ofingerx = leftHandX;
    float ofingery = leftHandY;
    float fingerankle = 40;

    if (mouseX < leftArmX) {
      lmidfingerx -= (fingerlength*cos(thetaL));
      leftfingerx -= (fingerlength*cos(thetaL + radians(fingerankle)));
      ofingerx -= (fingerlength*cos(thetaL + radians(-fingerankle)));
    } else {
      lmidfingerx +=  (fingerlength*cos(thetaL));
      leftfingerx += (fingerlength*cos(thetaL + radians(fingerankle)));
      ofingerx += (fingerlength*cos(thetaL + radians(-fingerankle)));
    }
    if (mouseY < armY) {
      leftfingery -= (fingerlength*sin(thetaL + radians(fingerankle)));
      lmidfingery -= (fingerlength*sin(thetaL));
      ofingery -= (fingerlength*sin(thetaL + radians(-fingerankle)));
    } else {
      leftfingery += (fingerlength*sin(thetaL + radians(fingerankle)));
      lmidfingery += (fingerlength*sin(thetaL));
      ofingery += (fingerlength*sin(thetaL + radians(-fingerankle)));
    }
    // leftHandX = ( mouseX > leftArmX ) ? leftHandX : -leftHandX;
    // leftHandY = ( mouseY > armY ) ? leftHandY : -leftHandY;

    // Same for right arm


    // Draw right fingers



    if (mouseX < rightArmX) {
      rmidfingerx -= (fingerlength*cos(thetaR));
      rightfingerx -= (fingerlength*cos(thetaR + radians(fingerankle)));
      oofingerx -= (fingerlength*cos(thetaR + radians(-fingerankle)));
    } else {
      rmidfingerx +=  (fingerlength*cos(thetaR));
      rightfingerx += (fingerlength*cos(thetaR + radians(fingerankle)));
      oofingerx += (fingerlength*cos(thetaR + radians(-fingerankle)));
    }
    if (mouseY < armY) {
      rightfingery -= (fingerlength*sin(thetaR + radians(fingerankle)));
      rmidfingery -= (fingerlength*sin(thetaR));
      oofingery -= (fingerlength*sin(thetaR + radians(-fingerankle)));
    } else {
      rightfingery += (fingerlength*sin(thetaR + radians(fingerankle)));
      rmidfingery += (fingerlength*sin(thetaR));
      oofingery += (fingerlength*sin(thetaR + radians(-fingerankle)));
    }




    // Draw arms
    line(leftArmX, armY, leftHandX, leftHandY); 
    line(rightArmX, armY, rightHandX, rightHandY);


    // Draw left hand fingers
    strokeWeight(5);

    line(leftHandX, leftHandY, leftfingerx, leftfingery);
    line(leftHandX, leftHandY, lmidfingerx, lmidfingery);
    line(leftHandX, leftHandY, ofingerx, ofingery);


    line(rightHandX, rightHandY, rightfingerx, rightfingery);
    line(rightHandX, rightHandY, rmidfingerx, rmidfingery);
    line(rightHandX, rightHandY, oofingerx, oofingery);


    //line();
    //line();

    if ( mousePressed ) {
      // Build an increasingly large snowball when pressing the mouse
      fill(#E0FFFB);
      stroke(#7CE3D4);
      /*for(int i = 1; i > 0; i++){
       snowballSize =+ 2; 
       }*/
      snowballSize++;
      fingerlength+=0.3;
      strokeWeight(3);
      stroke(0);
      snowballThrowX = mouseX;
      snowballThrowY = mouseY;
      snowballX =   leftHandX;
      snowballY =  leftHandY;
      circle(snowballX, snowballY, snowballSize);
    } else {      
      if ( snowballSize > 0 ) {
        // We have a snowball to throw!

        strokeWeight(3);
        stroke(0);
        fill(#E0FFFB);
        circle( snowballX, snowballY, snowballSize);

        if ( snowballX < 0 || snowballX > width || snowballY < 0 || snowballY > height ) {
          // Snowball is off the screen, reset

          snowballSize = 0;
        } else {
          // Snowball on the screen so move it

          float thetaS = atan( abs(snowballThrowY - armY) / abs(snowballThrowX - leftArmX) );
          float snowballIncX = ( snowballThrowX > leftArmX ) ? 10 * cos(thetaS) : -10 * cos(thetaS);
          float snowballIncY = ( snowballThrowY > armY ) ? 10 * sin(thetaS) : -10 * sin(thetaS);
          snowballX += snowballIncX;
          snowballY += snowballIncY;
          snowballSize--;
          fingerlength = 60;
        }
      }
    }

    pop();
  }

  public void drawButtons() {
    push();

    float buttonSize = 0.25 * radiusMid;

    stroke(inverted);
    strokeWeight(buttonSize);

    point(x, offsetMid);
    point(x, offsetMid - (0.5 * radiusMid));
    point(x, offsetMid + (0.5 * radiusMid));

    pop();
  }
}
