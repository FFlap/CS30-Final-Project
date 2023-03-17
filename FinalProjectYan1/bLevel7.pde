void level7() {

  if (level == 7) {




    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 330;
      player.boxY = 640;
      powerups.add(new aPowerup("projectile", 1, 345, 562, 6));


      //Check 1
      platforms.add(new aPlatform(1, 230, 380, 260, 30, #008080));
      platforms.add(new aPlatform(1, 558, 325, 100, 40, #008080));
      platforms.add(new aPlatform(1, 280, 160, 150, 40, #008080));

      objects.add(new aObject("projectileTarget", 0, 280, 190, 150, 40));
      objects.add(new aObject("podium", 1, 335, 151));



      //Check 2
      platforms.add(new aPlatform(2, 280, 480, 100, 40, #B7060B));
      platforms.add(new aPlatform(2, 461, 240, 100, 40, #B7060B));
      platforms.add(new aPlatform(0, 230, 580, 260, 30, #008080));
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
