// Creem i inicialitzem les constants 
// que representen els colors
// vermell, verd i blau
final color red = color(255, 0, 0);
final color green = color(0, 255, 0);
final color blue = color(0, 0, 255);
// Creem les variables que representen les coordenades x, y
// del centre dels cercle
float circleX;
float circleY;
// Size representa el diametre dels cercles
int size;
// Frames conta quants frames s'han executat 
// desde l'inici del programa 
int frames;
// Creem les variables booleanes 
// que ens indicaran 
// l'estat de cada color
// (Ens ho podem imaginar com un semafor)
boolean redOn;
boolean greenOn;
boolean blueOn;
// Aquestes 2 variables ens ajudaran a controlar 
// si seguim realitzant totes les operacions o no
int contador;
boolean running;

void setup(){
  size(500, 500);
  // Pintem el fons blanc
  background(255);
  // Li treiem el color de farcit als cercles
  noFill();
  // Ajustem el grossor de les linies que es pinten a la pantalla a 5 pixels
  strokeWeight(5);
  // Ajustem el color amb el que es pintaran
  // tots els objectes per pantalla a vermell
  stroke(red);
  // Indiquem que el programa es troba en execucio
  running = true;
  // Inicialitzem l'estat en el que es troben els colors
  redOn = true;
  greenOn = false;
  blueOn = false;
  // Inicialitzem les coordenades x, y dels cercles, 
  // la mida, els frames i el contador
  circleX = width/2;
  circleY = height/2;
  size = 30;
  frames = 0;
  contador = 0;
}

// Aquesta funcio s'executa x vegades per segon depenent del frameRate del programa
// En aquest cas s'executa 60 vegades per segon 
// (Per defecte Processing funciona a 60 frames per segon)
void draw(){
  if(running){
    // Cada segon (Processing funciona a 60 frames per segon)
    // Pintem un cercle en les coordenades (circleX, circleY) 
    // en pantalla i augmentem la mida per al seguent cercle.
    if (frames % 60 == 0){
      circle(circleX, circleY, size);
      size += 30;
    }
    // Indiquem que ha passat 1 frame mes
    frames += 1;
    // Si el diametre dels cercles es major 
    // que la mida de la pantalla, canviem el color
    // i tornem a ficar el diametre a 30 pixels
    if(outOfBounds(size)){
        nextColor();
        size = 30;
    }
  }
}

void mousePressed(){
  // Canviem les coordenades del centre del cercle
  // al punt on hem clicat
  circleX = mouseX;
  circleY = mouseY;
}

void keyPressed(){
  if(key == 'a'){
    contador += 1;
    // Si es prem 4 cops la lletra 'a', 
    // parem la interactivitat
    if(contador >= 4){
      running = false;
    }
  }
}

void nextColor(){
  // Anem canviant els estats de cada color
  // depenent de quin es troba actiu en aquest moment
  if(redOn){
     stroke(green);
     greenOn = true;
     redOn = false;
   }else if(greenOn){
      stroke(blue);
      greenOn = false;
      blueOn = true;
   }else if(blueOn){
      stroke(red);
      redOn = true;
      blueOn = false;
   }
}

boolean outOfBounds(int size){
  // Aquesta funcio ens ajuda a comprovar si el diametre 
  // dels cercles es major o igual que la mida de la pantalla
  // Si el diametre dels cercles 
  // es major o igual a la amplada o altura de la pantalla,
  // retorna True, sino, retorna False
  return size >= width || size >= height;
}
