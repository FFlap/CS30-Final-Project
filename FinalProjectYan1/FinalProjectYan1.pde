//global variables
JSONObject json;
File data;
ArrayList<aPlayer> players = new ArrayList<aPlayer>();
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
  players.add(new aPlayer(0, 100, 100, 20, 20, 10, 10));
}
void draw() {
  background(0);

  players.get(0).data();



  // Levels
  world.load();
  world.display();
  world.checkTimer();

  //GUI
  GUI.displayToolTip();
  GUI.displayPauseMenu();
  GUI.displayButtons();
  GUI.displayDeveloperButtons();
}


public void keyReleased() {


  if (  key == 'a' || key == 'A' || keyCode == LEFT) {
    for (aPlayer player : players) {
      player.stopLeft();
    }
  }

  if ( key == 'd' || key == 'D' || keyCode == RIGHT) {
    for (aPlayer player : players) {
      player.stopRight();
    }
  }

  if (key == 's' || key == 'S' || keyCode == DOWN) {
    for (aPlayer player : players) {
      if (player.ladder) {
        player.stopDown();
      }
    }
  }

  if (key == 'w' || key == 'W' || keyCode == UP || key == ' ') {
    for (aPlayer player : players) {
      if (player.ladder) {
        player.stopUp();
      }
    }
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
        if (pow.getType() == "glasses" && pow.activatedPowerup) {
          pow.glassesPowerupToggle();
          break;
        }
      }
    }


    // Movement
    if (key == 'w' || key == 'W' || keyCode == UP || key == ' ') {
      for (aPlayer player : players) {
        if (player.ladder) {
          player.moveUp();
        } else {
          player.jump();
        }
      }
    }

    if (key == 'a' || key == 'A' || keyCode == LEFT) {
      for (aPlayer player : players) {
        player.moveLeft();
      }
    }

    if (key == 'd' || key == 'D' || keyCode == RIGHT) {
      for (aPlayer player : players) {
        player.moveRight();
      }
    }

    if (key == 's' || key == 'S' || keyCode == DOWN) {
      for (aPlayer player : players) {
        if (player.ladder) {
          player.moveDown();
        }
      }
    }
  }
  if (GUI.getPauseMenu() && key == '+') {
    GUI.developerOptionsToggle();
  }



  if ((GUI.getDeveloperOptions())) {
    for (aPlayer player : players) {
      if ( key == 'p' || key == 'P') {
        player.speed++;
      }

      if ( key == 'h' || key == 'H') {
        player.jump++;
      }
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
