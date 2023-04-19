//global variables
JSONObject json;
JSONArray saveData;

ArrayList<aPlayer> players = new ArrayList<aPlayer>();
ArrayList<aEnemy> enemies = new ArrayList<aEnemy>();
ArrayList<aPlatform> platforms = new ArrayList<aPlatform>();
ArrayList<aObject> objects = new ArrayList<aObject>();
ArrayList<aPowerup> powerups = new ArrayList<aPowerup>();
ArrayList<aProjectile> projectiles = new ArrayList<aProjectile>();

aWorld world = new aWorld();

//Current Preset GUI Variables
aGUI GUI = new aGUI(true, false, false );

//Previous Variables

int levelSelect = 0;


void setup() {
  size(700, 700);
  GUI.load();
}
void draw() {
  background(0);
  //players.get(0).data();
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

  if (key == 'w' || key == 'W' || keyCode == UP || key == ' ') {
    world.jumpStat++;
    for (aPlayer player : players) {
      player.stopUp();
    }
  }

  if (  key == 'a' || key == 'A' || keyCode == LEFT) {
    world.leftStat++;
    for (aPlayer player : players) {
      player.stopLeft();
    }
  }


  if (key == 's' || key == 'S' || keyCode == DOWN) {
    for (aPlayer player : players) {
      player.stopDown();
    }
  }

  if ( key == 'd' || key == 'D' || keyCode == RIGHT) {
    world.rightStat++;
    for (aPlayer player : players) {
      player.stopRight();
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

    // Movement
    if (key == 'w' || key == 'W' || keyCode == UP || key == ' ') {
      for (aPlayer player : players) {
        if (player.getLadder()) {
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

    if (key == 's' || key == 'S' || keyCode == DOWN) {
      for (aPlayer player : players) {
        if (player.getLadder()) {
          player.moveDown();
        }
      }
    }

    if (key == 'd' || key == 'D' || keyCode == RIGHT) {
      for (aPlayer player : players) {
        player.moveRight();
      }
    }




    if ( key == 'R' || key == 'r') {
      for (aPowerup pow : powerups) {
        if (pow.getType() == "glasses" && pow.activatedPowerup) {
          pow.glassesPowerupToggle();
          break;
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
      projectiles.add(new aProjectile("player", 0, players.get(0).getX(), players.get(0).getY(), 20, 20));
      for (aProjectile projectile : projectiles) {
        projectile.targetMouse(mouseX, mouseY);
      }
      break;
    }
  }
}//end mousePressed
