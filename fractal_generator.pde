int topLeft = 0;
int topRight = 0;
int bottomLeft = 0;
int bottomRight =0;

boolean tl = true;
boolean tr = true;
boolean bl = true;
boolean br = true;

void setup(){
  //fullScreen();
  size(800,890);
  pixelDensity(displayDensity());
  strokeWeight(1);
  noFill();
  background(0);
  //strokeWeight(2);
}

void drawShape(float size){
  pushMatrix();
  //line(0,0,size,0);
  //line(size,0,size,-size);
  //rect(0,0,size,size);
  //ellipse(0,0,size,size);
  point(0,0);
  popMatrix();
}

void recursiveDraw(float size){
  drawShape(size);
  if(size/2 > 1){
    size/= 2;
    
    if(tl){
      pushMatrix();
      translate(size,size);
      rotate(radians(90*topLeft));
      stroke(255,0,0);
      recursiveDraw(size);
      popMatrix();
    }
    
    if(tr){
      pushMatrix();
      translate(0,size);
      rotate(radians(90*topRight));
      stroke(0,255,0);
      recursiveDraw(size);
      popMatrix();
    }
    
    if(bl){
      pushMatrix();
      translate(0,0);
      rotate(radians(90*bottomLeft));
      stroke(0,0,255);
      recursiveDraw(size);
      popMatrix();
    }
    
    if(br){
      pushMatrix();
      translate(size,0);
      rotate(radians(90*bottomRight));
      stroke(255,255,0);
      recursiveDraw(size);
      popMatrix();
    }
  }
}
int value = 0;

void draw(){
  for(int i = 0; i < 4; i++){
  
  }
  background(0);
  stroke(255);
  text((
  " Top Left: " + topLeft + " " + tl + 
  "\n Top Right: " + topRight + " " + tr + 
  "\n Bottom Left: " + bottomLeft + " " + bl + 
  "\n Bottom Right: " + bottomRight + " " + br 
  ), 5, 20);
 translate(410,300);
 
 scale(-1,1);
 recursiveDraw(400);
 
 
}

void keyPressed() {
  
  if(key == '1') topLeft--;
   if(key == '2') topLeft++;
   
   if(key == 'q' || key == 'Q' ) topRight--;
   if(key == 'w' || key == 'W' ) topRight++;
   
   if(key == 'a' || key == 'A') bottomLeft--;
   if(key == 's' || key == 'S') bottomLeft++;
   
   if(key == 'z' || key == 'Z') bottomRight--;
   if(key == 'x' || key == 'X') bottomRight++;
   
   
   
   if(key == '3') tl = !tl;
   if(key == '4') tr = !tr;
   if(key == '5') bl = !bl;
   if(key == '6') br = !br;
   
  topRight = abs(topRight);
  topLeft = abs(topLeft);
  bottomLeft = abs(bottomLeft);
  bottomRight = abs(bottomRight);
  
  topLeft %= 4;
  topRight %= 4;
  bottomLeft %= 4;
  bottomRight %= 4;
  
  
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}