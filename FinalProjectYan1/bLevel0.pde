public void level0() {



  if (level == -1) {


    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 335;
      player.boxY = 640;

      platforms.add(new aPlatform(0, 200, 400, 560, 300, 60,1, 128));
      platforms.add(new aPlatform(0, 400, 360, 60, 200, 128));
    }
    levelTimer++;

    for (aPlatform plat : platforms) {
      plat.display();
      plat.data();
    }


    //Powerup

    for (aPowerup pow : powerups) {
      pow.display();
    }

    //Objects
    for (aObject obj : objects) {
      obj.display();
    }
  }




  if (level == 0) {
    //Move Across Screen Left To Right & Right to Left
    if ( player.boxX > 695 && player.boxY >= -15 && player.boxY < 700) {
      player.boxX = -15;
    }

    if ( player.boxX < -15 && player.boxY >= -15 && player.boxY < 700) {
      player.boxX = 695;
    }

    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 335;
      player.boxY = 640;
    }
    levelTimer++;
  }
}
