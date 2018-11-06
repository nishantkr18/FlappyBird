class MyNN
{
  float I[],H[],O[];int in,hn,on;Matrix W1,W2;
  MyNN(int a,int b,int c,Matrix w1,Matrix w2)
  {
    W1=w1;W2=w2;
    in=a;hn=b;on=c;
    I=new float[in];
    H=new float[hn];
    O=new float[on]; 
  }
  
  float predict(float a,float b,float c,float d)
  {
    I[0]=a;I[1]=b;I[2]=c;I[3]=d;
    genHnode();
    genOnode();
    float finalresult=(float)(1/(1+Math.exp(-O[0])));
    return finalresult;
  }
  
  
  void genHnode()
  {
    for(int i=0; i<hn; i++)
    {H[i]=0;
      for(int j=0; j<in; j++)
      {
        H[i]+=(W1.m[i][j]*I[j]);
      }
      H[i]+=W1.m[i][in];
    }
  }
  void genOnode()
  {
    for(int i=0; i<on; i++)
    {O[i]=0;
      for(int j=0; j<hn; j++)
      {
        O[i]+=(W2.m[i][j]*H[j]);
      }
      O[i]+=W2.m[i][hn];
    }
  }
  
  
  
}
