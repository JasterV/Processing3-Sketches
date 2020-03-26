
// Creem les constants per els colors
final color red = color(255, 0, 0);
final color green = color(0, 255, 0);
final color blue = color(0, 0, 255);
// Aquesta variable representa el color actual 
// dels cercles que es troben a dins del cercle gran 
color currentColor;
// Creem la constant per a la mida del cercle gran
final int mainCircleSize = 300;
// Aquesta variable representa la mida dels cercles petits;
float circleSize;
// Declarem les constants per a la mida maxima i minima que pot tenir un cercle
final float maxCircleSize = 50; 
final float minCircleSize = 16;
// Creem les variables que representen les coordenades del cercle gran
float mainCircleX;
float mainCircleY;
// Frames indica els frames que s'han executat desde l'inici del programa
float frames;
// Aquest boolea ens servira per comprovar 
// l'estat de la interactivitat amb el ratoli
boolean mouseOn;
// Creem els 2 arrays on guardarem les coordenades de cada cercle
final int initialSize = 10;
float[] xCords;
float[] yCords;
// Aquesta variable representa el nombre 
// de cercles que hi ha registrats a les taules
int numCircles;
//Aquestes variables booleanes ens ajudaran a saber si 
// hem de reduir o augmentar la mida dels cercles passats 60 segons
boolean growSize;
boolean reduceSize;

void setup(){
  size(500, 500);
  background(0, 0, 255);
  
  mainCircleX = width/2;
  mainCircleY = height/2;
  circle(mainCircleX, mainCircleY, mainCircleSize);
  
  xCords = new float[initialSize];
  yCords = new float[initialSize];
  numCircles = 0;
  
  circleSize = minCircleSize;
  frames = 0;
  // Inicialitzem growSize = true perque el primer 
  // que farem sera augmentar la mida dels cercles
  growSize = true;
  reduceSize = false;
  // Indiquem la interactivitat amb el ratoli com a activa
  mouseOn = true;
  // El color actual dels cercles 
  // que es troben dins del cercle gran es el verd
  currentColor = green;
}

void clearScreen(){
  // Aquesta funcio esborra tots els cercles pintats en pantalla
   background(0, 0, 255);
   fill(255);
   circle(mainCircleX, mainCircleY, mainCircleSize);
}

void draw(){
  float seconds = frames/60;
  // Si la interactivitat amb el ratoli segueix activa
  // Comprova si han passat mes de 60 segons
  if(mouseOn){
    if(seconds >= 60){
      // Si han passat 60 segons, neteja la pantalla 
      // i mostra nomes els cercles registrats a les taules
      clearScreen();
      showCircles();
      mouseOn = false;
    }
  } else {
    // Si la interactivitat amb el ratoli esta desactivada
    // Comprova si han passat 10 segons i modifica els cercles
    if(seconds % 10 == 0){
      modifyCircles();
      println(circleSize);
    }
  }
  // Actualitzem els frames executats
  frames += 1;
}


void showCircles(){
  // Aquesta funcio ens ajuda a printar 
  // tots els cercles registrats a les taules
  // del color especificat com a color actual
  fill(currentColor);
  for(int i = 0; i < numCircles; i++){
    float x = xCords[i];
    float y = yCords[i];
    circle(x, y, circleSize);
  }
}

/* 
  ------------------------------------
   LES SEGUENTS FUNCIONS S'EXECUTARAN NOMES 
   ELS 60 PRIMERS SEGONS DEL PROGRAMA
  -------------------------------------
*/
void mousePressed(){
  // Si la interactivitat amb el ratoli segueix activa, 
  // executem la operacio
  if(mouseOn){
    // Calculem una x i una y de manera random dins de la pantalla
    float x = random(circleSize/2, width - circleSize/2);
    float y = random(circleSize/2, height - circleSize/2);
    // Calculem el diametre del cercle gran
    float radius = mainCircleSize/2;
    // Si la distancia entre els punts (x, y) i (mainCircleX, mainCircleY)
    // es menor al radi del cercle gran (Es a dir, el punt (x, y) es troba dins del cercle)
    // canviem el color en que es pintara el seguent cercle a verd
    if(minDistance(x, y, mainCircleX, mainCircleY, radius)){
      addCircle(x, y);
      fill(green);
    }else{
      // si no, ajustem el color a vermell
      fill(red);
    }
    // Despres d'haver fet totes les comprovacions finalment pintem el cercle
    circle(x, y, circleSize);
  }
}

void addCircle(float x, float y){
  // Afegim les coordenades d'un cercle a les taules
  // Si el nombre de cercles excedeix la mida de les taules
  // reajustem les taules amb la funcio expand()
  if(numCircles >= xCords.length){
        xCords = expand(xCords);
        yCords = expand(yCords);
   }
   xCords[numCircles] = x;
   yCords[numCircles] = y;
   numCircles += 1;
}

boolean minDistance(float x1,float y1,float x2,float y2,float value){
  // Calculem la distancia entre (x1, y1) i (x2, y2)
  float distance = dist(x1, y1, x2, y2);  
  // Si la distancia es menor o igual a 'value', retorna True, sino, retorna False
  return distance <= value;
}

/* 
  ------------------------------------
   AQUESTES FUNCIONS S'EXECUTEN PASSATS 60 SEGONS
   DE L'EXECUCIO DEL PROGRAMA
  -------------------------------------
*/
void modifyCircles(){
  // Si l'estat growSize es troba com a true
  // intentem fer mes grans els cercles
  // si no es pot, growSize = false, i reduceSize = true
   if(growSize){
     if (circleSize < maxCircleSize){
         growCircles();
     }else{
       growSize = false;
       reduceSize = true;
       reduceCircles();
     }
   }else if(reduceSize){
     // Si l'estat reduceSize es troba com a true
     // intentem reduir la mida dels cercles
     // si no es pot, canviem els estats
     if(circleSize > minCircleSize){
       reduceCircles();
     }else{
       reduceSize = false;
       growSize = true;
       growCircles();
     }
   }
}

void growCircles(){
  // Augmentem la mida dels cercles, netejem la pantalla i els pintem
  circleSize += 5;
  // Comprovem que no ens passem de 50
  if (circleSize > 50) {
    circleSize = 50;
  }
  clearScreen();
  showCircles();
}

void reduceCircles(){
  // Disminuim la mida dels cercles, netejem la pantalla i els pintem
  circleSize -= 5;
  // Comprovem que no reduim el cercle per sota de 16 pixels
  if(circleSize < 16){
    circleSize = 16;
  }
  clearScreen();
  showCircles();
}

void keyPressed(){
  // Si la interactivitat amb el ratoli esta desactivada, 
  // executem les ordres del teclat
  if(!mouseOn){
    // Canviem el currentColor el funcio de la tecla que es premi, 
    // netejem la pantalla i pintem els cercles ara amb el color canviat
    if(key == 'a' || key == 'A'){
      currentColor = blue;
    }else if(key == 'v' || key == 'V'){
      currentColor = green; 
    }else if(key == 'r' || key == 'R'){
      currentColor = red;
    }
    clearScreen();
    showCircles();
  }
}
