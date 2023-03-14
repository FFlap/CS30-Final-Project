public void level0() {



  if (level == -1) {
 //Border
    if ( player. boxX >= 680 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopRight();
      player.boxX = 680;
    }

    if ( player. boxX <= 0 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopLeft();
      player.boxX = 0;
    }

    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 335;
      player.boxY = 640;
      
      platforms.add(new aPlatform(0, 300, 560, 300, 60, 128));
      platforms.add(new aPlatform(0, 400, 360, 60, 200,128));
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
