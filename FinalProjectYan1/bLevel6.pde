void level6() {

  if (world.level == 6) {




    //Vertical Portal Blue
    int[] portal131 = {690, 530, 10, 60};
    fill(255, 154, 0);
    rect(portal131[0], portal131[1], portal131[2], portal131[3]);
    fill(255);
    rect(portal131[0], (portal131[1] + 5), (portal131[2] - 5), (portal131[3] - 10));
    if (boxY <= (portal131[1] + 60)  && boxY >= (portal131[1] - 5) && boxX > (portal131[0] - 20) && boxX < (portal131[0] + 20)) {
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
      boxX = 580;
      boxY = 610;
    }

  }
}
