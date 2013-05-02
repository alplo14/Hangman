library hangman;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'board.dart';
part 'liste_mots.dart';
part 'barreEnBas.dart';



// See the style guide: http://www.dartlang.org/articles/style-guide/.


void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Board board = new Board(canvas, listeMots);
}
