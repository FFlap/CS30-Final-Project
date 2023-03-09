public void level0() {
  if (level == 0) {
    //Move Across Screen Left To Right & Right to Left
    if ( player.boxX > 695 && player.boxY >= -15 && player.boxY < 700) {
      player.boxX = -15;
    }

    if ( player.boxX < -15 && player.boxY >= -15 && player.boxY < 700) {
      player.boxX = 695;
    }

    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 335;
      player.boxY = 640;
    }
    levelTimer++;
  }
}
