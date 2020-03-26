 
/* DEFINIMOS LAS VARIABLES QUE VAMOS A UTILIZAR A LO LARGO DEL PROGRAMA */
final int maxTableComponents = 20;
final int triangleSize = 20;
final int maxSeconds = 20;

int numComponents;
int startingSecond;
boolean running;
Table xCoordinates;
Table yCoordinates;


/* INICIALIZAMOS LAS TABLAS CON SUS CORRESPONDIENTES COLUMNAS */
void setup(){
 size(800, 600);
 
 xCoordinates = new Table();
 yCoordinates = new Table();
 xCoordinates.addColumn("x1");
 xCoordinates.addColumn("x2");
 xCoordinates.addColumn("x3");
 yCoordinates.addColumn("y1");
 yCoordinates.addColumn("y2");
 yCoordinates.addColumn("y3");
 
 running = true;
 startingSecond = second();
 numComponents = 0;
}

/* CONTAMOS LOS SEGUNDOS QUE HAN PASADO DESDE EL COMIENZO DE LA EJECUCION DEL PROGRAMA */
void draw(){
  int currentSecond = second();
  if (currentSecond - startingSecond >= maxSeconds){
    running = false;
  }
}

/* ESTA FUNCION SE EJECUTA CADA VEZ QUE SE DA UN CLICK AL RATON */
void mouseClicked(){
  if(running){
    if(numComponents >= maxTableComponents){
      redrawTriangles();
      xCoordinates.clearRows();
      yCoordinates.clearRows();
      numComponents = 0;
    }
    float x1 = mouseX, x2 = mouseX, x3 = mouseX + triangleSize;
    float y1 = mouseY, y2 = mouseY + triangleSize, y3 = mouseY + triangleSize;
    color randColor = color(random(255), random(255), random(255));
    fill(randColor);
    triangle(x1, y1, x2, y2, x3, y3);
    addTriangleToTables(x1, y1, x2, y2, x3, y3);
    numComponents += 1;
  }
}

/* FUNCIONES AUXILIARES QUE NOS AYUDAN A TENER EL CODIGO MAS ORDENADO */
void redrawTriangles(){
  color red = color(255, 0, 0);
  fill(red);
  for(int i = 0; i < numComponents;i++){
     TableRow xcord = xCoordinates.getRow(i);
     TableRow ycord = yCoordinates.getRow(i);
     float x1 = xcord.getFloat("x1"), x2 = xcord.getFloat("x2"), x3 = xcord.getFloat("x3");
     float y1 = ycord.getFloat("y1"), y2 = ycord.getFloat("y2"), y3 = ycord.getFloat("y3");
     triangle(x1, y1, x2, y2, x3, y3);
  }
}

void addTriangleToTables(float x1, float y1, float x2, float y2, float x3, float y3){
  xCoordinates.addRow();
  yCoordinates.addRow();
  xCoordinates.setFloat(numComponents, "x1", x1);
  xCoordinates.setFloat(numComponents, "x2", x2);
  xCoordinates.setFloat(numComponents, "x3", x3);
  yCoordinates.setFloat(numComponents, "y1", y1);
  yCoordinates.setFloat(numComponents, "y2", y2);
  yCoordinates.setFloat(numComponents, "y3", y3);
}
