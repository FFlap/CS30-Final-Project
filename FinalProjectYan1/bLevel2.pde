void level2() {


  if (level == 2) {




    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 50;
      player.boxY = 640;
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

    ArrayList<aPlatform> platforms = new ArrayList<aPlatform>();


    platforms.add(new aPlatform(450, 580, 120, 30, 7, 128));
    platforms.add(new aPlatform(40, 480, 120, 30, 8, 128));
    platforms.add(new aPlatform(220, 330, 120, 30, 9, 128));


    for (aPlatform plat : platforms) {
      plat.display();
    }


    //Powerup
    aPowerup highJump = new aPowerup("highJump", 500,560, false);
    highJump.display();
    
    //End
    aObject end = new aObject("podium", 260,321);
    end.display();
  }
}
