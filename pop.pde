int x,y,rnd1,rnd2,posX=30;int speed=5;int rnd,dist;float mutateRate=0.01;
float grav=0.5;
class pop
{
  Bird birdarr[];
  Bird newbirdarr[];
  float fitnessSum=0,fitnessMax=0; 
  Bird fittest;
  pop()
  {
    birdarr=new Bird[popL];
    newbirdarr=new Bird[popL];
    for(int i=0; i<popL; i++)
    {birdarr[i]=new Bird();newbirdarr[i]=new Bird();birdarr[i].W1.randomMatrix();
  birdarr[i].W2.randomMatrix();
newbirdarr[i].W1.randomMatrix();
newbirdarr[i].W2.randomMatrix();
    }
    resetAll();
    
  }
  
  void allAreDead()
  {
    calFit();
    newPop();
    resetAll();
  }
  
  void calFit()
  {
    fitnessSum=0;fitnessMax=0;
    for(int i=0; i<popL; i++)
    {
      fitnessSum+=birdarr[i].score;
      if(birdarr[i].score>=fitnessMax){fitnessMax=birdarr[i].score;fittest=birdarr[i];}
    }
    birdarr[0]=fittest;//first is the fittest
  }
  
  void newPop()
  {
    
    for(int i=1; i<popL; i++)
    {
      
     Bird baby=selectParent();
     newbirdarr[i].mutateW1(baby.W1);
     newbirdarr[i].mutateW2(baby.W2);
     //if(i==0)println(newbirdarr[0].W1.m[0][0],newbirdarr[0].W1.m[0][1],newbirdarr[0].W1.m[0][2],newbirdarr[0].W1.m[0][3]);
      //Matrix a=newbirdarr[i].W1;
      //Matrix b=newbirdarr[i].W2;
      //newbirdarr[i].W1.mutate(a.m);
      //newbirdarr[i].W2.mutate(b.m);
      
      
    }
    //println(newbirdarr[0].W1.m[0][0],newbirdarr[0].W1.m[0][1],newbirdarr[0].W1.m[0][2],newbirdarr[0].W1.m[0][3]);
    println(newbirdarr[1].W1.m[0][0],newbirdarr[1].W1.m[0][1],newbirdarr[1].W1.m[0][2],newbirdarr[1].W1.m[0][3]);
    for(int i=1; i<popL; i++)
    {
      birdarr[i]=newbirdarr[i];
    }
    
  }
  
  
  
  Bird selectParent()
  {
    float rdm=random(fitnessSum);
    float runningSum=0;
    for(int i=0; i<popL; i++)
    {
      runningSum+=birdarr[i].score;
      if(runningSum>=rdm)
      {return birdarr[i];}
    }
    println("nullRETURNED",fitnessSum,rdm);return null;
  }
   
  
  
  void resetAll()
  {
    for(int i=0; i<popL; i++)
    {
      birdarr[i].reset();
    }
    x=width/2;y=x+width/2;
    rnd1=floor(random(350,height-350));
  rnd2=floor(random(350,height-350));
  
  }
  void showAll()
  {
    background(255);
  fill(0,0,255);
  rect(x,rnd1,30,height-rnd1);
  fill(0,0,255);
  rect(x,0,30,rnd1-100);
  
  fill(0,255,0);
  rect(y,rnd2,30,height-rnd2);
  fill(0,255,0);
  rect(y,0,30,rnd2-100);
  
  fill(0,255,0);
  textSize(20);
  text("FitnessSum: "+fitnessSum,600,50);
  fill(0,255,0);
  textSize(20);
  text("FitnessMax: "+fitnessMax,600,80);
  
  boolean allDead=true;
    for(int i=0; i<popL; i++)
    {if(birdarr[i].dead==false){allDead=false;birdarr[i].move();birdarr[i].show();}}
    if(allDead==true)allAreDead();
  }
  void update()
  {
    x-=speed;y-=speed;
  if(x<=0)
  {x=width-1;rnd1=floor(random(350,height-350));}
  if(y<=0)
  {y=width-1;rnd2=floor(random(350,height-350));}
  if(posX>=x+15){rnd=rnd2;dist=max(0,y-posX);}
  else{rnd=rnd1;dist=max(0,x-posX);}
  }
  
  

}
