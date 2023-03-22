public class aWorld {
  private int level, levelTimer;




  public void display() {

    levelTimer++;
    for (aPlatform plat : platforms) {
      if (plat.visibility == 0) {
        plat.display();
      }
    }
    //Objects
    for (aObject obj : objects) {
      if (obj.visibility == 0) {
        obj.display();
      }
    }

    //Powerup
    for (aPowerup pow : powerups) {
      if ( pow.visibility == 0) {
        pow.display();
      }
    }
  }


  public void setLevel(int levelNum, int spawnX, int spawnY) {
    level = levelNum;

    if (levelTimer == 0) {
      player.boxX = spawnX;
      player.boxY = spawnY;
      switch(levelNum) {
      case 1:
        LevelReset();
        player.boxX = 50;
        player.boxY = 640;
        //Platforms
        platforms.add(new aPlatform(0, 450, 580, 120, 30, 128));
        platforms.add(new aPlatform(0, 40, 480, 120, 30, 128));
        platforms.add(new aPlatform(0, 220, 330, 120, 30, 128));
        //High Jump
        powerups.add(new aPowerup("highJump", 0, 500, 560, 15));
        //End
        objects.add(new aObject("podium", 0, 260, 321));

        //Wall for Portal
        fill(128, 128, 128);
        rect(327, 350, 35, 310);

        if ( player.boxY <= 545 &&  player.boxY > 350 &&  player.boxX > 325 &&  player.boxX < 350) {
          player.stopRight();
          player.boxX = 307;
        }

        if ( player.boxY >= 615 &&  player.boxX > 325 &&  player.boxX < 340) {
          player.stopRight();
          player.boxX = 307;
        }

        if (player.boxY >= 350 && player.boxX > 340 && player.boxX <= 360) {
          player.stopLeft();
          player.boxX = 360;
        }
        break;

      case 2:

        break;

      default:

        break;
      }
    }
  }


  public void LevelReset() {
    platforms.clear();
    objects.clear();
    powerups.clear();
    player.reset();
    wave = 1;
    timer = 0;
    platformstart = 120;
    platformstart = 120;
    platformMove = 1;
    platformstart2 = 120;
    platformMove2 = 1;
    platformstart3 = 300;
    platformMove3 = 1;
    platformStart192 = -150;
    platformStart193 = -450;
    platformStart194 = -750;
    platformStart195 = -1100;
    platformStart196 = -1350;
    platformStart197 = 700;
    platformStart198 = 660;
    platformStart199 = -600;
    platformStart1910 = 1010;
    platformStart1911 = -850;
    platformStart1912 = -1000;
    platformStart1913 = -1250;
    platformStart1914 = -1500;
    platformStart1915 = -750;
    platformStart1916 = 900;
  }
}
