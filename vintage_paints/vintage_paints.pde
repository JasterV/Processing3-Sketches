float t;

void setup(){
  size(500, 500);
  background(20);
  stroke(255);
  strokeWeight(5);
}


void draw(){
  translate(width/2, height/2);
  point(x(t), y(t));
  t++;
}

float x(float t){
  return cos(t /10) * 100;
}

float y(float t){
  return sin(t / 10) * 100;
}
