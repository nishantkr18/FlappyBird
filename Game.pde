pop test;int popL=1000;
void setup()
{
  size(1000,900);
  test=new pop();
  test.resetAll();
}
void draw()
{
  background(255);
  test.showAll();
  test.update();
}
void keyPressed()
{
  if(key==' ')
  test.resetAll();
}
