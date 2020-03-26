class Player{
  private float x;
  private float y;
  private float speed;
  
  Player(float x, float y){
     this.x = x;
     this.y = y;
     this.speed = 10;
  }
  
   void moveRight(){
     this.x += speed;
   }
   
   void moveLeft(){
     this.x -= speed;
   }
   
   
   void moveUp(){
     this.y -= speed;
   }
   
   void moveDown(){
     this.y += speed;
   }
  
  void show(){
    background(170);
    color c = color(255, 45, 150);
    fill(c);
    ellipse(x, y, 100, 100);
  }
}
