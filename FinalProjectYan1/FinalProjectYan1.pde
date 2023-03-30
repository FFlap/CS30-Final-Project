JSONObject json;
File data;
PImage titleImage, endImage, comingImage, world1;
//global variables


//Player
aPlayer player = new aPlayer(10, 20, 10);

//Ground
aPlatform ground = new aPlatform(0, -40, 660, 780, 45, #32CD32);
ArrayList<aPlatform> platforms = new ArrayList<aPlatform>();
ArrayList<aObject> objects = new ArrayList<aObject>();
ArrayList<aPowerup> powerups = new ArrayList<aPowerup>();

aWorld world = new aWorld();

//Current Preset GUI Variables

aGUI GUI = new aGUI(true, false, false );

//Previous Variables
int levelUnlocked = 0;
int levelSelect = 0;


void setup() {
  size(700, 700);
  GUI.load();
}
void draw() {
  background(0);

  //Box
  player.display();
  //player.data();

  ground.display();

  // Levels
  world.load();
  world.display();
  world.checkWaves();

  //GUI
  GUI.displayToolTip();
  GUI.displayPauseMenu();
  GUI.displayButtons();
  GUI.displayDeveloperButtons();
}


public void keyReleased() {


  if (  key == 'a' || key == 'A' || keyCode == LEFT) {
    player.stopLeft();
  }

  if ( key == 'd' || key == 'D' || keyCode == RIGHT) {
    player.stopRight();
  }
}

public void keyPressed() {



  if (key == ESC) {
    key = 0;
    GUI.pauseMenuToggle();
  }

  if ( key == 't' || key == 'T') {
    GUI.toolTipToggle();
  }



  if ( !GUI.getPauseMenu() && levelSelect == 0) {
    if ( key == 'R' || key == 'r') {
      for (aPowerup pow : powerups) {
        if (pow.getType() == "glasses") {
          pow.glassesPowerupToggle();
          break;
        }
      }
    }


    //Movement
    if (  key == 'w' || key == 'W' || keyCode == UP || key ==  ' ') {
      player.jump();
    }

    if ( key == 'a' || key == 'A' ||  keyCode == LEFT) {
      player.moveLeft();
    }

    if (key == 'd' || key == 'D' ||  keyCode == RIGHT) {
      player.moveRight();
    }
  }
  if (GUI.getPauseMenu() && key == '+') {
    GUI.developerOptionsToggle();
  }



  if ((GUI.getDeveloperOptions())) {

    if ( key == 'p' || key == 'P') {
      player.speed++;
    }

    if ( key == 'h' || key == 'H') {
      player.jump++;
    }
    if (!GUI.getPauseMenu()) {
      if ( key == 'l' || key == 'L') {
        if (levelSelect == -1) {
          levelSelect = 0;
        } else {
          levelSelect = -1;
        }
      }
    }
  }
}



public void mousePressed() {

  println("Mouse is at x: " + mouseX);
  println("Mouse is at y: " + mouseY);
  println();
  GUI.setMouseValues(mouseX, mouseY);
  GUI.checkClick();
  for (aPowerup pow : powerups) {
    if (pow.getType() == "projectile" && pow.activatedPowerup == true) {
      pow.projectileTimer = 0;
      pow.setProjectileAngle(mouseX, mouseY);
      pow.projectileMove = true;
      break;
    }
  }
}//end mousePressed
