void level2() {


  if (level == 2) {

    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 50;
      player.boxY = 640;
      //Platforms
      platforms.add(new aPlatform(450, 580, 120, 30,128));
      platforms.add(new aPlatform(40, 480, 120, 30,128));
      platforms.add(new aPlatform(220, 330, 120, 30,128));
      //High Jump
      powerups.add(new aPowerup("highJump", 500, 560, 15));
      //End
      objects.add(new aObject("podium", 260, 321));
    }

    levelTimer++;

    //Border
    if ( player. boxX >= 680 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopRight();
      player.boxX = 680;
    }

    if ( player. boxX <= 0 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopLeft();
      player.boxX = 0;
    }

    //Platforms
    for (aPlatform plat : platforms) {
      plat.display();
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
}
