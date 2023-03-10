JSONObject json;
File data;
PImage titleImage, endImage, comingImage, world1;
//global variables


//Player
aPlayer player = new aPlayer(335, 640, 15, 20, 10);

ArrayList<aPlatform> platforms = new ArrayList<aPlatform>();
ArrayList<aObject> objects = new ArrayList<aObject>();
ArrayList<aPowerup> powerups = new ArrayList<aPowerup>();


//Previous Variables
float boxX, boxY, jump, jumpheight, boxsize;
boolean moveleft, moveright, platform, jumpboolean, landed, higherjump, higherjump2, projectilemove = false;
boolean levelkeycheck;
float check;

//Current Preset GUI Variables

aGUI GUI = new aGUI(true, false, false );

//Previous GUI Variables
int levelUnlocked = 0;
boolean pauseMenu = false;
boolean developerOptions = false;
boolean ToolTip = true;


//Projectile
boolean projectilePowercheck;
int projectileTargetCheck;
float projectileX, projectileY, projectileMouseX, projectileMouseY, projectileSpeedX, projectileSpeedY, projectileangle, projectileTimer;
int projectilesize = 20;
float projectileSpeed = 6;


float platformstart = 120;
float platformMove = 1;
float platformstart2 = 120;
float platformMove2 = 1;
float platformstart3 = 300;
float platformMove3 = 1;

float platformStart192 = -150;
float platformStart193 = -450;
float platformStart194 = -750;
float platformStart195 = -1100;
float platformStart196 = -1350;

float platformStart197 = 700;
float platformStart198 = 660;
float platformStart1910 = 1010;
float platformStart199 = -600;
float platformStart1911 = -850;
float platformStart1912 = -1000;
float platformStart1913 = -1250;
float platformStart1914 = -1500;
float platformStart1915 = -750;

float platformStart1916 = 900;

int wave = 1;
int timer = 0;
int glassespower = 0;
int level = 0;
int levelSelect = 0;
float levelTimer = 0;


void setup() {
  size(700, 700);

  data = new File(dataPath("data/data.json"));

  json = loadJSONObject("data/data.json");
  levelUnlocked = json.getInt("levelUnlocked");
  titleImage = loadImage("title.png");
  endImage = loadImage("end.png");
  comingImage = loadImage("coming.png");
  world1 = loadImage("world1.png");
}
void draw() {
  background(0);


  //Box
  player.display();

  //player.data();

  //Ground
  aPlatform ground = new aPlatform(-40, 660, 740, 45, 1, #32CD32);
  ground.display();

  //Starting Screen
  level0();


  // Levels


  level1();
  level2();
    /*
   level3();
   level4();
   level5();
   level6();
   level7();
   level8();
   level9();
   level10();
   */

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



    if (( key == 'R' && glassespower >= 1)|| key == 'r' && glassespower >= 1) {
      if (glassespower == 2) {
        glassespower = 1;
      } else {
        glassespower = 2;
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
      player.maxJumpHeight++;
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
  projectileTimer = 0;
  println("Mouse is at x: " + mouseX);
  println("Mouse is at y: " + mouseY);
  println();
  GUI.setMouseValues(mouseX, mouseY);
  GUI.checkClick();




  if (projectilePowercheck == true) {

    projectilemove = true;
    projectileX = player.boxX;
    projectileY = player.boxY;
    projectileMouseX = mouseX;
    projectileMouseY = mouseY;
    projectileangle = atan2(projectileMouseY - projectileY, projectileMouseX - projectileX);
  }
}//end mousePressed
