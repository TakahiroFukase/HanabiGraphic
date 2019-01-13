class Ball
{
  float x;                //玉のｘ座標
  float y;                //玉のｙ座標
  float diam = 25;        //玉の直径
  float upSpeed;          //上昇スピード
  float swingSpeed = 2.7; //上昇中に左右に揺れる幅
  float explodeHight;     //爆発を開始する高さ
  float explodeSize;      //爆発して広がった時の大きさ
  
  //爆発時における色の強さを保持する変数
  float red;
  float green;
  float blue;
  
  //玉のライフサイクルを表すboolean型の変数
  boolean exploding = false;
  boolean fade = false;
  boolean end = false;
  
  float fadeCount = 0;  //フェード中のカウンタ。fadeCount * 4.5の分だけ徐々に色を薄めていく
  
  Ball(float tempX, float tempY, float tempUpSpeed, float tempExplodeHight)
  {
    //プロパティの初期設定を行う
    x = tempX;
    y = tempY;
    upSpeed = tempUpSpeed;
    explodeHight = tempExplodeHight;
    explodeSize = random(90, 370);  //広がる大きさは玉ごとにバラバラで指定
  }
  
  //自身のライフサイクルに合わせて動く
  void move()
  {
    if (!(exploding))
    {
      //爆発前であれば左右に揺れながら一定のスピードで上昇
      x += random(-swingSpeed, swingSpeed);
      y -= upSpeed;
    }
    else
    {
      //爆発中であれば玉の直径が大きくなっていく
      if (!(end)){diam += 3.0;}
    }
    
    //爆発する高さに達した時に1回だけ実行される
    if (!(exploding) && y < explodeHight)
    {      
      getColor();
      exploding = true;
    }
    
    //指定の大きさまで広がったら、fadeをtrueにして徐々に消えていく
    if (diam > explodeSize && !(end)){fade = true;}
  }
  
  //自分自身を画面に表示する
  void display()
  {
    noStroke();
    fill(255);  //爆発中でなければ「白」の玉でキープしておく
    if (exploding){fill(red, green, blue, 180);}                              //爆発中は透明度180で指定（0 : 透明  255: 不透明）
    if (fade){fill(red, green, blue, 180 - (fadeCount * 4.5)); fadeCount++;}  //フェード中はfadeCount * 4.5 の分だけ薄くなっていく
    if (fade && fadeCount > 40){fade = false; end = true;}                    // 40回 (= 2/3秒)フェードを続けたら完全に消える
    if (!(end)){ellipse(x, y, diam, diam);} //玉を表示する
  }
  
  private void getColor() {
      
      //玉の色をランダムに決定
      red = random(255); 
      green = random(255);
      blue = random(255);   
  }
}
