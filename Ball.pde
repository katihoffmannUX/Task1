/*Die Klasse Ball zeichnet mit der Funktion show() eine Kugel, 
 die den Parametern entspricht die man überreicht bekommt*/

class Ball {
  //Position (x,y) und Radius des neu erzeugten Balls
  float x;
  float y;
  float radius;
  //Ob die Kugel weiß oder blau ist
  boolean fill;
  //Wie transparenz die Kugel in dem jeweiligen Zeitpunkt ist
  float opacity;
  //Farben der Kugeln
  color c[] = new color[2];

  Ball(float _x, float _y, float _radius, boolean _fill, float _opacity) {
    //Aktuelle Werte werden überreicht
    x=_x;
    y=_y;
    radius=_radius;
    fill = _fill;
    opacity = _opacity;
    //Blau
    c[0] = color(185, 224, 237);
    //Weiß
    c[1] = color(255);
  }

  //Zeichnet die Kugel an der passende Stelle
  void show() {
    noStroke();
    //Abfrage wie die Kugel ausgefüllt werden soll. Falls diese nach oben schwebt, ist fill==true und die Kugel blau.
    if (fill == true) {
      fill(c[0], opacity);
    } else
    {
      fill(c[1], opacity);
    }
    circle(x, y, radius);
  }
}
