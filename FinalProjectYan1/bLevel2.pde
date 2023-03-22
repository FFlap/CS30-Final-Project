void level2() {


  if (level == 2) {

    if (levelTimer == 0) {
     world.LevelReset();
      player.boxX = 50;
      player.boxY = 640;
      //Platforms
      platforms.add(new aPlatform(0,450, 580, 120, 30,128));
      platforms.add(new aPlatform(0,40, 480, 120, 30,128));
      platforms.add(new aPlatform(0,220, 330, 120, 30,128));
      //High Jump
      powerups.add(new aPowerup("highJump", 0,500, 560, 15));
      //End
      objects.add(new aObject("podium", 0,260, 321));
    }

    levelTimer++;

  

    //Platforms
    for (aPlatform plat : platforms) {
      if (plat.visibility == 0) { 
        plat.display();
      }
    }


    //Powerup
    for (aPowerup pow : powerups) {
      pow.display();
    }

    //Objects
    for (aObject obj : objects) {
      if (obj.visibility == 0) { 
        obj.display();
      }
    }
  }
}
