class Drop{
  private float x;
  private float y;
  private float z;
  private float yspeed;
  private float len;
  private float thick;
  private float gv;
  
  Drop(float x, float y){
    this.x = x;
    this.y = y;
    this.z = random(0, 20);
    this.yspeed = map(z, 0, 20, 4, 10);
    this.len = map(z, 0, 20, 10, 20);
    this.thick = map(z, 0, 20, 1, 2);
    this.gv = map(z, 0, 20, 0, 0.2);
  }
  
  float getY(){
    return y;
  }
  
  void respawn(float x, float y){
    this.x = x;
    this.y = y;
    yspeed = map(z, 0, 20, 4, 10);
  }
  
  void fall(){
     y += yspeed;
     yspeed += gv;
  }
  
  
  void show(){
    strokeWeight(thick);
    stroke(164, 40, 226);
    line(x, y, x, y + len);
  }


}
