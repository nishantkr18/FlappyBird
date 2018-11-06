public class Bird
{MyNN nn;
  int score;Matrix W1,W2;boolean dead; float posY,vel;float result;
  Bird()
  {
    W1=new Matrix(4,4+1);
    W2=new Matrix(1,4+1);
    nn=new MyNN(4,4,1,W1,W2);
    reset();
  }
  void reset()
  {
    dead=false;
    score=0;
    posY=height/2;vel=0;
  }
  void show()
  {
    //int clr=floor(map(posY,0,height,0,255));
    fill(100,5);
  ellipse(posX,posY,10,10);
  
  //fill(0,255,0);
  //textSize(20);
  //text("Score: "+b.score,600,50);
  
  //fill(0,255,0);
  //textSize(20);
  //text("Dist: "+dist,600,80);
  
  //fill(0,255,0);
  //textSize(20);
  //text("posY: "+b.posY,600,110);
  
  //fill(0,255,0);
  //textSize(20);
  //text("Upper: "+(rnd-100),600,140);
  
  //fill(0,255,0);
  //textSize(20);
  //text("Lower: "+rnd,600,170);
  
  //fill(0,255,0);
  //textSize(20);
  //text("Result: "+result,600,200);
  }
  void move()
  {
    vel+=grav;
    posY+=vel;
    if(posY>=height)
  {posY=height;dead=true;}
  if(posY<=0)
  {posY=0;dead=true;}
  
  if(x<=posX&&x+30>=posX)
  {
    if(posY<=rnd1&&posY>=rnd1-100){score++;}
    else dead=true;
  }
  if(y<=posX&&y+30>=posX)
  {
    if(posY<=rnd2&&posY>=rnd2-100){score++;}
    else dead=true;
  }
  result=nn.predict(dist,posY,rnd,rnd-100);
  if(result>0.5)
  vel=-10;
  }
  
  void mutateW1(Matrix baby)
  {
    for(int i=0; i<4; i++){
      for(int j=0; j<5; j++){
        if(random(1)<mutateRate)
        {
        W1.m[i][j]=random(2)-1;
        //a[i][j]++;
        }
        else
        W1.m[i][j]=baby.m[i][j];
      }
    }
    
  }
  void mutateW2(Matrix baby)
  {
    for(int i=0; i<1; i++){
      for(int j=0; j<5; j++){
        if(random(1)<mutateRate)
        {
        W2.m[i][j]=random(2)-1;
        //a[i][j]++;
        }
        else
        W2.m[i][j]=baby.m[i][j];
      }
    }
    
  }
  
}
