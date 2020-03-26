class Square{
  private float x;
  private float y;
  private float size;
  private color c;
  
  Square(float x, float y, float size, color c){
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  boolean collision(Square other){
    return sqrt(pow((x - other.x), 2) + pow(y - other.y, 2)) < size;
  }
 
  void moveTo(float x, float y){
    this.x = x;
    this.y = y;
  }
  float getY(){
    return y;
  }
  
  float getX(){
    return x;
  }
  
  void show(){
    fill(c);
    square(x, y, size);
  }
  


}
