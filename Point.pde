class Point implements Tankable {
  private float speedX, speedY;
  private float posX, posY;
  private float size;
  private FishTank tank=theTank;
  private int type=0; //0-goldfish, 1-toroidalfin

  Point() {
    posX=random(50, tank.getTWidth()-50);
    posY=random(50, tank.getTWidth()-50);
    speedX=random(-4, 4);
    if (speedX==0) speedX=random(-4, 4);
    speedY=sqrt(16-sq(speedX))*pow(-1, (int)random(1, 5));
    size=20;
  }
  
  Point(int t) {
    posX=random(50, tank.getTWidth()-50);
    posY=random(50, tank.getTWidth()-50);
    speedX=random(-4, 4);
    if (speedX==0) speedX=random(-4, 4);
    speedY=sqrt(16-sq(speedX))*pow(-1, (int)random(1, 5));
    size=20;
    type=t;
  }
  
  Point(int t, FishTank tank) {
    posX=random(50, tank.getTWidth()-50);
    posY=random(50, tank.getTWidth()-50);
    speedX=random(-4, 4);
    if (speedX==0) speedX=random(-4, 4);
    speedY=sqrt(16-sq(speedX))*pow(-1, (int)random(1, 5));
    size=20;
    type=t;
    this.tank=tank;
  }
  public float getX() {
    return posX;
  }
  public float getY() {
    return posY;
  }
  public float getRadius() {
    return size/2;
  }
  public boolean stillKickin() {
    return true;
  }
  public boolean hasCollision(Tankable t) {
    return false;
  }
  public void bump() {
  }
  public void update() {
    show();
    move();
  }
  public void show() {
    stroke(0);
    fill(0);
    ellipse(posX, posY, size, size);
  }
  public void move() {
    if (type==0) {
      if (posX<=size/2) {//bounce
        speedY=random(-4, 4);
        speedX=sqrt(16-sq(speedY));
      } else if (posX>=tank.getTWidth()-size/2) { 
        speedY=random(-4, 4);
        speedX=-sqrt(16-sq(speedY));
      }
      if (posY<=size/2) {
        speedX=random(-4, 4);
        speedY=sqrt(16-sq(speedX));
      } else if (posY>=tank.getTWidth()-size/2) {
        speedX=random(-4, 4);
        speedY=-sqrt(16-sq(speedX));
      }
    } else {
      if (posX<=-size/2) {//bounce
        posX=tank.getTWidth()+size/2;
      } else if (posX>=tank.getTWidth()+size/2) {
        posX=-size/2;
      }
      if (posY<=-size/2) {
        posY=tank.getTWidth()+size/2;
      } else if (posY>=tank.getTWidth()+size/2) {
        posY=0-size/2;
      }
    }
    posX+=speedX;
    posY+=speedY;
  }
}

