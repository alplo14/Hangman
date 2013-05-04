part of hangman;

var  wordToGuess;
var  wordLength;
var  badGuesses;
var   correctGuesses;

class Board {

  const num X = 0;
  const num Y = 0;
  //var length = listeMots.length;
//  var badGuesses;
//  var correctGuesses;
  
  /*const num BALL_RADIUS = 8;
  const num RACKET_WIDTH = 75;
  const num RACKET_HEIGHT = 8;

  Timer timer;*/

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Board(this.canvas) {
    context = canvas.getContext("2d");
    window.localStorage['hangmanWin'] = '0';
    window.localStorage['hangmanLose'] = '0';
   // window.localStorage.setItem('hangmanWin', 0);   // coumba
  //  window.localStorage.setItem('hangmanLose', 0);  //coumba
    width = canvas.width;
    height = canvas.height;

    document.query('#play').onClick.listen((e) {
      newGame();
    });
  }
  newGame() {
    var placeholders = '',
        frag = document.createDocumentFragment();
     var abc = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    badGuesses = 0;
    correctGuesses = 0;
    wordToGuess = getWord();
    wordLength = wordToGuess.length;
    // create row of underscores the same length as letters to guess
    for (var i = 0; i < wordLength; i++) {
      placeholders += '_ ';
    }
    document.query('#word').innerHtml = placeholders;
    //word.innerHTML = placeholders;
    // create an alphabet pad to select letters
    document.query('#Lettres').innerHtml = '';
    //letters.innerHTML = '';
    for (var i = 0; i < 26; i++) {
      //HtmlElement  div = window.document.createElement("div");
      var div = new DivElement();
      //var div = document.createElement('div');
      div.style.cursor = 'pointer';
      div.id = 'test';
      document.query('#test').innerHtml = abc[i];
      //div.innerHTML = abc[i];
      document.query('#test').onClick = getLetter;
      //div.onclick = getLetter;
      frag.appendChild(div);
    }
    letters.appendChild(frag);
    drawCanvas();
  }

