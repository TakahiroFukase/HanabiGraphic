int BallNumber = 30;
Ball[] b = new Ball[BallNumber];


void setup()
{
  size(800, 500);
  smooth();
  float timeLag = 0;
  for (int i = 0; i < BallNumber; i++)
  {
    b[i] = new Ball(random(50, 750), 550 + timeLag, random(2,4), random(50, 230));
    timeLag += random(100, 200);
  }
}

void draw()
{
  background(0, 0, 80);
  fill(0);
  rect(0, height - 30, width, 30);//フレーム下側の黒いベース
  rect(50, 420, 45, 90);
  rect(120, 320, 65, 150);//ランドマーク・タワー
  rect(200, 420, 45, 90);
  rect(270, 380, 60, 100);
  rect(360, 400, 60, 100);
  ellipse(460,450, 70, 70);
  arc(630, height, 180, 300, HALF_PI, PI + HALF_PI);
  rect(700, 435, 100, 65);
  
  for (int i = 0; i < BallNumber; i++)
  {
    b[i].move();
    b[i].display();
  }
}


  
