Snake snake;
Square apple;

void setup(){
  size(800, 600);
  snake = new Snake(width/2, height/2);
  apple = new Square(random(10, width - 10), random(10, height - 10), 20, color(0, 255, 0));
}


void draw(){
  snake.show();
  apple.show();
  if(snake.collision(apple)){
    snake.growTail();
    apple.moveTo(random(10, width - 10), random(10, height - 10));
  }
}

 void keyPressed(){
    if(keyCode == RIGHT){
       snake.move("RIGHT");
    }
    
    if(keyCode == LEFT){
       snake.move("LEFT");
    }
    
    if(keyCode == UP){
       snake.move("UP");
    }
    
    if(keyCode == DOWN){
       snake.move("DOWN");
    }
  }
