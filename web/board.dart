part of hangman;

class Board {

  const num X = 0;
  const num Y = 0;
  var length = listeMots.length;
  var badGuesses;
  var correctGuesses;
  
  /*const num BALL_RADIUS = 8;
  const num RACKET_WIDTH = 75;
  const num RACKET_HEIGHT = 8;

  Timer timer;*/

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Board(this.canvas, var listeMots) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;

    document.query('#play').onClick.listen((e) {
      init(listeMots);
    });
  }
  
  void init(var listeMots) {
    
    //On choisit le mot
    var rand = new Random();
    
    //for (var i= liste_mots.length -1; i>1; i--){
    var j = rand.nextInt(length);
    var mot = listeMots[j-1]; //on fait -1 parce que la fonction random commence à 0, alors que length commence à 1 
    var listeLettres = mot.split("");
    
    // creates a row of underscores the same length as letters to guess
    var listeBarreEnBas = [];
    for (var i = 0; i < length; i++) {
      listeBarreEnBas[i]=[];
      var positionX = 15;
      var positionY = 100;
      var barre_en_bas = new BarreEnBas (this, positionX, positionY, positionX + 15, positionY +2);
      listeBarreEnBas[i]=[positionX, positionY]; //Garde en mémoire les barres-en-bas      
      positionX += 5;
    }
    
    var timer = new Timer.periodic(const Duration(milliseconds: 10),
        (t) => redraw());
  }

  //Réinitialize la zone de dessin 
  void clear() {
    context.clearRect(X, Y, width, height);
  }
  
  void redraw(){
    clear();
    
    // recreates a row of underscores the same length as letters to guess
    var listeBarreEnBas = [];
    for (var i = 0; i < length; i++) {
      //-->if()
      listeBarreEnBas[i]=[];
      var positionX = 15;
      var positionY = 100;
      var barre_en_bas = new BarreEnBas (this, positionX, positionY, positionX + 15, positionY +2);
      listeBarreEnBas[i]=[positionX, positionY]; //Garde en mémoire les barres-en-bas      
      positionX += 5;
    }
    
   /* if (badGuesses > 0) {
      // create the upright
      c.strokeStyle = '#A52A2A';
      drawLine(c, [30,185], [30,10]);
    }
    if (badGuesses > 1) {
      // create the arm of the gallows
      c.lineTo(150,10);
      c.stroke();
    }
    if (badGuesses > 2) {
      c.strokeStyle = 'black';
      c.lineWidth = 3;
      // draw rope
      drawLine(c, [145,15], [145,30]);
      // draw head
      c.beginPath();
      c.moveTo(160, 45);
      c.arc(145, 45, 15, 0, (Math.PI/180)*360);
      c.stroke(); 
    }
    if (badGuesses > 3) {
      // draw body
      drawLine(c, [145,60], [145,130]);
    }
    if (badGuesses > 4) {
      // draw left arm
      drawLine(c, [145,80], [110,90]);
    }
    if (badGuesses > 5) {
      // draw right arm
      drawLine(c, [145,80], [180,90]);
    }
    if (badGuesses > 6) {
      // draw left leg
      drawLine(c, [145,130], [130,170]);
    }
    if (badGuesses > 7) {
      // draw right leg and end game
      drawLine(c, [145,130], [160,170]);
      
      
      c.fillText('Game over', 45, 110);
      // remove the alphabet pad
      letters.innerHTML = '';
      // display the correct answer
      // need to use setTimeout to prevent race condition
      setTimeout(showResult, 200);
      // increase score of lost games
      // display the score after two seconds
      // code to be added later
    }*/
    var barre_en_bas = new BarreEnBas(this);
    var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    var i;
    var lettre = alphabet[i];
    if (barre_en_bas.lettre) {
      if (listeLettres.contains(lettre)) { 
        
      }
     
    }
    
    // if the word has been guessed correctly, display message,
    // update score of games won, and then show score after 2 seconds
    if (correctGuesses == length) {
      letters.innerHTML = '';
      c.fillText('You won!', 45,110);
      // increase score of won games
      // display score
      // code to be added later
    }
    for(var i=0; i<length; i++){
      if (barreEnBas.rightDown) {
        if (racketSouth.x < width - X - racketSouth.w - 4) racketSouth.x += 5;
      } else if (racketSouth.leftDown) {
        if (racketSouth.x > X + 4) racketSouth.x -= 5;
      }
    }
    
  } 
  
  
}