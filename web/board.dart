part of hangman;



class Board {

  var wordToGuess;
  var wordLength;
  var badGuesses;
  var correctGuesses;
  var lettresUtilisees;
  var lettreMinuscule;
  var abc = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  var placeholders;
  var lettresTrouvees = new List(26);
  
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
    //window.localStorage['hangmanWin'] = '0';
    //window.localStorage['hangmanLose'] = '0';
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
     
    badGuesses = 0;
    correctGuesses = 0;
    wordToGuess = getWord();
    wordLength = wordToGuess.length;
    lettresUtilisees = new List(26);//pour pouvoir contenir l'alphabet complet si nécessaire.
    // create row of underscores the same length as letters to guess
    for (var i = 0; i < wordLength; i++) {
      placeholders += '_ ';
    }
    document.query('#word').innerHtml = placeholders;
    //word.innerHTML = placeholders;
    // create an alphabet pad to select letters
    //document.query('#Lettres').innerHtml = '';
    //letters.innerHTML = '';
    /*for (var i = 0; i < 26; i++) {
      //HtmlElement  div = window.document.createElement("div");
      var div = new DivElement();
      //var div = document.createElement('div');
      div.style.cursor = 'pointer';
      div.id = 'test';
      //document.query('#test').innerHtml = abc[i];
      //div.innerHTML = abc[i];
      //document.query('#test').onClick = getLetter();
      //div.onclick = getLetter;
      //frag.appendChild(div);
    }*/
    

    //la partie ci-haut n'est plus nécessaire, puisque les boutons sont dans le html. sinon les boutons n'apparaissaient pas correctement dans la zone de jeu, et je crois que ce sera plus facile à gérer comme ça.
   /* */ 
    
