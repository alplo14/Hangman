part of hangman;

class Board {
  
  const num X = 0;
  const num Y = 0;
  var badGuesses;
  var correctGuesses;
  var positionX = 15;
  var positionY = 100;
  
  Timer timer;
  
  CanvasElement canvas;
  CanvasRenderingContext2D context;
  
  num width;
  num height;
  
  Board(this.canvas){
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    
    document.query('#play').onClick.listen((e){
     init(); 
    }  
    );
    
  }
  
  void init(){
    
    var listeMots = ["lapin", "canard", "cochon", "poule", "vache", "boeuf", "orignal", "hamster", "perruche", "serpent", "tortue", "hirondelle"];
    var lengthListe = listeMots.length;
    
    //On choisit le mot
    var rand = new Random();
    var j = rand.nextInt(lengthListe);
    var mot = listeMots[j].split("");
    var lengthMot = mot.length;
    var listeBarreEnBas = new List(lengthMot);
    
    //creates a row of underscores the same length as letters to guess
    
    for (var i =0; i<lengthMot; i++){
      //listeBarreEnBas.add=[];
      listeBarreEnBas[i]=[positionX, positionY]; //Garde en mémoire les barres-en-bas
      positionX += 5;      
    }
    
    /*var timer = new Timer.periodic(const Duration(milliseconds: 10),
        (t) => redraw());*/
  }}