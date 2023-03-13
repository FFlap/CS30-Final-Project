void level4() {
  if (level == 4) {

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
      player.boxX = 50;
      player.boxY = 640;
      platforms.add(new aPlatform(-1, 90, 260, 40,#008080));
      platforms.add(new aPlatform(-1, 433, 200, 40, #008080));
      platforms.add(new aPlatform(450, 610, 150, 50, #008080));
      platforms.add(new aPlatform(560, 450, 150, 40,  #008080));
      platforms.add(new aPlatform(330, 330, 150, 40,#008080));
      powerups.add(new aPowerup("highJump", 170, 413, 5));
      powerups.add(new aPowerup("highJump", 350, 310, 6));
      objects.add(new aObject("deathZone", 600, 655, 100, 5));
      objects.add(new aObject("deathZone", 300, 655, 150, 5));
      objects.add(new aObject("podium", 50, 82));
    }

    levelTimer++;
  

  //Vertical Portal Blue
  int[] portal131 = {690, 530, 10, 60};
  fill(0, 101, 255);
  rect(portal131[0], portal131[1], portal131[2], portal131[3]);
  fill(255);
  rect(portal131[0], (portal131[1] + 5), (portal131[2] - 5), (portal131[3] - 10));
  if (boxY <= (portal131[1] + 60)  && boxY >= (portal131[1] - 5) && boxX > (portal131[0] - 20) && boxX < (portal131[0] + 20)) {
    boxX = 20;
    boxY = 420;
  }
  //Vertical Portal Orange
  int[] portal132 = {0, 372, 10, 60};
  fill(255, 154, 0);
  rect(portal132[0], portal132[1], portal132[2], portal132[3]);
  fill(255);
  rect(portal132[0] + 5, (portal132[1] + 5), (portal132[2] - 5), (portal132[3] - 10));
  if (boxY <= (portal132[1] + 60)  && boxY >= (portal132[1] - 5) && boxX > (portal132[0] - 20) && boxX < (portal132[0] + 20)) {
    boxX = 580;
    boxY = 610;
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


  //End of Level
}
}
