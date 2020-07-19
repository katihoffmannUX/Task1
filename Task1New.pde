//Aufgabe 1: Entwicklung eines Algorithmus mit einer Animation durch sin()

/* Lasse eine zufällige Anzahl von weißen Kugeln fallen.
 Die Kugeln fallen unterschiedlich schnell und sind unterschiedlich groß.
 Beim Aufprall an der unteren Kante teilt sich die Kugel in 2 Hälften.
 Helixförmig steigen die Kugeln nach oben und leuchten in bläulicher Farbe auf.
 Desto höher die Kugel schwebt, desto mehr löst sie sich auf.
 Wenn 2 Kugeln oben verschwinden, taucht oben wieder eine neue Kugel auf.*/
/*1. Variante: Der Hintergrund wird immer neu gezeichnet, sodass man die Kugeln beobachten kann*/
/*2. Variante: Der Hintergrund wird nicht erneuert, sodass ein Muster entsteht.*/

//Farbe des Hintergrundes
color backgroundColor = color(0);
//Zufällige Anzahl der Kugeln
int numbers = (int)random(10, 100);
//Arrays die die Position und die Fallgeschwindigkeit speichern
float[] y = new float[numbers];
float[] x = new float[numbers];
float[] speed = new float[numbers]; 
//Array was die Größe der Kugel festlegt
float[] radius = new float[numbers];
//Array was die Breite der "Helix" festlegt
float[] helixW = new float[numbers];
//Array, um zu überprüfen in welche Richtung eine Kugel fallen bzw. schweben soll
boolean[] changeDirection = new boolean[numbers];

void setup() {
  //Anfangswerte festlegen
  startVariable();
  size(1000, 1000);
  background(backgroundColor);
}

void draw() {
  //Background "übermalt" den alten Stand, sodass moveBall() neue Bälle zeichnen kann
  //background(backgroundColor); /*Falls Funktion auskommentiert wird, dann bekommt man die 2. Variante*/
  //Lässt die Kugel erscheinen, als würden sie sich bewegen
  moveBall();
}


void moveBall() {
  //For-Schleife geht immer alle Kugeln durch. Die Anzahl wurde vorher durch Zufall festgelegt.
  for (int  i=0; i<numbers; i++ ) {
    //If-Bedingung überprüft ob die Kugel schon unten oder oben angelangt ist, sodass sie ggf. die Richtung ändern muss
    if (y[i]>=height-radius[i]/2) {
      changeDirection[i] = true;
    } else if (y[i]<radius[i]/2) {
      changeDirection[i] = false;
      //Neue Werte werden festgelegt, falls die Kugel oben angekommen ist
      radius[i]=random(10, 25);
      y[i] = radius[i]/2;
      helixW[i]=random(30, 50);
      x[i] = random(radius[i]/2, (width-(radius[i]/2)));
      speed[i] = random(2, 10);
    }

    if (changeDirection[i] == false) {
      //Kugel bewegt sich nach unten
      //Durch y[i]/200 bewegt sich die Kugel zum Schluss immer schneller
      y[i] = y[i] + speed[i] + y[i]/200;
      //Kugel wird gezeichnet
      Ball b = new Ball(x[i], y[i], radius[i], false, 300);
      b.show();
    } else {
      //Kugel schwebt Helixförmig nach oben
      y[i] = y[i] - speed[i];
      //Durch die sin() Funktion wird die Kugel nach links und rechts animiert
      float sinWave = sin(radians(1000 + frameCount*5));
      //map() vergrößert den Wert, sodass festgelegt wird wie breit die Helix wird
      sinWave = map(sinWave, -1, 1, -helixW[i], helixW[i]);
      //opacity lässt die Kugel immer transparenter werden
      float opacity = map(y[i], 0, height, 0, 300);
      //die zwei Kugeln werden erstellt
      Ball b = new Ball(x[i]-sinWave, y[i]-2, radius[i]/1.5, true, opacity);
      b.show();
      Ball c = new Ball(x[i]+sinWave, y[i]-2, radius[i]/1.5, true, opacity);
      c.show();
    }
  }
}

//Funktion legt die Anfangswerte fest und befüllt somit die vorhandene Arrays.
void startVariable() {
  for (int i = 0; i<numbers; i++) {
    radius[i]=random(10, 25);
    x[i]= random(radius[i]/2, (width-(radius[i]/2)));
    speed[i]= random(2, 5);
    helixW[i]=random(30, 50);
    changeDirection[i] = false;
    y[i] = radius[i]/2;
  }
}

void mouseReleased() {
  //Speichern als PNG
  saveFrame("data/line-######.png");
}
