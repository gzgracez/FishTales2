class Toroidalfin extends Goldfish {
  Toroidalfin() {
    super();
    skin=color(255, 0);
    fishX=random(50, 550);
    fishY=random(50, 550);
    type="Toroidalfin";
  }

  void show() {
    fill(0);
    textAlign(CENTER);
    text(name, fishX, fishY-weight);
    if (isDead==false) {//alive
      stroke (255, 0, 0);
      fill(skin);
      if (age%60<=15)//tail
        triangle(fishX, fishY, fishX-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedX+speedY), fishY-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedY-speedX), fishX-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedX-speedY), fishY-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedY+speedX));
      else
        triangle(fishX, fishY, fishX-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedX+speedY/2), fishY-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedY-speedX/2), fishX-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedX-speedY/2), fishY-(weight/2/sqrt(speedX*speedX+speedY*speedY))*(2*speedY+speedX/2));
      fill(skin);//body
      ellipse(fishX, fishY, weight, weight);
      fill(255);//eye
      ellipse(fishX+((2*weight/5)/sqrt(speedX*speedX+speedY*speedY))*speedX-((1*weight/10)/sqrt(speedX*speedX+speedY*speedY))*(2*speedX-speedY), fishY+((2*weight/5)/sqrt(speedX*speedX+speedY*speedY))*speedY-((1*weight/10)/sqrt(speedX*speedX+speedY*speedY))*(2*speedY+speedX), 2*weight/5, 2*weight/5);
      fill(0);//pupil
      ellipse(fishX+((weight/2)/sqrt(speedX*speedX+speedY*speedY))*speedX-((1*weight/10)/sqrt(speedX*speedX+speedY*speedY))*(2*speedX-speedY), fishY+((weight/2)/sqrt(speedX*speedX+speedY*speedY))*speedY-((1*weight/10)/sqrt(speedX*speedX+speedY*speedY))*(2*speedY+speedX), 1*weight/5, 1*weight/5);
    }//alive
    else {//dead
      stroke(255, 0, 0);//tail
      fill(skin);
      triangle(fishX, fishY, fishX+weight, fishY+weight/2, fishX+weight, fishY-weight/2);
      fill(skin);//body
      ellipse(fishX, fishY, weight, weight);
      stroke(0);//eye
      line((fishX-2*weight/5)-weight/5, fishY-3*weight/10, (fishX-2*weight/5)+weight/5, fishY+weight/10);
      line((fishX-2*weight/5)-weight/5, fishY+weight/10, (fishX-2*weight/5)+weight/5, fishY-3*weight/10);
    }//dead
  }

  void move() {
    if (isDead==false) {//alive
      age++;
      ammonia+=0.001;
      if (fishX<=-weight/2) {//bounce
        fishX=600+weight/2;
      }
      else if (fishX>=600+weight/2) {
        fishX=-weight/2;
      }
      if (fishY<=-weight/2) {
        fishY=600+weight/2;
      }
      else if (fishY>=600+weight/2) {
        fishY=0-weight/2;
      }
      fishX+=speedX; 
      fishY+=speedY;
      if (age%900==0) weight+=3;//weight increase by age
      if (age==900*maxAge) isDead=true;
      if (weight>=maxWeight || weight<=0.1*maxWeight) isDead=true;
    }//alive
    else {//dead
      if (fishY>0) {//float to the top after death
        speedX=0;
        speedY=-1;
        fishX+=speedX; 
        fishY+=speedY;
      }
      else {//stop at the top
        speedX=0;
        speedY=0;
      }
    }//dead
  }
}

