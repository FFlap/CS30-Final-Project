void level2() {


  if (level == 2) {




    if (levelTimer == 0) {
      LevelReset();
      boxX = 50;
      boxY = 640;
    }

    levelTimer++;

    //Border
    if ( boxX >= 680 && boxY >= -10 && boxY < 700) {
      moveright = false;
      boxX = 680;
    }

    if ( boxX <= 0 && boxY >= -10 && boxY < 700) {
      moveleft = false;
      boxX = 0;
    }


    //Platform 1 Level 2


    int[] platform116 = {450, 580, 120, 30, 7};
    fill(128, 128, 128);
    rect(platform116[0], platform116[1], platform116[2], platform116[3]);


    if (boxY <= (platform116[1] + boxsize)  && boxY >= (platform116[1] - boxsize) && boxX > (platform116[0] - boxsize) && boxX < (platform116[0] + platform116[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform116[4];
      boxY =  (platform116[1] - boxsize);
    }

    if (boxY <= (platform116[1] + platform116[3] - boxsize) && boxY >= (platform116[1] - boxsize) && boxX >= (platform116[0] - boxsize) && boxX <= (platform116[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform116[0] - boxsize);
    }

    if (boxY <= (platform116[1] + platform116[3] - boxsize) && boxY >= (platform116[1] - boxsize) && boxX <= (platform116[0] + platform116[2]) && boxX >= (platform116[0] + (platform116[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform116[0] + (platform116[2]));
    }



    if (boxY <= (platform116[1] +  platform116[3]) && boxY >= (platform116[1] + boxsize)  && boxX > (platform116[0] - boxsize) && boxX < (platform116[0] + platform116[2])) {
      jump = -7;
    }

    if ( boxX >= (platform116[0] + platform116[2]) && check == platform116[4]|| boxX <= (platform116[0] - boxsize) && check == platform116[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    //Platform 2 Level 2


    int[] platform117 = {40, 480, 120, 30, 8};
    fill(128, 128, 128);
    rect(platform117[0], platform117[1], platform117[2], platform117[3]);


    if (boxY <= (platform117[1] + boxsize)  && boxY >= (platform117[1] - boxsize) && boxX > (platform117[0] - boxsize) && boxX < (platform117[0] + platform117[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform117[4];
      boxY =  (platform117[1] - boxsize);
    }

    if (boxY <= (platform117[1] + platform117[3] - boxsize) && boxY >= (platform117[1] - boxsize) && boxX >= (platform117[0] - boxsize) && boxX <= (platform117[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform117[0] - boxsize);
    }

    if (boxY <= (platform117[1] + platform117[3] - boxsize) && boxY >= (platform117[1] - boxsize) && boxX <= (platform117[0] + platform117[2]) && boxX >= (platform117[0] + (platform117[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform117[0] + (platform117[2]));
    }



    if (boxY <= (platform117[1] +  platform117[3]) && boxY >= (platform117[1] + boxsize)  && boxX > (platform117[0] - boxsize) && boxX < (platform117[0] + platform117[2])) {
      jump = -7;
    }

    if ( boxX >= (platform117[0] + platform117[2]) && check == platform117[4]|| boxX <= (platform117[0] - boxsize) && check == platform117[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    //Platform 3 Level 2


    int[] platform118 = {220, 330, 120, 30, 9};
    fill(128, 128, 128);
    rect(platform118[0], platform118[1], platform118[2], platform118[3]);


    if (boxY <= (platform118[1] + boxsize)  && boxY >= (platform118[1] - boxsize) && boxX > (platform118[0] - boxsize) && boxX < (platform118[0] + platform118[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform118[4];
      boxY =  (platform118[1] - boxsize);
    }

    if (boxY <= (platform118[1] + platform118[3] - boxsize) && boxY >= (platform118[1] - boxsize) && boxX >= (platform118[0] - boxsize) && boxX <= (platform118[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform118[0] - boxsize);
    }

    if (boxY <= (platform118[1] + platform118[3] - boxsize) && boxY >= (platform118[1] - boxsize) && boxX <= (platform118[0] + platform118[2]) && boxX >= (platform118[0] + (platform118[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform118[0] + (platform118[2]));
    }



    if (boxY <= (platform118[1] +  platform118[3]) && boxY >= (platform118[1] + boxsize)  && boxX > (platform118[0] - boxsize) && boxX < (platform118[0] + platform118[2])) {
      jump = -7;
    }

    if ( boxX >= (platform118[0] + platform118[2]) && check == platform118[4]|| boxX <= (platform118[0] - boxsize) && check == platform118[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }


    //Powerup
    if (higherjump ==  false) {
      fill(255, 0, 0);
      rect(500, 560, 20, 20);
    }

    if (higherjump == false && boxX >= 485 && boxX <= 515 && boxY <= 580 && boxY >= 550) {
      higherjump = true;
    }

    if (higherjump == true) {
      jumpheight = 21;
    }

    //End
    fill(218, 165, 32);
    rect(260, 321, 35, 9);
    if (boxY <= 330 && boxY >= 310 && boxX >= 245 && boxX <= 295 && level == 2) {
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
