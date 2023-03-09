public class aGUI {
  private boolean toolTip, pauseMenu, developerOptions;
  private int mX, mY;
    public aGUI(boolean toolTip, boolean pauseMenu, boolean developerOptions) {
    this.toolTip = toolTip;
    this.pauseMenu = pauseMenu;
    this.developerOptions = developerOptions;
  }
  
  
 

  public boolean getPauseMenu(){
    return pauseMenu;
  }
    
      public boolean getDeveloperOptions(){
    return developerOptions;
  }
  
  public void setMouseValues(int x, int y){
    this.mX = x;
    this.mY = y;
  }
    
  
  public void pauseMenuToggle() {
        if (levelSelect == 0) {
      if (pauseMenu == false && level != 0) {
         pauseMenu = true;
      } else {
         pauseMenu = false;
      }
    }
  }
  
    public void toolTipToggle() {
    if (toolTip == false) {
      toolTip = true;
    } else {
      toolTip = false;
    }
  }
  
    public void developerOptionsToggle() {
    if (developerOptions == false) {
      developerOptions = true;
    } else {
      developerOptions = false;
    }
  }
  
  public void displayToolTip() {
      if (ToolTip == true) { 
    text("FPS: " + frameRate, 0, 15);
    text("Level Timer: " + levelTimer / 100, 0, 30);
    text("Level: " + level, 0, 45);

    
  }
  }
  
  public void displayDeveloperOptions() {
    
    if (developerOptions) {

      text("Box X Value: " + player.boxX, 0, 60);
      text("Box Y Value: " + player.boxY, 0, 75);
      text("Speed: " + player.speed, 0, 90);
      text("Jump Height: " + player.maxJumpHeight, 0, 105);
      text("Platform "+ check , 0, 120);
      text("Level Select State: " + levelSelect, 0, 135);
      text("To Increase Speed Press: P", 0, 165);
      text("To Increase Jump Height Press: H", 0, 180);
      text("To Select Any Level Press: L", 0, 195);
      text("To Remove ToolTips Press: T", 0, 210);
    } else {
    text("Level: " + level, 0, 15);
  }


  
  }
  
  public void displayPauseMenu() {
    if ( pauseMenu == true && level != 0) {
    fill(0, 220);
    rect(-10, -10, 800, 800);

    strokeWeight(2);
    stroke(255, 0, 0);
    fill(128, 128, 128);
    rect(100, 200, 200, 100);

    rect(400, 200, 200, 100);


    rect(245, 400, 200, 100);


    //Text

    fill(255);
    textSize(20);
    text("Restart", 160, 255);

    text("Reset Progress", 430, 255);

    text("Main Menu", 290, 455);
  }
  }
  
  public void checkClick() {
if (GUI.getPauseMenu()) {
    if  (mY <= 300 && mY >= 200 && mX > 100 && mX < 300) {

      levelTimer = 0;
      pauseMenu = false;
      return;
    }

    if  (mY <= 300 && mY >= 200 && mX > 400 && mX < 600) {
      levelTimer = 0;
      level = 1;

      json = new JSONObject();
      json.setInt("levelUnlocked", level);
      saveJSONObject(json, "data/data.json");
      pauseMenu = false;
      return;
    }

    if  (mY <= 500 && mY >= 400 && mX > 245 && mX < 445) {
      levelTimer = 0;
      level = 0;
      levelSelect = 0;
      pauseMenu = false;
      return;
    }
  }
  if (levelSelect == 0 ) { 


    if  (mY <= 300 && mY >= 200 && mX > 100 && mX < 300 && level == 0) {
      levelSelect = 0;
      println("Button Pressed");
      levelTimer = 0;
      level++;
      if (level >= levelUnlocked) {
        json = new JSONObject();
        json.setInt("levelUnlocked", level);
        saveJSONObject(json, "data/data.json");
      }
    }

    if  (mY <= 300 && mY >= 200 && mX > 400 && mX < 600 && level == 0) {
      exit();
    }


    if  (mY <= 500 && mY >= 400 && mX > 245 && mX < 445 && level == 0 &&   levelSelect == 0) {
      levelSelect = 1;
      json = loadJSONObject("data/data.json");
      levelUnlocked = json.getInt("levelUnlocked");
    }
  }

  if (levelSelect == -1) {


    if (mY <= 540 && mY >= 440 && mX > 30 && mX < 230) {
      levelSelect++;
      return;
    }

    if  (mY <= 540 && mY >= 440 && mX > 30 && mX < 230) {

      levelSelect = 0;
      level = 0;
      levelTimer = 0;
    }


    if  (mY <= 300 && mY >= 250 && mX > 130 && mX < 180) {

      levelSelect = 0;
      level = 1;
      levelTimer = 0;
    }

    if  (mY <= 300 && mY >= 250 && mX > 230 && mX < 230 + 50) {

      levelSelect = 0;
      level = 2;
      levelTimer = 0;
    }

    if  (mY <= 300 && mY >= 250 && mX > 330 && mX < 330 + 50) {

      levelSelect = 0;
      level = 3;
      levelTimer = 0;
    }

    if  (mY <= 300 && mY >= 250 && mX > 430 && mX < 430 + 50) {

      levelSelect = 0;
      level = 4;
      levelTimer = 0;
    }

    if  (mY <= 300 && mY >= 250 && mX > 530 && mX < 530 + 50) {

      levelSelect = 0;
      level = 5;
      levelTimer = 0;
    }

    if  (mY <= 400 && mY >= 350 && mX > 230 && mX < 230 + 50) {

      levelSelect = 0;
      level = 6;
      levelTimer = 0;
    }

    if  (mY <= 400 && mY >= 350 && mX > 330 && mX < 330 + 50) {

      levelSelect = 0;
      level = 7;
      levelTimer = 0;
    }

    if  (mY <= 400 && mY >= 350 && mX > 430 && mX < 430 + 50) {

      levelSelect = 0;
      level = 8;
      levelTimer = 0;
    }

    if  (mY <= 500 && mY >= 450 && mX > 330 && mX < 330 + 50) {

      levelSelect = 0;
      level = 9;
      levelTimer = 0;
    }




    if  (mY <= 500 && mY >= 4 && mX > 480 && mX < 680 + 50) {
    }

    if  (mY <= 540 && mY >= 440 && mX > 480 && mX < 680 + 50) {

      levelSelect--;
    }
  }

  if (levelSelect == -2) {
    if (mY <= 540 && mY >= 440 && mX > 30 && mX < 230) {
      levelSelect++;
      return;
    }
  }

  if (levelSelect == 1) {


    if (mY <= 540 && mY >= 440 && mX > 30 && mX < 230 && level == 0) {
      levelTimer = 0;
      level = 0;
      levelSelect--;
      pauseMenu = false;
      return;
    }

    if  (mY <= 540 && mY >= 440 && mX > 30 && mX < 230 && level == 0) {
      if (1 <= levelUnlocked) {
        levelSelect = 0;
        level = 0;
        levelTimer = 0;
      }
    }


    if  (mY <= 300 && mY >= 250 && mX > 130 && mX < 180 && level == 0) {
      if (1 <= levelUnlocked) {
        levelSelect = 0;
        level = 1;
        levelTimer = 0;
      }
    }

    if  (mY <= 300 && mY >= 250 && mX > 230 && mX < 230 + 50 && level == 0) {
      if (2 <= levelUnlocked) {
        levelSelect = 0;
        level = 2;
        levelTimer = 0;
      }
    }

    if  (mY <= 300 && mY >= 250 && mX > 330 && mX < 330 + 50 && level == 0) {
      if (3 <= levelUnlocked) {
        levelSelect = 0;
        level = 3;
        levelTimer = 0;
      }
    }

    if  (mY <= 300 && mY >= 250 && mX > 430 && mX < 430 + 50 && level == 0) {
      if (4 <= levelUnlocked) {
        levelSelect = 0;
        level = 4;
        levelTimer = 0;
      }
    }

    if  (mY <= 300 && mY >= 250 && mX > 530 && mX < 530 + 50 && level == 0) {
      if (5 <= levelUnlocked) {
        levelSelect = 0;
        level = 5;
        levelTimer = 0;
      }
    }

    if  (mY <= 400 && mY >= 350 && mX > 230 && mX < 230 + 50 && level == 0) {
      if (6 <= levelUnlocked) {
        levelSelect = 0;
        level = 6;
        levelTimer = 0;
      }
    }

    if  (mY <= 400 && mY >= 350 && mX > 330 && mX < 330 + 50 && level == 0) {
      if (7 <= levelUnlocked) {
        levelSelect = 0;
        level = 7;
        levelTimer = 0;
      }
    }

    if  (mY <= 400 && mY >= 350 && mX > 430 && mX < 430 + 50 && level == 0) {
      if (8 <= levelUnlocked) {
        levelSelect = 0;
        level = 8;
        levelTimer = 0;
      }
    }

    if  (mY <= 500 && mY >= 450 && mX > 330 && mX < 330 + 50 && level == 0) {
      if (9 <= levelUnlocked) {
        levelSelect = 0;
        level = 9;
        levelTimer = 0;
      }
    }


    if  (mY <= 540 && mY >= 440 && mX > 480 && mX < 680 + 50 && level == 0) {

      levelSelect++;
    }
  }




  if (levelSelect == 2) {

    if (mY <= 540 && mY >= 440 && mX > 30 && mX < 230 && level == 0) {
      levelTimer = 0;
      levelSelect--;
      pauseMenu = false;
      return;
    }
  }


  if  ( mY <= 450 && mY >= 350 && mX > 400 && mX < 600 && level == 10) {
    exit();
  }


  if  (mY <= 450 && mY >= 350 && mX > 100 && mX < 300 && level == 10) {
    level = 1;
    higherjump = false;
    player.maxJumpHeight = 15;
    player.jump = 15;
    player.boxX = 50;
    player.boxY = 640;
  } else if (level == 10) {
    println("Button Not Pressed");
  }
    
  }
  
}
