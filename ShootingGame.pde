//画面の大きさ設定
int s=600;
int ss=70;
//発射台
int hx=s/2;
int hy=3*s/4;
//爆弾
int tx=0;
int ty=0;
//的1
int m1x=100;
int m1y=0;
int a=(int)random(s-80);
//的2
int m2x=100;
int m2y=0;
int b=(int)random(s-60);
//的3
int m3x=100;
int m3y=0;
int c=(int)random(s-40);
//ポイント
int point=0;
//game limit
int count=0;
//スタート
int start=0;
void settings(){
  size(s,s);
}  

void keyPressed(){
  //ゲームをスタートする
  if(keyCode==ENTER){
    start=-1;
  }
  //発射台を動かす
  if(keyCode==LEFT){
    if(hx>=ss) hx-=20;
  }else if(keyCode==RIGHT){
    if(hy<=s-ss) hx+=20;
  }
  //発射台の位置
  if(key==' '){//space
    tx=hx;
    ty=hy;
  }
}

void mato1(){
  m1x=a;
  fill(179,255,102);
  stroke(179,255,102);
  ellipse(m1x,m1y,80,80);
  m1y++;
  if(m1y>=s-ss){
    a=(int)random(s-80);
    m1y=0;
  }
}

void mato2(){
  m2x=b;
  fill(255,102,255);
  stroke(255,102,255);
  rect(m2x,m2y,60,60);
  m2y+=2;
  if(m2y>=s-ss){
    b=(int)random(s-60);
    m2y=0;
  }
}

void mato3(){
  m3x=c;
  fill(255,179,102);
  stroke(255,179,102);
  ellipse(m3x,m3y,40,40);
  m3y+=3;
  if(m3y>=s-ss){
    c=(int)random(s-40);
    m3y=0;
  }
}

void hassyadai(){
  fill(102,102,255);
  stroke(102,102,255);
  triangle(hx,hy,hx-50,hy+80,hx+50,hy+80);
  rect(hx-50,hy+80,100,60);
}

void draw(){
  //スタート
  if(start==0){
    background(0);
    textSize(50);
    fill(102,255,255);
    stroke(102,255,255);
    text("SHOOTING GAME",80,60);
    fill(179,255,102);
    stroke(179,255,102);
    ellipse(100,150,80,80);
    text("-> 1point",150,160);
    fill(255,102,255);
    stroke(255,102,255);
    rect(70,250,60,60);
    text("-> 2point",150,290);
    fill(255,179,102);
    stroke(255,179,102);
    ellipse(100,380,40,40);
    text("-> 3point",150,390);
    textSize(35);
    fill(102,255,255);
    stroke(102,255,255);
    text("click 'enter' when you are ready",40,500);
  }
  if(start==-1){
    
    count++;
    background(0);
    //発射台
    hassyadai();
    //爆弾
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(tx,ty,10,10);
    ty-=10;
    //的1
    mato1();
    if(tx>=m1x-40&&tx<=m1x+40&&ty>=m1y-40&&ty<=m1y+40){
      point++;
      m1y=700;
      tx=700;
      ty=700;
      m1y=0;
      a=(int)random(s-80);
    }
    //的2
    mato2();
    if(tx>=m2x&&tx<=m2x+60&&ty>=m2y&&ty<=m2y+60){
      point+=2;
      m2y=700;
      tx=700;
      ty=700;
      m2y=0;
      b=(int)random(s-60);
    }
    //的3
    mato3();
    if(tx>=m3x-20&&tx<=m3x+20&&ty>=m3y-20&&ty<=m3y+20){
      point+=3;
      m3y=700;
      tx=700;
      ty=700;
      m3y=0;
      c=(int)random(s-40);
    }
    //20秒経過したら最終画面に遷移
    if(count>60*20){
      background(0);
      textSize(50);
      fill(102,255,255);
      stroke(102,255,255);
      text("finish!",s/2-70,s/2-30);
      text("point:"+point,s/2-100,s/2+20);
    }
  }
}
