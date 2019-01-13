class Ball
{
  float x;//スタートのｘ座標
  float y;//スタートのｙ座標
  float diam = 25;
  float upSpeed;
  float swingSpeed = 2.7;
  float explodeHight;//爆発を開始する高さ
  float explodeSize;//
  boolean exploding = false;
  boolean end = false;
  boolean fade = false;
  float fadeCount = 0;
  float red;
  float green;
  float blue;
  
  
  Ball(float tempX, float tempY, float tempUpSpeed, float tempExplodeHight)
  {
    x = tempX;
    y = tempY;
    upSpeed = tempUpSpeed;
    explodeHight = tempExplodeHight;
    explodeSize = random(90, 370);
  }
  
  void move()
  {
    if (!(exploding))
    {
      x += random(-swingSpeed, swingSpeed);
      y -= upSpeed;
    }
    else
    {
      if (!(end)){diam += 3.0;}
    }
    
    //爆発する高さに達した時に1回だけ実行される
    if (!(exploding) && y < explodeHight)
    {
      exploding = true;
      red = random(255); 
      green = random(255);
      blue = random(255);
      
    }
    
    if (diam > explodeSize && !(end)){fade = true;}
  }
  
  void display()
  {
    noStroke();
    fill(255);//爆発中でなければ「白」の玉でキープしておく
    if (exploding){fill(red, green, blue, 180);}
    if (fade){fill(red, green, blue, 180 - (fadeCount * 4.5)); fadeCount++;}
    if (fade && fadeCount > 40){fade = false; end = true;}
    if (!(end)){ellipse(x, y, diam, diam);}
    
  }
  
}
