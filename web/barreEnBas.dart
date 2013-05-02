part of hangman;

class BarreEnBas {

  Board board;
  
  num x;
  num y;
  num finalX;
  num finalY;
  var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
  
  bool lettre = false;
 // bool leftDown = false;

  
  
  BarreEnBas(this.board, this.x, this.y, this.finalX, this.finalY) {
    draw();
    document.onKeyDown.listen(onKeyDown);
    document.onKeyUp.listen(onKeyUp);
    
  }

  void draw() {
    board.context.beginPath();
    board.context.rect(x, y, finalX, finalY);
    board.context.closePath();
    board.context.fill();
  }
  
  // Set rightDown or leftDown if the right or left keys are down.
 /* void onKeyDown(event) {
    if (event.keyCode == 39) {
      rightDown = true;
    } else if (event.keyCode == 37) {
      leftDown = true;
    }
  }

  // Unset rightDown or leftDown when the right or left key is released.
  void onKeyUp(event) {
    if (event.keyCode == 39) {
      rightDown = false;
    } else if (event.keyCode == 37) {
      leftDown = false;
    }*/
  
  // Set rightDown or leftDown if the right or left keys are down.
  void onKeyDown(event) {
    for (var i=0; i<alphabet.length; i++){
      var lettre2 = alphabet[i];
      if (event.keyCode == lettre2) {
        lettre = true;
      }
    }
  }

  // Unset rightDown or leftDown when the right or left key is released.
  void onKeyUp(event) {
    for (var i=0; i< alphabet.length; i++){
      var lettre2 = alphabet[i];
      if (event.keyCode == alphabet[i]) {
        lettre = false;
      }
    }
  }
  


}