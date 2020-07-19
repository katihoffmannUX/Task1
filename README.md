# Task1
Aufgabe1
Augabe war es ein Algorithmus zu entwickeln und mit sin() eine Animation zu erstellen.
Die Regeln lauten folgend:
• Lasse eine zufällige Anzahl von weißen Kugeln vom oberen Rand an unterschiedlichen
  Stellen des Sketches fallen
• Die Kugeln sind unterschiedlich groß und fallen unterschiedlich schnell nach unten
• Beim Aufprall an der unteren Kante des Sketches teilt sich die Kugel in 2 kleinere Kugeln
• Helixförmig steigen die Kugeln nach oben und leuchten in bläulicher Farbe auf
• Desto höher die Kuglen schweben, desto mehr lösen sie sich auf
• Wenn 2 Kugeln oben die obere Kante des Sketches berühren, verschwinden diese.
  Danach taucht oben wieder eine neue Kugel mit einer zufälligen Position und Radius auf
• Die Schritte wiederholen sich unendlich

Variante 1: Der Hintergrund wird in der draw()-Funktion immer neu über alte frames gesetzt.
             Hierbei sieht man dann, wie die Kugeln sich bewegen. Es erscheint wie ein Bild-
             schirmschoner.
Variante 2: Der Hintergrund wird nicht neu gesetzt, sodass man ein komplexes Muster be 
             kommt.
