
void level1() {

  if (level == 1) {
    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 50;
      player.boxY = 640;
    }

    levelTimer++;

    //Border
    if (  player.boxX >= 680 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopRight();
      player.boxX = 680;
    }

    if (  player.boxX <= 0 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopLeft();
      player.boxX = 0;
    }


    //Platforms

    ArrayList<aPlatform> platforms = new ArrayList<aPlatform>();
    platforms.add(new aPlatform(140, 600, 100, 60, 2, 128));
    platforms.add(new aPlatform(450, 580, 120, 30, 3, 128));
    platforms.add(new aPlatform(590, 500, 120, 30, 4, 128));
    platforms.add(new aPlatform(500, 450, 30, 30, 5, 128));
    platforms.add(new aPlatform(415, 400, 30, 30, 6, 128));


    for (aPlatform plat : platforms) {
      plat.display();
    }

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



    //Death Zone
    aObject object = new aObject("deathZone", 240, 655, 87, 5);
   object.display();



    //Portals
    fill(0, 101, 255);
    rect(327, 553, 10, 60);
    fill(255);
    rect(327, 558, 5, 50);
    if (player.boxY <= 612 && player.boxY >= 545 && player.boxX > 326 && player.boxX < 358) {
      player.boxX = 550;
      player.boxY = 645;
    }

    fill(255, 154, 0);
    rect(481, 660, 60, 10);
    fill(255);
    rect(486, 660, 50, 5);

    if (player.boxY <= 669 && player.boxY >= 640 && player.boxX >= 480 && player.boxX <= 540) {
      player.boxX = 170;
      player.boxY = 580;
    }




    //End
    fill(218, 165, 32);
    rect(327, 351, 35, 9);
    if (player.boxY < 350 && player.boxX >= 350 && player.boxX <= 360 && level == 1) {
      level++;
      levelTimer = 0;
      if (level >= levelUnlocked) {
        json = new JSONObject();
        json.setInt("levelUnlocked", level);
        saveJSONObject(json, "data/data.json");
      }
    }
  }
}
