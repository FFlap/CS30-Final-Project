void level4() {
  if (level == 4) {




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
    /*
 Array Meaning: 
     0 = x-coordinate of the rectangle
     1 = y-coordinate of the rectangle
     2 = width of the rectangle
     3 = height of the rectangle
     4 = platform number
     */
    //Platform 1 of 1-4
    int[] platform141 = {-1, 90, 260, 40, 15};
    fill(0, 128, 128);
    rect(platform141[0], platform141[1], platform141[2], platform141[3]);


    if (boxY <= (platform141[1] + boxsize)  && boxY >= (platform141[1] - boxsize) && boxX > (platform141[0] - boxsize) && boxX < (platform141[0] + platform141[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform141[4];
      boxY =  (platform141[1] - boxsize);
    }

    if (boxY <= (platform141[1] + platform141[3] - boxsize) && boxY >= (platform141[1] - boxsize) && boxX >= (platform141[0] - boxsize) && boxX <= (platform141[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform141[0] - boxsize);
    }

    if (boxY <= (platform141[1] + platform141[3] - boxsize) && boxY >= (platform141[1] - boxsize) && boxX <= (platform141[0] + platform141[2]) && boxX >= (platform141[0] + (platform141[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform141[0] + (platform141[2]));
    }



    if (boxY <= (platform141[1] +  platform141[3]) && boxY >= (platform141[1] + boxsize)  && boxX > (platform141[0] - boxsize) && boxX < (platform141[0] + platform141[2])) {
      jump = -7;
    }


    if ( boxX >= (platform141[0] + platform141[2]) && check == platform141[4]|| boxX <= (platform141[0] - boxsize) && check == platform141[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    //Platform 2 of 1-4
    int[] platform142 = {-1, 433, 200, 40, 16};
    fill(0, 128, 128);
    rect(platform142[0], platform142[1], platform142[2], platform142[3]);


    if (boxY <= (platform142[1] + boxsize)  && boxY >= (platform142[1] - boxsize) && boxX > (platform142[0] - boxsize) && boxX < (platform142[0] + platform142[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform142[4];
      boxY =  (platform142[1] - boxsize);
    }

    if (boxY <= (platform142[1] + platform142[3] - boxsize) && boxY >= (platform142[1] - boxsize) && boxX >= (platform142[0] - boxsize) && boxX <= (platform142[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform142[0] - boxsize);
    }

    if (boxY <= (platform142[1] + platform142[3] - boxsize) && boxY >= (platform142[1] - boxsize) && boxX <= (platform142[0] + platform142[2]) && boxX >= (platform142[0] + (platform142[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform142[0] + (platform142[2]));
    }



    if (boxY <= (platform142[1] +  platform142[3]) && boxY >= (platform142[1] + boxsize)  && boxX > (platform142[0] - boxsize) && boxX < (platform142[0] + platform142[2])) {
      jump = -7;
    }


    if ( boxX >= (platform142[0] + platform142[2]) && check == platform142[4]|| boxX <= (platform142[0] - boxsize) && check == platform142[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    //Platform 3 of 1-4
    int[] platform143 = {450, 610, 150, 50, 17};
    fill(0, 128, 128);
    rect(platform143[0], platform143[1], platform143[2], platform143[3]);


    if (boxY <= (platform143[1] + boxsize)  && boxY >= (platform143[1] - boxsize) && boxX > (platform143[0] - boxsize) && boxX < (platform143[0] + platform143[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform143[4];
      boxY =  (platform143[1] - boxsize);
    }

    if (boxY <= (platform143[1] + platform143[3] - boxsize) && boxY >= (platform143[1] - boxsize) && boxX >= (platform143[0] - boxsize) && boxX <= (platform143[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform143[0] - boxsize);
    }

    if (boxY <= (platform143[1] + platform143[3] - boxsize) && boxY >= (platform143[1] - boxsize) && boxX <= (platform143[0] + platform143[2]) && boxX >= (platform143[0] + (platform143[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform143[0] + (platform143[2]));
    }



    if (boxY <= (platform143[1] +  platform143[3]) && boxY >= (platform143[1] + boxsize)  && boxX > (platform143[0] - boxsize) && boxX < (platform143[0] + platform143[2])) {
      jump = -7;
    }


    if ( boxX >= (platform143[0] + platform143[2]) && check == platform143[4]|| boxX <= (platform143[0] - boxsize) && check == platform143[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    } 

    //Platform 4 of 1-4
    int[] platform144 = {560, 450, 150, 40, 18};
    fill(0, 128, 128);
    rect(platform144[0], platform144[1], platform144[2], platform144[3]);


    if (boxY <= (platform144[1] + boxsize)  && boxY >= (platform144[1] - boxsize) && boxX > (platform144[0] - boxsize) && boxX < (platform144[0] + platform144[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform144[4];
      boxY =  (platform144[1] - boxsize);
    }

    if (boxY <= (platform144[1] + platform144[3] - boxsize) && boxY >= (platform144[1] - boxsize) && boxX >= (platform144[0] - boxsize) && boxX <= (platform144[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform144[0] - boxsize);
    }

    if (boxY <= (platform144[1] + platform144[3] - boxsize) && boxY >= (platform144[1] - boxsize) && boxX <= (platform144[0] + platform144[2]) && boxX >= (platform144[0] + (platform144[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform144[0] + (platform144[2]));
    }



    if (boxY <= (platform144[1] +  platform144[3]) && boxY >= (platform144[1] + boxsize)  && boxX > (platform144[0] - boxsize) && boxX < (platform144[0] + platform144[2])) {
      jump = -7;
    }


    if ( boxX >= (platform144[0] + platform144[2]) && check == platform144[4]|| boxX <= (platform144[0] - boxsize) && check == platform144[4]) {
      //println("off platform");
      jump = -7;
      jumpboolean = true;
    }

    //Platform 5 of 1-4
    int[] platform145 = {330, 330, 150, 40, 19};
    fill(0, 128, 128);
    rect(platform145[0], platform145[1], platform145[2], platform145[3]);


    if (boxY <= (platform145[1] + boxsize)  && boxY >= (platform145[1] - boxsize) && boxX > (platform145[0] - boxsize) && boxX < (platform145[0] + platform145[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform145[4];
      boxY =  (platform145[1] - boxsize);
    }

    if (boxY <= (platform145[1] + platform145[3] - boxsize) && boxY >= (platform145[1] - boxsize) && boxX >= (platform145[0] - boxsize) && boxX <= (platform145[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform145[0] - boxsize);
    }

    if (boxY <= (platform145[1] + platform145[3] - boxsize) && boxY >= (platform145[1] - boxsize) && boxX <= (platform145[0] + platform145[2]) && boxX >= (platform145[0] + (platform145[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform145[0] + (platform145[2]));
    }



    if (boxY <= (platform145[1] +  platform145[3]) && boxY >= (platform145[1] + boxsize)  && boxX > (platform145[0] - boxsize) && boxX < (platform145[0] + platform145[2])) {
      jump = -7;
    }


    if ( boxX >= (platform145[0] + platform145[2]) && check == platform145[4]|| boxX <= (platform145[0] - boxsize) && check == platform145[4]) {
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
    int[] highjumpower = {170, 413, 20, 20};
    if (higherjump ==  false) {
      fill(#FF9912);
      rect(highjumpower[0], highjumpower[1], highjumpower[2], highjumpower[2]);
    }

    if (higherjump == false && boxX >= (highjumpower[0] - boxsize)  && boxX <= (highjumpower[0] + boxsize) && boxY <= (highjumpower[1] + boxsize)  && boxY >= (highjumpower[1] - boxsize)) {
      higherjump = true;
    }

    if (higherjump == true) {
      jumpheight = highjumpower[3];
    }

    int[] highjumpower2 = {350, 310, 20, 6};
    if (higherjump2 ==  false) {
      fill(#FF9912);
      rect(highjumpower2[0], highjumpower2[1], highjumpower2[2], highjumpower2[2]);
    }

    if (higherjump2 == false && boxX >= (highjumpower2[0] - boxsize)  && boxX <= (highjumpower2[0] + boxsize) && boxY <= (highjumpower2[1] + boxsize)  && boxY >= (highjumpower2[1] - boxsize)) {
      higherjump2 = true;
    }

    if (higherjump2 == true) {
      jumpheight =  jumpheight + highjumpower2[3];
    }

    //Death Zone
    int[] deathzone141 = {600, 655, 100, 5};
    fill(255, 0, 0);
    rect(deathzone141[0], deathzone141[1], deathzone141[2], deathzone141[3]);
    if (boxY == (deathzone141[1] - 15) && boxX >= deathzone141[0] && boxX <= (deathzone141[0] + deathzone141[2])) {
      higherjump = false;
      higherjump2 =  false;
      jumpheight = 15;
      jump = 15;
      boxX = 50;
      boxY = 640;
    }

    int[] deathzone142 = {300, 655, 150, 5};
    fill(255, 0, 0);
    rect(deathzone142[0], deathzone142[1], deathzone142[2], deathzone142[3]);
    if (boxY == (deathzone142[1] - 15) && boxX >= deathzone142[0] && boxX <= (deathzone142[0] + deathzone142[2])) {
      higherjump = false;
      higherjump2 =  false;
      jumpheight = 15;
      jump = 15;
      boxX = 50;
      boxY = 640;
    }

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

    //End Platform
    /*
 Array Meaning: 
     0 = x-coordinate of the rectangle
     1 = y-coordinate of the rectangle
     2 = length of the rectangle
     3 = width of the rectangle
     4 = level number
     */
    int[] endplatform4 = {50, 82, 35, 9, 4};
    fill(218, 165, 32);
    rect(endplatform4[0], endplatform4[1], endplatform4[2], endplatform4[3]);
    if (boxY <= (endplatform4[1] + 20)  && boxY >= (endplatform4[1] - 20) && boxX >=  (endplatform4[0] - 20) && boxX <= (endplatform4[0] + 30) && level == endplatform4[4]) {
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