    /* document.query('#test').onClick = getLetter(); */ 
    //letters.appendChild(frag);
    catchLetter(placeholders, lettreMinuscule);

  }
  
  catchLetter(placeholders, lettreMinuscule){
    if(correctGuesses!= wordLength && badGuesses<=7){ //tant que la partie n'est pas perdue ou gagnée
      document.query('#a').onClick.listen((e){
        var lettre = "a";
        //print (placeholders);
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#b').onClick.listen((e){
        var lettre = "b";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#c').onClick.listen((e){
        var lettre = "c";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#d').onClick.listen((e){
        var lettre = "d";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#d').onClick.listen((e){
        var lettre = "d";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#e').onClick.listen((e){
        var lettre = "e";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#f').onClick.listen((e){
        var lettre = "f";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#g').onClick.listen((e){
        var lettre = "g";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#h').onClick.listen((e){
        var lettre = "h";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#i').onClick.listen((e){
        var lettre = "i";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#j').onClick.listen((e){
        var lettre = "j";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#k').onClick.listen((e){
        var lettre = "k";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#l').onClick.listen((e){
        var lettre = "l";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#m').onClick.listen((e){
        var lettre = "m";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#n').onClick.listen((e){
        var lettre = "n";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#o').onClick.listen((e){
        var lettre = "o";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#p').onClick.listen((e){
        var lettre = "p";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#q').onClick.listen((e){
        var lettre = "q";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#r').onClick.listen((e){
        var lettre = "r";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#s').onClick.listen((e){
        var lettre = "s";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#t').onClick.listen((e){
        var lettre = "t";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#u').onClick.listen((e){
        var lettre = "u";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#v').onClick.listen((e){
        var lettre = "v";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#w').onClick.listen((e){
        var lettre = "w";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#x').onClick.listen((e){
        var lettre = "x";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#y').onClick.listen((e){
        var lettre = "y";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
      document.query('#z').onClick.listen((e){
        var lettre = "z";
        checkLetter(lettre, placeholders);
        drawCanvas(lettresUtilisees, lettreMinuscule);
      });
    }
  }
  
  /*/*getLetter(letter, placeholders) {
    checkLetter(letter, placeholders); Pour savoir c'est quelle lettre, il faut savoir où la personne 
    a cliqué. "This" fait référence à board, et non à l'événement "click".  */
    
    //this.innerHTML = '&nbsp;';
    //this.style.cursor = 'default';
    //this.onclick = null;
  }*/

  checkLetter(letter, placeholders) {
    //var placeholders = document.query('#word').innerHTML,
    
    var lettreMinuscule = letter.toLowerCase();
    var wrongGuess = true;
   // print (placeholders);
    // split the placeholders into an array
    var placeholdersList = placeholders.split(' ');
    placeholders ='';
    //print (placeholdersList);
    var letterFromWord =wordToGuess.split(''); 
    
    for (var i = 0; i < wordLength; i++){
      
    }
    // loop through the array
    if (!lettresUtilisees.contains(lettreMinuscule)){//pour ne pas compter lorsque la lettre a déjà été utilisée.
      for (var i = 0; i < wordLength; i++) {
        var lettreDevinee = letterFromWord[i];
        // if the selected letter matches one in the word to guess,
       // replace the underscore and increase the number of correct guesses
        if (lettreDevinee == letter.toLowerCase()) {
          for (var j=0; j<lettresTrouvees.length; j++){
            if (lettresTrouvees[j]==null){ //trouve le prochain emplacement vide dans lettresTrouvees
              lettresTrouvees[j]=[lettreDevinee,i];//pour se souvenir de l'adresse
              break; //sinon tous les emplacement "null" vont se remplir.
            }

          }
//          print (lettresTrouvees[j][0]);
  //        print (lettresTrouvees[j][1]);


          wrongGuess = false;
          correctGuesses++;
          lettresUtilisees[i]=lettreMinuscule;

          //enleve la lettre des lettres acceptées.
          //print (i);
          letterFromWord[i] = "...";
           
          // redraw the canvas only if all letters have been guessed
          if (correctGuesses == wordLength) {
            //return placeholders;
            drawCanvas(lettresUtilisees, lettreMinuscule);
          }
        }
        for (var j =0; j<lettresTrouvees.length; j++){//retrouve les lettres dont l'adresse est i.
          if (lettresTrouvees[j]!=null){
            //print (lettresTrouvees.length);
            //print (lettresTrouvees[j][0]);
            //print (lettresTrouvees[j][1]);
            //print (i);
            if (lettresTrouvees[j][1]==i){
              var lettreAPlacer = lettresTrouvees[j][0];
              placeholdersList[i]=lettreAPlacer;
            }
          }
        }

        //placeholdersList[i] = lettresTrouves[i][0];
        placeholders ='';
        for (var j=0; j < placeholdersList.length; j++){
          var symbol = placeholdersList[j];
          placeholders = "$placeholders $symbol";
        }
     }
    }
    //print (placeholders);
    document.query('#word').innerHtml = placeholders;
    // if the guess was incorrect, increment the number of bad
    // guesses and redraw the canvas
    if (wrongGuess) {
      badGuesses++;
      /*for (var i=0; i<lettresUtilisees.length; i++){
        if (lettresUtilisees == null){
          lettresUtilisees[i]=lettreMinuscule;
          break;
        }
      }*/
   // return placeholders;
    
    drawCanvas(lettresUtilisees, lettreMinuscule);
    }
    //print (placeholders);
    //return placeholders;
    // convert the array to a string and display it again
    //word.innerHTML = placeholdersList.join('');
  }
  

  drawCanvas(lettresUtilisees, lettreMinuscule) {
    
    var c = canvas.getContext('2d');
    // reset the canvas and set basic styles
    canvas.width = canvas.width;
    //c.lineWidth = 10;
    //c.strokeStyle = 'green';
    //c.font = 'bold 24px Optimer, Arial, Helvetica, sans-serif';
    //c.fillStyle = 'red';
    // draw the ground
    
    // start building the gallows if there's been a bad guess
    //if (lettresUtilisees.contains(lettreMinuscule)){
      var stringLettresUtilisees = '';
      for (var i=0; i<lettresUtilisees.length; i++){
        stringLettresUtilisees = "$stringLettresUtilisees $lettresUtilisees[i]";
      }
      //document.query('#lettresUtilisees').innerHtml = lettresUtilisees;
      if (badGuesses > 0) {
        // create the upright
        // c.strokeStyle = '#A52A2A';
        drawLine(c, [20,190], [180,190]);
        drawLine(c, [30,185], [30,10]);
        for (var i=0; i<lettresUtilisees.length; i++){
          if (lettresUtilisees == null){
            lettresUtilisees[i]=lettreMinuscule;
            break;
          }
        }
      }
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
       correctGuesses = wordLength+1; //permet d'empêcher le joueur de gagner quand il a perdu.
       //empêche les lettres de continuer d'apparaître.
       for (var i=0; i<abc.length; i++){
        lettresUtilisees[i]=abc[i];
       }
      /* for (var i = 0; i < wordLength; i++) {
         if (lettre == letter.toLowerCase() && !lettresUtilisees.contains(lettre)) {
           placeholdersList[i] = "$letter ";
           placeholders ='';
           for (var i=0; i<placeholdersList.length; i++){
             var symbol = placeholdersList[i];
             placeholders = "$placeholders $symbol";
           }
         }
       }*/
       //document.query('#word').innerHtml = placeholders;
       // remove the alphabet pad
       //document.query('#letters').innerHTML = '';
       // display the correct answer
       // need to use setTimeout to prevent race condition
       //  setTimeout(showResult, 200);
       // increase score of lost games
       //window.localStorage.setItem('hangmanLose', 1 + int.parse(window.localStorage.getItem('hangmanLose')));
       // display the score after two seconds
       //new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => drawCanvas(lettresUtilisees, lettreMinuscule));  // coumba
       //setTimeout(showScore, 2000);
     
    }
    // if the word has been guessed correctly, display message,
    // update score of games won, and then show score after 2 seconds
    var m;
    
    //
    
    if (correctGuesses == wordLength) {
      //letters.innerHTML = '';
      c.fillText('You won!', 45,110);
      // increase score of won games
      // display score
    //   m = 1 + int.parse(window.localStorage.getItem('hangmanWin');
      //window.localStorage['hangmanWin'] = string.m ;
      //window.localStorage.setItem('hangmanWin', 1 + int.parse(window.localStorage.getItem('hangmanWin')));
      //new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => drawCanvas(lettresUtilisees, lettreMinuscule));  // coumba
      //setTimeout(showScore, 2000);
    }
    else (){
      catchLetter();
    };
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