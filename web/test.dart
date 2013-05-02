/*library hangman;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'board.dart';
//part 'liste_mots.dart';
part 'barreEnBas.dart';
//part 'test.dart';*/


// See the style guide: http://www.dartlang.org/articles/style-guide/.


void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Board board = new Board(canvas);
  var listeBarreEnBas = [];
  for (var i = 0; i < 10; i++) {
    listeBarreEnBas[i]=[];
    var positionX = 15;
    var positionY = 100;
    var barre_en_bas = new BarreEnBas (canvas, positionX, positionY, positionX + 15, positionY +2);
    print ("barre_en_bas");
    listeBarreEnBas[i]=[positionX, positionY]; //Garde en mémoire les barres-en-bas      
    positionX += 5;
  }


}