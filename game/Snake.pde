class Snake{
  static final private float squareSize = 20;
  final color headColor = color(255, 0, 0);
  final color tailColor = color(0, 0, 255);
  private Square head;
  private ArrayList<Square> tail;
  
  private float lastX;
  private float lastY;
  
  Snake(int x, int y){
   head = new Square(x, y, squareSize, headColor);
   tail = new ArrayList<Square>();
   lastX = x;
   lastY = y;
  }
  
 boolean collision(Square other){
    return head.collision(other);
  }
  
  void growTail(){
     tail.add(new Square(lastX, lastY, squareSize, tailColor));
  }
  
  void moveTail(){
    if(tail.size() > 1){
      for(int i = tail.size() - 1; i > 0; i--){
        Square curr = tail.get(i);
        Square last = tail.get(i-1);
        curr.moveTo(last.getX(), last.getY());
      }
    }
    if(tail.size() > 0){
      Square first = tail.get(0);
      first.moveTo(head.getX(), head.getY());
    }
  }
  
   void move(String direction){
     if(tail.isEmpty()){
        lastX = head.getX();
        lastY = head.getY();
     }else{
       Square last = tail.get(tail.size() - 1);
       lastX = last.getX();
       lastY = last.getY();
     }
     moveTail();
     if(direction.equals("RIGHT"))
        head.moveTo(head.getX()+squareSize, head.getY());
     else if(direction.equals("LEFT"))
        head.moveTo(head.getX()-squareSize, head.getY());
     else if(direction.equals("UP"))
         head.moveTo(head.getX() ,head.getY()-squareSize);
     else if(direction.equals("DOWN"))
         head.moveTo(head.getX(), head.getY()+squareSize);
   }
  
  void show(){
    background(200);
    for(Square sq : tail)
      sq.show();
    head.show();
  }
}
