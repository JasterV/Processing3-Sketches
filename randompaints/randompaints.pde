void setup(){
  fullScreen();

}

void draw(){
    noStroke();
 fill(random(255), random(255), 255);
 ellipse(mouseX, mouseY, 200, 200);
}
