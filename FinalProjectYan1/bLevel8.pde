



void level8() {

  if (level == 8) {

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
      player.boxY = 640;
      platforms.add(new aPlatform(0, 120, 380, 580, 200, 50, #008080));
      platforms.add(new aPlatform(0, 220, 380, 490, 200, 50, #008080));
      platforms.add(new aPlatform(0, 320, 380, 400, 200, 50, #008080));
      platforms.add(new aPlatform(0, 80, 380, 400, 200, 50, #008080));
      platforms.add(new aPlatform(0, 80, 380, 260, 200, 50, #008080));
      objects.add(new aObject("podium", 0, 335, 253));
    }

    levelTimer++;
    //Platforms

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
      pow.display();
    }
  }
}
