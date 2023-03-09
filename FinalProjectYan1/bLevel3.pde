void level3() {
  if (level == 3) {





    if (levelTimer == 0) {
      LevelReset();
      boxX = 330;
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
    /*
 Array Meaning: 
     0 = x-coordinate of the rectangle
     1 = y-coordinate of the rectangle
     2 = width of the rectangle
     3 = height of the rectangle
     4 = platform number
     */
    //Platform 1 of 1-3
    int[] platform131 = {230, 570, 100, 40, 9};
    fill(0, 128, 128);
    rect(platform131[0], platform131[1], platform131[2], platform131[3]);


    if (boxY <= (platform131[1] + boxsize)  && boxY >= (platform131[1] - boxsize) && boxX > (platform131[0] - boxsize) && boxX < (platform131[0] + platform131[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform131[4];
      boxY =  (platform131[1] - boxsize);
    }

    if (boxY <= (platform131[1] + platform131[3] - boxsize) && boxY >= (platform131[1] - boxsize) && boxX >= (platform131[0] - boxsize) && boxX <= (platform131[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform131[0] - boxsize);
    }

    if (boxY <= (platform131[1] + platform131[3] - boxsize) && boxY >= (platform131[1] - boxsize) && boxX <= (platform131[0] + platform131[2]) && boxX >= (platform131[0] + (platform131[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform131[0] + (platform131[2]));
    }



    if (boxY <= (platform131[1] +  platform131[3]) && boxY >= (platform131[1] + boxsize)  && boxX > (platform131[0] - boxsize) && boxX < (platform131[0] + platform131[2])) {
      jump = -7;
    }


    if ( boxX >= (platform131[0] + platform131[2]) && check == platform131[4]|| boxX <= (platform131[0] - boxsize) && check == platform131[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    //Platform 2 of 1-3
    int[] platform132 = {380, 500, 120, 40, 10};
    fill(0, 128, 128);
    rect(platform132[0], platform132[1], platform132[2], platform132[3]);


    if (boxY <= (platform132[1] + boxsize)  && boxY >= (platform132[1] - boxsize) && boxX > (platform132[0] - boxsize) && boxX < (platform132[0] + platform132[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform132[4];
      boxY =  (platform132[1] - boxsize);
    }

    if (boxY <= (platform132[1] + platform132[3] - boxsize) && boxY >= (platform132[1] - boxsize) && boxX >= (platform132[0] - boxsize) && boxX <= (platform132[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform132[0] - boxsize);
    }

    if (boxY <= (platform132[1] + platform132[3] - boxsize) && boxY >= (platform132[1] - boxsize) && boxX <= (platform132[0] + platform132[2]) && boxX >= (platform132[0] + (platform132[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform132[0] + (platform132[2]));
    }



    if (boxY <= (platform132[1] +  platform132[3]) && boxY >= (platform132[1] + boxsize)  && boxX > (platform132[0] - boxsize) && boxX < (platform132[0] + platform132[2])) {
      jump = -5;
    }


    if ( boxX >= (platform132[0] + platform132[2]) && check == platform132[4]|| boxX <= (platform132[0] - boxsize) && check == platform132[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    //Platform 3 of 1-3
    int[] platform133 = {270, 400, 120, 40, 11};
    fill(0, 128, 128);
    rect(platform133[0], platform133[1], platform133[2], platform133[3]);


    if (boxY <= (platform133[1] + boxsize)  && boxY >= (platform133[1] - boxsize) && boxX > (platform133[0] - boxsize) && boxX < (platform133[0] + platform133[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform133[4];
      boxY =  (platform133[1] - boxsize);
    }

    if (boxY <= (platform133[1] + platform133[3] - boxsize) && boxY >= (platform133[1] - boxsize) && boxX >= (platform133[0] - boxsize) && boxX <= (platform133[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform133[0] - boxsize);
    }

    if (boxY <= (platform133[1] + platform133[3] - boxsize) && boxY >= (platform133[1] - boxsize) && boxX <= (platform133[0] + platform133[2]) && boxX >= (platform133[0] + (platform133[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform133[0] + (platform133[2]));
    }



    if (boxY <= (platform133[1] +  platform133[3]) && boxY >= (platform133[1] + boxsize)  && boxX > (platform133[0] - boxsize) && boxX < (platform133[0] + platform133[2])) {
      jump = -7;
    }


    if ( boxX >= (platform133[0] + platform133[2]) && check == platform133[4]|| boxX <= (platform133[0] - boxsize) && check == platform133[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 
    //Platform 4 of 1-3
    int[] platform134 = {-1, 516, 120, 40, 12};
    fill(0, 128, 128);
    rect(platform134[0], platform134[1], platform134[2], platform134[3]);


    if (boxY <= (platform134[1] + boxsize)  && boxY >= (platform134[1] - boxsize) && boxX > (platform134[0] - boxsize) && boxX < (platform134[0] + platform134[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform134[4];
      boxY =  (platform134[1] - boxsize);
    }

    if (boxY <= (platform134[1] + platform134[3] - boxsize) && boxY >= (platform134[1] - boxsize) && boxX >= (platform134[0] - boxsize) && boxX <= (platform134[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform134[0] - boxsize);
    }

    if (boxY <= (platform134[1] + platform134[3] - boxsize) && boxY >= (platform134[1] - boxsize) && boxX <= (platform134[0] + platform134[2]) && boxX >= (platform134[0] + (platform134[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform134[0] + (platform134[2]));
    }



    if (boxY <= (platform134[1] +  platform134[3]) && boxY >= (platform134[1] + boxsize)  && boxX > (platform134[0] - boxsize) && boxX < (platform134[0] + platform134[2])) {
      jump = -7;
    }


    if ( boxX >= (platform134[0] + platform134[2]) && check == platform134[4]|| boxX <= (platform134[0] - boxsize) && check == platform134[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    int[] platform135 = {-1, 220, 120, 40, 12};
    fill(0, 128, 128);
    rect(platform135[0], platform135[1], platform135[2], platform135[3]);


    if (boxY <= (platform135[1] + boxsize)  && boxY >= (platform135[1] - boxsize) && boxX > (platform135[0] - boxsize) && boxX < (platform135[0] + platform135[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform135[4];
      boxY =  (platform135[1] - boxsize);
    }

    if (boxY <= (platform135[1] + platform135[3] - boxsize) && boxY >= (platform135[1] - boxsize) && boxX >= (platform135[0] - boxsize) && boxX <= (platform135[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform135[0] - boxsize);
    }

    if (boxY <= (platform135[1] + platform135[3] - boxsize) && boxY >= (platform135[1] - boxsize) && boxX <= (platform135[0] + platform135[2]) && boxX >= (platform135[0] + (platform135[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform135[0] + (platform135[2]));
    }



    if (boxY <= (platform135[1] +  platform135[3]) && boxY >= (platform135[1] + boxsize)  && boxX > (platform135[0] - boxsize) && boxX < (platform135[0] + platform135[2])) {
      jump = -7;
    }


    if ( boxX >= (platform135[0] + platform135[2]) && check == platform135[4]|| boxX <= (platform135[0] - boxsize) && check == platform135[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    int[] platform136 = {119, 70, 150, 40, 13};
    fill(0, 128, 128);
    rect(platform136[0], platform136[1], platform136[2], platform136[3]);


    if (boxY <= (platform136[1] + boxsize)  && boxY >= (platform136[1] - boxsize) && boxX > (platform136[0] - boxsize) && boxX < (platform136[0] + platform136[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform136[4];
      boxY =  (platform136[1] - boxsize);
    }

    if (boxY <= (platform136[1] + platform136[3] - boxsize) && boxY >= (platform136[1] - boxsize) && boxX >= (platform136[0] - boxsize) && boxX <= (platform136[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform136[0] - boxsize);
    }

    if (boxY <= (platform136[1] + platform136[3] - boxsize) && boxY >= (platform136[1] - boxsize) && boxX <= (platform136[0] + platform136[2]) && boxX >= (platform136[0] + (platform136[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform136[0] + (platform136[2]));
    }



    if (boxY <= (platform136[1] +  platform136[3]) && boxY >= (platform136[1] + boxsize)  && boxX > (platform136[0] - boxsize) && boxX < (platform136[0] + platform136[2])) {
      jump = -7;
    }


    if ( boxX >= (platform136[0] + platform136[2]) && check == platform136[4]|| boxX <= (platform136[0] - boxsize) && check == platform136[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    int[] platform137 = {119, 110, 50, 150, 14};
    fill(#CBC921);
    rect(platform137[0], platform137[1], platform137[2], platform137[3]);


    if (boxY <= (platform137[1] + boxsize)  && boxY >= (platform137[1] - boxsize) && boxX > (platform137[0] - boxsize) && boxX < (platform137[0] + platform137[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform137[4];
      boxY =  (platform137[1] - boxsize);
    }

    if (boxY <= (platform137[1] + platform137[3] - boxsize) && boxY >= (platform137[1] - boxsize) && boxX >= (platform137[0] - boxsize) && boxX <= (platform137[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform137[0] - boxsize);
    }

    if (boxY <= (platform137[1] + platform137[3] - boxsize) && boxY >= (platform137[1] - boxsize) && boxX <= (platform137[0] + platform137[2]) && boxX >= (platform137[0] + (platform137[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform137[0] + (platform137[2]));
    }



    if (boxY <= (platform137[1] +  platform137[3]) && boxY >= (platform137[1] + boxsize)  && boxX > (platform137[0] - boxsize) && boxX < (platform137[0] + platform137[2])) {
      jump = -7;
    }


    if ( boxX >= (platform137[0] + platform137[2]) && check == platform137[4]|| boxX <= (platform137[0] - boxsize) && check == platform137[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    }

    //High Jump Powerup
    /*
 Array Meaning: 
     0 = x-coordinate of the rectangle
     1 = y-coordinate of the rectangle
     2 = length and width of the rectangle
     3 = set jump height for player
     */
    int[] highjumpower = {45, 496, 20, 20};
    if (higherjump ==  false) {
      fill(255, 0, 0);
      rect(highjumpower[0], highjumpower[1], highjumpower[2], highjumpower[2]);
    }

    if (higherjump == false && boxX >= (highjumpower[0] - boxsize)  && boxX <= (highjumpower[0] + boxsize) && boxY <= (highjumpower[1] + boxsize)  && boxY >= (highjumpower[1] - boxsize)) {
      higherjump = true;
    }

    if (higherjump == true) {
      jumpheight = highjumpower[3];
    }

    //Portals
    //Vertical Portal Blue
    int[] portal131 = {690, 600, 10, 60};
    fill(0, 101, 255);
    rect(portal131[0], portal131[1], portal131[2], portal131[3]);
    fill(255);
    rect(portal131[0], (portal131[1] + 5), (portal131[2] - 5), (portal131[3] - 10));
    if (boxY <= (portal131[1] + 60)  && boxY >= (portal131[1] - 5) && boxX > (portal131[0] - 20) && boxX < (portal131[0] + 20)) {
      boxX = 70;
      boxY = 220;
    }
    //Horizontal Portal Orange
    int[] portal132 = {0, 220, 60, 10};
    fill(255, 154, 0);
    rect(portal132[0], portal132[1], portal132[2], portal132[3]);
    fill(255);
    rect(( portal132[0] + 5), portal132[1], ( portal132[2] - 10), ( portal132[3]  - 5));

    if (boxY <= (portal132[1] + 10) && boxY >= (portal132[1] - boxsize)  && boxX >= portal132[0] && boxX <= (portal132[0] + 60)) {
      boxX = 650;
      boxY = 640;
    }

    //End Platform
    /*
 Array Meaning: 
     0 = x-coordinate of the rectangle
     1 = y-coordinate of the rectangle
     2 = length of the rectangle
     3 = width of the rectangle
     4 = level number
     */
    int[] endplatform3 = {230, 62, 35, 9, 3};
    fill(218, 165, 32);
    rect(endplatform3[0], endplatform3[1], endplatform3[2], endplatform3[3]);
    if (boxY <= (endplatform3[1] + 20)  && boxY >= (endplatform3[1] - 20) && boxX >=  (endplatform3[0] - 20) && boxX <= (endplatform3[0] + 30) && level == endplatform3[4]) {
      level++;
      levelTimer = 0;
      if (level >= levelUnlocked) {
        json = new JSONObject();
        json.setInt("levelUnlocked", level);
        saveJSONObject(json, "data/data.json");
      }
    }



    //End of Level
  }
}
