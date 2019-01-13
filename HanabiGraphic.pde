int numOfBalls = 80;
Ball[] b = new Ball[numOfBalls];
float yPositionOfFirstBall = 550;

//はじめに一回だけ呼ばれるsetup()関数
void setup()
{
  size(800, 500);
  smooth();
  float timeLag = 0;  //次のボールとの間隔を開けるための変数

  //指定の数だけ花火の玉のインスタンスを生成する
  for (int i = 0; i < numOfBalls; i++)
  {
    //引数で (x座標、y座標、上がるスピード、爆発する高さ) を指定
    b[i] = new Ball(random(50, 750), yPositionOfFirstBall + timeLag, random(2,4), random(50, 230));
    timeLag += random(100, 200);  //次のボールと100~200の間隔を取る
  }
}

//デフォルトで1秒に60回呼び出されるdraw()関数
void draw()
{
  background(0, 0, 80);  //空は深い青色を指定
  drawMinatoMirai();

  //花火の玉をそれぞれ動かして表示する
  for (int i = 0; i < numOfBalls; i++)
  {
    b[i].move();
    b[i].display();
  }
}

//みなとみらいの景色を描く
void drawMinatoMirai() {

  fill(0); //色は黒指定
  rect(0, height - 30, width, 30);   //フレーム下側の黒いベース
  rect(50, 420, 45, 90);                  //ビルディング1
  rect(120, 320, 65, 150);             //ランドマーク・タワー
  rect(200, 420, 45, 90);                //ビルディング2
  rect(270, 380, 60, 100);             //クイーンズスクエア1
  rect(360, 400, 60, 100);             //クイーンズスクエア2
  ellipse(460,450, 70, 70);             //観覧車
  arc(630, height, 180, 300, HALF_PI, PI + HALF_PI);  //インターコンチネンタルホテル
  rect(700, 435, 100, 65);              //赤レンガ倉庫
}
