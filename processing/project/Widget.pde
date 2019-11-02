class Widget
{
  int x, y, width, height, stars, fontSize, event, index = -1, secondEvent=0;
  boolean isImage = false, centerText, isResult = false, display = false, luckyWidget = false;
  color widgetColor = light, labelColor, strokeColor, mainColor, hoverColor;
  PImage image, unTouchedImg, touchedImg;
  String businessName, userName, label = "";
  Review review;
  //He
  Widget(int x, int y, int width, int height, int event) // don't draw this widget, use for entering typing mode.
  {
    //basic widget
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.event = event;
  }
  //Ruth
  Widget(int x, int y, int width, int height, String label, color mainColor, color hoverColor, color labelColor, int fontSize, int event, boolean centerText) // normal widget draw int rectangle and has text in it.
  {
    //basic text widget
    this.x = x; 
    this.y = y; 
    this.width = width; 
    this.height= height;  
    this.event = event;
    this.label = label;
    this.mainColor = mainColor;
    this.widgetColor = mainColor;
    this.hoverColor = hoverColor;
    this.labelColor = labelColor;
    this.fontSize = fontSize;
    labelColor= black;
    strokeColor = white;
    this.centerText = centerText;
    if (label.equals("I'm Feeling Lucky"))
      luckyWidget = true;
  }
  //Ruth
  Widget(int x, int y, int width, int height, String label, color widgetColor, color labelColor, int fontSize, int event, int index) // index widget, use for result choose
  {
    //specific review widget
    this.x = x; 
    this.y = y; 
    this.width = width; 
    this.height= height; 
    this.label = label; 
    this.event = event; 
    this.widgetColor = widgetColor;
    this.labelColor = labelColor;
    this.fontSize = fontSize;
    labelColor= black;
    strokeColor = white;
    this.index = index;
  }
  //to graph widgets - Ruth
  Widget(int x, int y, int width, int height, PImage image, String label, int event, int secondEvent)
  {
    //image widget
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.event = event;
    this.label = label;
    isImage = true;
    this.image = image;
    this.secondEvent =secondEvent;
  }
  //Leo
  Widget(int x, int y, int width, int height, PImage image, String label, int event) 
  {
    //image widget
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.event = event;
    this.label = label;
    isImage = true;
    this.image = image;
  }
  //He
  Widget(float x, float y, int width, int height, PImage unTouchedImg, PImage touchedImg, int event, String label)
  {
    //change on hover image widget
    this.x = (int) x;
    this.y = (int) y;
    this.width = width;
    this.height = height;
    this.unTouchedImg = unTouchedImg;
    this.touchedImg = touchedImg;
    this.event = event;
    image = unTouchedImg;
    this.label = label;
    this.isImage = true;
  }
  //Leo
  Widget(int x, int y, int width, int height, color widgetColor, int event, boolean isResult) // 
  {
    //widgets on the results page
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.widgetColor = widgetColor;
    this.event = event;
    this.isResult= isResult;
  }

  void draw()
  {
    if (isImage)
    {
      image(image, x, y);
    } else if (isResult)
    {
      if (display)
      {
        stroke(white);
        fill(widgetColor);
        rect(x, y, width, height);
        fill(white);
        textFont(arial26);
        textSize(26);
        text(businessName, x + 1, y + 31);
        textFont(arial16);
        textSize(16);
        text("A review by " + userName, x + 1, y + 17 + height - 20);
        for (int i = 0; i < stars; i++)
        {
          image(star, x + width - 21 - (20 * i), y + 39);
        }
      }
    } else
    {
      stroke(strokeColor);
      fill(widgetColor); 
      rect(x, y, width, height); 
      fill(labelColor);
      if (fontSize > 20)
        textFont(arial26);
      else
        textFont(arial16);
      textSize(fontSize);
      if (centerText)
        text(label, x + (width / 2) - (label.length() * 6), y + (height / 2) + 7);
      else
        text(label, x + 10, y + height - 15);
    }
  }

  void clicked(boolean yellow)
  {
    if (yellow)
    {
      image = touchedImg;
    } else
    {
      image = unTouchedImg;
    }
  }

  void hovered(int mX, int mY)
  {
    if (mX >= x && mX <= x + width && mY >= y && mY <= y + height)
    {
      if (isImage)
      {
        image = touchedImg;
      } else
      {
        changeColour(hoverColor);
      }
    } else
    {
      if (isImage)
      {
        image = unTouchedImg;
      } else
      {
        changeColour(mainColor);
      }
    }
  }

  int getEvent(int mX, int mY)
  {
    if (isResult && !display)
    {
      return EVENT_NULL;
    }
    if (luckyWidget)
      index = Math.round(random(0, allReviewsList.size() - 1));
    if (mX >= x && mX <= x + width && mY >= y && mY <= y + height)
    { 
      return event;
    } else
    {
      return EVENT_NULL;
    }
  }

  void changeColour(color colour)
  {
    widgetColor = colour;
  }

  void displayResultWidget(Review review)
  {
    this.businessName = review.businessName;
    this.userName = review.userName;
    this.stars = review.stars;
    this.review = review;
    this.display = true;
  }

  void hideResultWidget()
  {
    this.display = false;
  }

  Review getReview()
  {
    return review;
  }
  
  void updateIndex(int index)
  {
    this.index = index;
  }
}