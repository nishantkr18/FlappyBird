public class Matrix
{
  float m[][];int rows,columbs;
  Matrix(int r,int c)
  {
    rows=r;
    columbs=c;
    
  }
  void randomMatrix()
  {
    m=new float[rows][columbs];
    for(int i=0; i<rows; i++){
      for(int j=0; j<columbs; j++){
        m[i][j]=random(2)-1;
      }
    }
  }
  
  
  
  
}
