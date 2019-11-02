//Caroline
class Intropage extends Screen
{
  float transparency = 255;
  PImage image;
  int click;

  void setup()
  {
    size(SCREENX, SCREENY); 
    //image = loadImage();
  }

  void draw()
  {
    background(0);
    if (transparency > 0)
    {
      transparency -= 1;
    }
    tint(255, transparency);
    image(image, 0, 0);
  }

  void mousePressed()
  {
  }
}