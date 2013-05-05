library hangman;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'board.dart';
//part 'liste_mots.dart';
//part 'barreEnBas.dart';



// See the style guide: http://www.dartlang.org/articles/style-guide/.

//CanvasElement canvas = document.query('#canvas');


void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
// var  word = document.getElementById('word');
 //var  letters = document.getElementById('Letters');
 /*var  wordToGuess;
 var  wordLength;
 var  badGuesses;
 var   correctGuesses;*/
  Board board = new Board(canvas);
}