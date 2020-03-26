final color red = color(255, 0, 0);
final color blue = color(0, 0, 255);
int px = 0;
int py = 0;

void setup(){
   fullScreen();
   
   stroke(blue);
   line(0, py, width, py);
   py += 10;
   stroke(red);
   line(px, 0, px, height);
   px += 10;
}

void draw(){
  
}

void mouseMoved(){
    if (mouseX > pmouseX){
    stroke(red);
    line(px, 0, px, height);
    px += 10;
  }
  if(mouseY > pmouseY){
    stroke(blue);
    line(0, py, width, py);
    py += 10;
  }
}
