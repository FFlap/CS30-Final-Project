public abstract class aGameObject {
  protected int visibility, setX, setY, setW, setL;
  protected int viewVisibility = 1;


  public aGameObject(int visibility, int setX, int setY, int setL, int setW) {
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
    this.setW = setW;
    this.setL = setL;
  }

  public abstract void display();


  public boolean collidesWith(aGameObject other) {
    return this.setX < other.setX + other.setL &&
      this.setX + this.setL > other.setX &&
      this.setY < other.setY + other.setW &&
      this.setY + this.setW > other.setY;
  }

  public void updateVisibility() {

    for (aPlayer player : players) {
      player.setViewVisibility(getViewVisibility());
    }

    for (aPlatform plat : platforms) {
      plat.setViewVisibility(getViewVisibility());
    }

    for (aObject obj : objects) {
      obj.setViewVisibility(getViewVisibility());
    }

    for (aPowerup pow : powerups) {
      pow.setViewVisibility(getViewVisibility());
    }
  }

  public void setViewVisibility(int viewVisibility) {
    this.viewVisibility = viewVisibility;
  }

  public int getViewVisibility() {
    return viewVisibility;
  }

  public  int getVisibility() {
    return visibility;
  }

  public int getX() {
    return setX;
  }

  public int getY() {
    return setY;
  }

  public int getW() {
    return setW;
  }

  public int getL() {
    return setL;
  }
}
