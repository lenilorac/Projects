class Scrollbar
{
  float x, y, startY, maxY, lastMouseY;
  int width, length, contentLength;
  boolean stop = false;
  Scrollbar(float x, float y, int width, int length, int contentLength)
  {
    this.x = x;
    this.y = y;
    startY = y;
    this.width = width;
    this.contentLength = contentLength;
    this.length = contentLength / length;
    lastMouseY = 0;
  }
  
  void draw()
  {
    fill(bluegreen);
    rect(x, y, width, length);
    if(mousePressed && !mouseOff())
    {
      if(lastMouseY > mouseY)
      {
        y--;
      }else
      {
        y++;
      }
      lastMouseY = mouseY;
    }
  }
  
  boolean mouseOff()
  {
    if(mouseY <= startY || mouseY >= maxY)
    {
      return true;
    }else
    {
      return false;
    }
  }
}