void level6() {

  if (level == 6) {




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
      jump = 15;
      player.boxX = 10;
      player.boxY = 130;
      powerups.add(new aPowerup("levelUnlock", 480, 95));

      objects.add(new aObject("deathZone", 150, 329, 230, 150));
      objects.add(new aObject("deathZone", 0, 460, 400, 20));
      objects.add(new aObject("deathZone", 375, 0, 40, 480));
      tempObjects.add(new aObject("jumpBoost", 90, 441, 15));
      tempObjects.add(new aObject("jumpBoost", 325, 291, 15));
      tempObjects.add(new aObject("podium", 180, 142));
      tempPlatforms.add(new aPlatform(140, 300, 280, 150, #008080));
      tempPlatforms.add(new aPlatform(0, 450, 416, 50, #008080));

      objects.add(new aObject("jumpBoost", 660, 482, 20));


      platforms.add(new aPlatform(-5, 150, 260, 50, #008080));
      platforms.add(new aPlatform(415, 0, 30, 660, #008080));
      platforms.add(new aPlatform(440, 560, 50, 40, #008080));
      platforms.add(new aPlatform(530, 490, 180, 40, #008080));
      platforms.add(new aPlatform(440, 150, 100, 40, #008080));
      platforms.add(new aPlatform(0, 479, 416, 181, #008080));
    }

    levelTimer++;




    //Vertical Portal Blue
    int[] portal131 = {690, 530, 10, 60};
    fill(255, 154, 0);
    rect(portal131[0], portal131[1], portal131[2], portal131[3]);
    fill(255);
    rect(portal131[0], (portal131[1] + 5), (portal131[2] - 5), (portal131[3] - 10));
    if (boxY <= (portal131[1] + 60)  && boxY >= (portal131[1] - 5) && boxX > (portal131[0] - 20) && boxX < (portal131[0] + 20)) {
      check = 999;
      boxX = 20;
      boxY = 420;
    }
    //Vertical Portal Orange
    int[] portal132 = {0, 372, 10, 60};
    fill(0, 101, 255);
    rect(portal132[0], portal132[1], portal132[2], portal132[3]);
    fill(255);
    rect(portal132[0] + 5, (portal132[1] + 5), (portal132[2] - 5), (portal132[3] - 10));
    if (boxY <= (portal132[1] + 60)  && boxY >= (portal132[1] - 5) && boxX > (portal132[0] - 20) && boxX < (portal132[0] + 20)) {
      check = 999;
      boxX = 580;
      boxY = 610;
    }




    //Platforms

    for (aPlatform plat : platforms) {
      plat.display();
    }
    //Objects
    for (aObject obj : objects) {
      obj.display();
    }

    //Powerup
    for (aPowerup pow : powerups) {
      pow.display();
    }
  }
}
