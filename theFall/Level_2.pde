//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_2 {
  // Translate variable
  float valueX;

  // Font variables
  PFont fontLevel;

  // Platforms' location in PVector
  PVector Platform1;
  PVector Platform2;
  PVector Platform3;
  PVector Platform4;
  PVector Platform5;
  PVector Platform6;
  PVector Platform7;
  PVector Platform8;
  PVector Platform9;
  PVector Platform10;
  
  // Boolean to startLevel
  boolean startLevel;


  //--------------------------CONSTRUCTOR--------------------------
  Level_2() {
    valueX = 0.0;

    // Font variables
    fontLevel = createFont("font/SourceCodePro-Bold.ttf", 16, true);

    // Initialize Platforms' location
    Platform1 = new PVector(200, height - blockSize*6);
    Platform2 = new PVector(Platform1.x + blockSize*7, height - blockSize*4);
    Platform3 = new PVector(Platform2.x + blockSize*3, height - blockSize*3);
    Platform4 = new PVector(Platform3.x + blockSize*2, height - blockSize*4);
    Platform5 = new PVector(Platform4.x + blockSize*3, height - blockSize*3);
    Platform6 = new PVector(Platform5.x + blockSize*2, height - blockSize*4);   
    Platform7 = new PVector(Platform6.x + blockSize*7, height - blockSize*3);
    Platform8 = new PVector(Platform7.x + blockSize*3, height - blockSize*4);
    Platform9 = new PVector(Platform8.x + blockSize*4, height - blockSize*3);
    Platform10 = new PVector(Platform9.x + blockSize*2, height - blockSize*2);
    

    // Initialize the player and starting position
    player_lvl2 = new Player(new PVector(485, Platform1.y - 75), 1);
    
    startLevel = true;
  }

  //----------------------------METHODS----------------------------

  // Method for creating first level ------------------------------
  void play() { 
    if (startLevel) {
      // Display Background ...............
      level2BG.display();
  
      // Scroll the level (if)............
      scrollPlatform();
  
      // Display Platforms ................
      displayArray(L2_b1, Platform1);
      displayArray(L2_b2, Platform2);
      displayArray(L2_b3, Platform3);
      displayArray(L2_b4, Platform4);
      displayArray(L2_b5, Platform5);
      displayArray(L2_b6, Platform6);
      displayArray(L2_b7, Platform7);
      displayArray(L2_b8, Platform8);
      displayArray(L2_b9, Platform9);
      displayArray(L2_b10, Platform10);
  
      // Check the position of ............
      // the player            
      player_lvl2.chekPlatform(L2_b1);
      player_lvl2.chekPlatform(L2_b2);
      player_lvl2.chekPlatform(L2_b4);
      player_lvl2.chekPlatform(L2_b6);
      player_lvl2.chekPlatform(L2_b7);
      player_lvl2.chekPlatform(L2_b8);
      player_lvl2.chekPlatform(L2_b9);
      player_lvl2.chekPlatform(L2_b10);
  
      // Scenary BEHIND ...................
      // the player     
      scenary.displayTree(new PVector(Platform1.x + 50, Platform1.y));
      scenary.displayTree(new PVector(Platform1.x + 250, Platform1.y));
      scenary.displayTree(new PVector(Platform1.x + 350, Platform1.y));
      scenary.displayTree(new PVector(Platform1.x + 450, Platform1.y));
      scenary.displayTree(new PVector(Platform6.x + 100, Platform6.y));
      scenary.displayTree(new PVector(Platform6.x + 200, Platform6.y));
      scenary.displayTree(new PVector(Platform6.x + 300, Platform6.y));
      scenary.displayTree(new PVector(Platform8.x + 200, Platform8.y));
      scenary.displayWinPanel(new PVector(Platform10.x + 250, Platform10.y));
  
      // Display the player ...............
      player_lvl2.display();   
  
      // Scenary IN FRONT of ..............
      // the player    
      scenary.displayTree(new PVector(Platform1.x + 100, Platform1.y));
      scenary.displayTree(new PVector(Platform1.x + 300, Platform1.y));
      scenary.displayTree(new PVector(Platform1.x + 400, Platform1.y));
      scenary.displayTree(new PVector(Platform4.x + 100, Platform4.y));
      scenary.displayTree(new PVector(Platform6.x + 150, Platform6.y));
      scenary.displayTree(new PVector(Platform6.x + 250, Platform6.y));
      scenary.displayTree(new PVector(Platform6.x + 350, Platform6.y));
      scenary.displayFlower(new PVector(Platform1.x + 100, Platform1.y));
      scenary.displayFlower(new PVector(Platform2.x + 100, Platform2.y));
      scenary.displayFlower(new PVector(Platform4.x + 50, Platform4.y));
      scenary.displayFlower(new PVector(Platform4.x + 25, Platform4.y));
      scenary.displayFlower(new PVector(Platform8.x + 125, Platform8.y));
      
      // Check Status ....................
      if (isDead()) {
        gameOver();
      }
      if (win()) {
        youWin();
      }
    } else {
      level_3.play();
    }
  }


  // Method to select block array and display it ----------------
  void displayArray(Block block[][], PVector location) {
    // Call the array
    for (int i = 0; i < block.length; i++) {
      for (int j = 0; j < block[0].length; j++) {
        // Display the block
        block[i][j].display(new PVector(location.x + i*blockSize, location.y + j*blockSize));
      }
    }
  }


  // Method to chekEdges and move the scene --------------------
  void scrollPlatform() {
    // If the player is on the right edge of the screen
    if (player_lvl2.location.x >= width - valueX - 400) {
      // Rearrange valueX (-)
      valueX -= 7;
    }
    // If the player is on the left edge of the screen
    if (player_lvl2.location.x <= 0 - valueX + 400) {
      // Rearrange valueX (+)
      valueX += 7;
    }
    // Change the parameter of translate with new valueX
    translate(valueX, 0);
  }


  // Method to activate gameOver ------------------------------
  void gameOver() {
    // Reset the matrix for the text
    resetMatrix();
    
    // Set text align to center and the size
    textAlign(CENTER);
    textFont(fontLevel, 75);
    fill(255, 0, 0);
    // Display the text
    text("GAME OVER", width/2, height/2 - 100);
    // Set text align to center and the size
    textFont(fontLevel, 25);
    fill(0);
    // Display the text
    text("- Press Space to Restart -", width/2, height/2 - 50);
    
    // If space is hit, reset the player's position
    if (key == 32) {
      player_lvl2.location = new PVector(485, Platform1.y - 150);
    }
  }
  
  
  // Method to activate winner screen --------------------------
  void youWin() {
    // Reset the matrix for the text
    resetMatrix();
    
    // Set text align to center and the size
    textAlign(CENTER);
    textFont(fontLevel, 75);
    fill(255, 0, 0);
    // Display the text
    text("LEVEL COMPLETE", width/2, height/2 - 100);
    // Set text align to center and the size
    textFont(fontLevel, 25);
    fill(0);
    // Display the text
    text("- Press Space to continue -", width/2, height/2 - 50);
    
    // If space is hit, reset the player's position
    if (key == 32 && startLevel) {
      startLevel = !startLevel;
      
    }
  }


  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl2.location.y > height &&
      player_lvl2.location.x < Platform8.x + blockSize*4) {
      // Return true
      return true;
    } else {
      return false;
    }
  }


  // Boolean to check if the player win -------------------
  boolean win() {
    // If the player fall
    if (player_lvl2.location.y > height &&
      player_lvl2.location.x > Platform10.x) {
      // Return true
      return true;
    } else {
      return false;
    }
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// The platforms
Block [][] L2_b1;
Block [][] L2_b2;
Block [][] L2_b3;
Block [][] L2_b4;
Block [][] L2_b5;
Block [][] L2_b6;
Block [][] L2_b7;
Block [][] L2_b8;
Block [][] L2_b9;
Block [][] L2_b10;

// The background
Background level2BG;
// The Player
Player player_lvl2;