float pY;
float ellipseX;
float ellipseY;
float xSpeed = 5;
final int ellipseSize = 90;


void setup(){
  size(1000, 600);
   ellipseX = ellipseSize/2;
   ellipseY = quadraticF(ellipseX);
}


void draw(){
  background(150);
  
  line(width/2, 0, ellipseX, ellipseY);
  
  ellipse(ellipseX, ellipseY, ellipseSize, ellipseSize);
  
  if(ellipseX + ellipseSize/2 > width || ellipseX - ellipseSize/2 < 0)
      xSpeed *= -1;
      
  pY = ellipseY;
  ellipseY = quadraticF(ellipseX);
  if(xSpeed > 0){
      xSpeed -= 0.001;
      ellipseX += xSpeed;
  }
  
  if(xSpeed < 0){
    xSpeed += 0.001;
    ellipseX += xSpeed;
  }
}


float quadraticF(float x){
  x -= width/2;
  return 1.5*pow(x/25, 2) * -1 + height - ellipseSize/2;
}