  drawCanvas() {
    var c = canvas.getContext('2d');
    // reset the canvas and set basic styles
    canvas.width = canvas.width;
    //c.lineWidth = 10;
    //c.strokeStyle = 'green';
    //c.font = 'bold 24px Optimer, Arial, Helvetica, sans-serif';
    //c.fillStyle = 'red';
    // draw the ground
    drawLine(c, [20,190], [180,190]);
    // start building the gallows if there's been a bad guess
    if (badGuesses > 0) {
      // create the upright
      // c.strokeStyle = '#A52A2A';
      drawLine(c, [30,185], [30,10]);
      if (badGuesses > 1) {
        // create the arm of the gallows
        c.lineTo(150,10);
        c.stroke();
      }
      if (badGuesses > 2) {
        // c.strokeStyle = 'black';
        // c.lineWidth = 3;
        // draw rope
        drawLine(c, [145,15], [145,30]);
        // draw head
        c.beginPath();
        c.moveTo(160, 45);
        c.arc(145, 45, 15, 0, (PI/180)*360);
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
        document.query('#letters').innerHTML = '';
        // display the correct answer
        // need to use setTimeout to prevent race condition
        //  setTimeout(showResult, 200);
        // increase score of lost games
        window.localStorage.setItem('hangmanLose', 1 + int.parse(window.localStorage.getItem('hangmanLose')));
        // display the score after two seconds
        new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => drawCanvas());  // coumba
        //setTimeout(showScore, 2000);
      }
    }
    // if the word has been guessed correctly, display message,
    // update score of games won, and then show score after 2 seconds
    var m;
    if (correctGuesses == wordLength) {
      letters.innerHTML = '';
      c.fillText('You won!', 45,110);
      // increase score of won games
      // display score
    //   m = 1 + int.parse(window.localStorage.getItem('hangmanWin');
      //window.localStorage['hangmanWin'] = string.m ;
      window.localStorage.setItem('hangmanWin', 1 + int.parse(window.localStorage.getItem('hangmanWin')));
      new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => drawCanvas());  // coumba
      //setTimeout(showScore, 2000);
    }
  }

  drawLine(context, from, to) {
    context.beginPath();
    context.moveTo(from[0], from[1]);
    context.lineTo(to[0], to[1]);
    context.stroke();
  }

  getWord() {
    var a = ['abate','aberrant','abscond','accolade','acerbic','acumen','adulation','adulterate','aesthetic','aggrandize','alacrity','alchemy','amalgamate','ameliorate','amenable','anachronism','anomaly','approbation','archaic','arduous','ascetic','assuage','astringent','audacious','austere','avarice','aver','axiom','bolster','bombast','bombastic','bucolic','burgeon','cacophony','canon','canonical','capricious','castigation','catalyst','caustic','censure','chary','chicanery','cogent','complaisance','connoisseur','contentious','contrite','convention','convoluted','credulous','culpable','cynicism','dearth','decorum','demur','derision','desiccate','diatribe','didactic','dilettante','disabuse','discordant','discretion','disinterested','disparage','disparate','dissemble','divulge','dogmatic','ebullience','eccentric','eclectic','effrontery','elegy','eloquent','emollient','empirical','endemic','enervate','enigmatic','ennui','ephemeral','equivocate','erudite','esoteric','eulogy','evanescent','exacerbate','exculpate','exigent','exonerate','extemporaneous','facetious','fallacy','fawn','fervent','filibuster','flout','fortuitous','fulminate','furtive','garrulous','germane','glib','grandiloquence','gregarious','hackneyed','halcyon','harangue','hedonism','hegemony','heretical','hubris','hyperbole','iconoclast','idolatrous','imminent','immutable','impassive','impecunious','imperturbable','impetuous','implacable','impunity','inchoate','incipient','indifferent','inert','infelicitous','ingenuous','inimical','innocuous','insipid','intractable','intransigent','intrepid','inured','inveigle','irascible','laconic','laud','loquacious','lucid','luminous','magnanimity','malevolent','malleable','martial','maverick','mendacity','mercurial','meticulous','misanthrope','mitigate','mollify','morose','mundane','nebulous','neologism','neophyte','noxious','obdurate','obfuscate','obsequious','obstinate','obtuse','obviate','occlude','odious','onerous','opaque','opprobrium','oscillation','ostentatious','paean','parody','pedagogy','pedantic','penurious','penury','perennial','perfidy','perfunctory','pernicious','perspicacious','peruse','pervade','pervasive','phlegmatic','pine','pious','pirate','pith','pithy','placate','platitude','plethora','plummet','polemical','pragmatic','prattle','precipitate','precursor','predilection','preen','prescience','presumptuous','prevaricate','pristine','probity','proclivity','prodigal','prodigious','profligate','profuse','proliferate','prolific','propensity','prosaic','pungent','putrefy','quaff','qualm','querulous','query','quiescence','quixotic','quotidian','rancorous','rarefy','recalcitrant','recant','recondite','redoubtable','refulgent','refute','relegate','renege','repudiate','rescind','reticent','reverent','rhetoric','salubrious','sanction','satire','sedulous','shard','solicitous','solvent','soporific','sordid','sparse','specious','spendthrift','sporadic','spurious','squalid','squander','static','stoic','stupefy','stymie','subpoena','subtle','succinct','superfluous','supplant','surfeit','synthesis','tacit','tenacity','terse','tirade','torpid','torque','tortuous','tout','transient','trenchant','truculent','ubiquitous','unfeigned','untenable','urbane','vacillate','variegated','veracity','vexation','vigilant','vilify','virulent','viscous','vituperate','volatile','voracious','waver','zealous'];
    var alea = new Random();
    var j = alea.nextInt(a.length);
    return a[j];
  }
  
 /* void init(var listeMots) {
    
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
//    var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];  pas necessaire ici puisque c'est déclaré dans barre en bas
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
    
  } */
  
  
}