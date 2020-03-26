
static final int N = 500;
Drop drops[];

void setup(){
  size(800, 600);
  drops = new Drop[N];
  for(int i = 0; i < N; i++){
    float randX = random(0, width);
    float randY = random(-700, -50);
    drops[i] = new Drop(randX, randY);
  }
}

void draw(){
    background(230, 230, 250);
    for(Drop drop : drops){
      if(drop.getY() > height)
         drop.respawn(random(0, width), random(-500, -50));
      drop.fall();
      drop.show();
    }
}
