void level10() {



  //End Screen
  if (level == 10) {


        image(endImage, 190, 160);



    if (levelTimer == 0) {
     world.LevelReset();
      boxX = 330;
      boxY = 640;
    }

    levelTimer++;



    strokeWeight(2);
    stroke(255, 0, 0);
    fill(128, 128, 128);
    rect(100, 350, 200, 100);

    rect(400, 350, 200, 100);


    //Text

    fill(255);
    textSize(20);
    text("Restart", 160, 405);

    text("Exit", 475, 405);

    //Move Across Screen Left To Right & Right to Left
    if ( boxX > 695 && boxY >= -15 && boxY < 700) {
      boxX = -15;
    }

    if ( boxX < -15 && boxY >= -15 && boxY < 700) {
      boxX = 695;
    }
  }
}
