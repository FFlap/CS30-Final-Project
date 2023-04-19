public class aProjectile extends aGameObject {
  private float projectileX, projectileY, projectileSpeedX, projectileSpeedY, projectileAngle, projectileTimer, speed;
  private boolean projectileActive = true;
  private String setType;

  public aProjectile(String setType, int visibility, int setX, int setY, int setL, int setW) {
    super(visibility, setX, setY, setL, setW);
    this.setType = setType;
  }


  public float getProjectileX() {
    return setX;
  }

  public float getProjectileY() {
    return setY;
  }

  public void targetMouse(int projectileMouseX, int projectileMouseY) {
    this.projectileX =   players.get(0).getX();
    this.projectileY =    players.get(0).getY();
    this.projectileAngle = atan2(projectileMouseY - getY(), projectileMouseX - getX());
  }

  public void targetPlayer() {

    this.projectileX =  getX();
    this.projectileY =   getY();
    this.projectileAngle = atan2(players.get(0).getY() - projectileY, players.get(0).getX()  - projectileX);
  }



  public void display() {
    if ((visibility == 0 || visibility == getViewVisibility()) && projectileActive) {
      switch(setType) {

      case "player":
        speed = 6;
        break;

      case "enemy":
        speed = 10;
        if ( world.levelTimer % 75 == 0) {
          targetPlayer();
        }

        break;

      default:
        break;
      }


      if (projectileTimer == 50) {
        projectileActive = false;
      }
      
      
      projectileTimer++;
      //Projectile
      fill(#7B4CEA);
      rect(setX, setY, 20, 20);
      projectileSpeedX = speed * cos(projectileAngle);
      projectileSpeedY = speed * sin(projectileAngle);
      setX += projectileSpeedX;
      setY += projectileSpeedY;
    }
  }
}
