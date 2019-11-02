//Ruth 
class ReviewScreen extends Screen
{
  int funnyY;
  ReviewScreen(ArrayList<Review> reviewList)
  {
    super(reviewList); 
    reviewPage = true;
    init_widgets();
    funnyY=NAV_BAR_SIZE_Y+(8*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+115+SMALL_BORDER;
  }

  ReviewScreen(Review aReview)
  {
    super(aReview);
    reviewPage = true;
    init_aReview_widgets();
    funnyY=NAV_BAR_SIZE_Y+(12*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+95+SMALL_BORDER;
  }

  void init_widgets() // widgets for all review page
  {
    Widget nextWidget, previousWidget, funnyWidget, usefulWidget, coolWidget;
    nextWidget = new Widget(STANDARD_BORDER + 170, NAV_BAR_SIZE_Y+ (STANDARD_BORDER) +DROP_MENU_Y + 400, ARROW_SIZE_X, ARROW_SIZE_Y, nextImage, "next", NEXT_EVENT);
    previousWidget = new Widget(STANDARD_BORDER + 10, NAV_BAR_SIZE_Y + (STANDARD_BORDER) + DROP_MENU_Y + 400, ARROW_SIZE_X, ARROW_SIZE_Y, previousImage, "previous", BACK_EVENT);
    funnyWidget = new Widget(STANDARD_BORDER + 10, NAV_BAR_SIZE_Y+(8*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+115+SMALL_BORDER, UCF_SIZE, UCF_SIZE, funny, funny1, FUNNY, "funny");
    usefulWidget = new Widget(STANDARD_BORDER + 10, NAV_BAR_SIZE_Y+(8*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+115+(2*SMALL_BORDER)+UCF_SIZE, UCF_SIZE, UCF_SIZE, useful, useful1, USEFUL, "useful");
    coolWidget = new Widget(STANDARD_BORDER + 10, NAV_BAR_SIZE_Y+(8*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+115+(3*SMALL_BORDER)+(2*UCF_SIZE), UCF_SIZE, UCF_SIZE, cool, cool1, COOL, "cool");
    widgetList = new ArrayList();
    widgetList.add(nextWidget); 
    widgetList.add(previousWidget);
    widgetList.add(funnyWidget);
    widgetList.add(usefulWidget);
    widgetList.add(coolWidget);
  }

  void init_aReview_widgets() // widgets for a review page
  {
    Widget funnyWidget, usefulWidget, coolWidget, returnWidget;
    funnyWidget = new Widget(STANDARD_BORDER + 10, NAV_BAR_SIZE_Y+(12*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+95+SMALL_BORDER, UCF_SIZE, UCF_SIZE, funny, funny1, FUNNY, "funny");
    usefulWidget = new Widget(STANDARD_BORDER + 10, NAV_BAR_SIZE_Y+(12*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+95+(2*SMALL_BORDER)+UCF_SIZE, UCF_SIZE, UCF_SIZE, useful, useful1, USEFUL, "useful");
    coolWidget = new Widget(STANDARD_BORDER + 10, NAV_BAR_SIZE_Y+(12*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+95+(3*SMALL_BORDER)+(2*UCF_SIZE), UCF_SIZE, UCF_SIZE, cool, cool1, COOL, "cool");
    returnWidget = new Widget(STANDARD_BORDER, SCREENY - 60, 250, 50, "Return", grey, darkgrey, white, 26, RETURN_EVENT, true);
    widgetList = new ArrayList();
    widgetList.add(funnyWidget);
    widgetList.add(usefulWidget);
    widgetList.add(coolWidget);
    widgetList.add(returnWidget);
  }

  //He & Leo & Ruth
  void draw()
  {
    background(white); // draw background
    noStroke(); 
    //back rectangle (for main text)
    fill(light);
    rect(STANDARD_BORDER, NAV_BAR_SIZE_Y + (2*STANDARD_BORDER) + DROP_MENU_Y, 860, 440);
    //left rectangle (for info)
    fill(medium);
    rect(STANDARD_BORDER, NAV_BAR_SIZE_Y + (2*STANDARD_BORDER) + DROP_MENU_Y, 250, 440);
    //info text
    fill(white); 
    textSize(26); 
    textFont(arial26);
    text(reviewList.get(count).businessName, STANDARD_BORDER+TEXT_BORDER, NAV_BAR_SIZE_Y + (3*STANDARD_BORDER) + DROP_MENU_Y+TEXT_BORDER, 230, 160);
    textFont(arial16); 
    textSize(16); 
    text(reviewList.get(count).userName, STANDARD_BORDER+TEXT_BORDER, NAV_BAR_SIZE_Y+(7*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+60);
    text(reviewList.get(count).date.toString(), STANDARD_BORDER+TEXT_BORDER, NAV_BAR_SIZE_Y+(8*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER+65);
    drawStars(reviewList.get(count), 95);
    //drawing actual text
    fill(black); 
    textFont(arial16); 
    textSize(18); //65 characters accross
    text(reviewList.get(count).text, STANDARD_BORDER+250+TEXT_BORDER, NAV_BAR_SIZE_Y+(2*STANDARD_BORDER)+DROP_MENU_Y+(2*TEXT_BORDER)+textMove, 600-25, 3*SCREENY);
    //draw useful funny and cool count
    fill(white); 
    // draw shades for the text
    rect(STANDARD_BORDER, 0, 860, NAV_BAR_SIZE_Y+(2*STANDARD_BORDER)+DROP_MENU_Y);
    rect(STANDARD_BORDER, NAV_BAR_SIZE_Y+(2*STANDARD_BORDER)+DROP_MENU_Y+440, 860, 100);
    fill(white); 
    textSize(16);
    text(reviewList.get(count).funny, 4*STANDARD_BORDER, funnyY+STANDARD_BORDER);
    text(reviewList.get(count).useful, 4*STANDARD_BORDER, funnyY+(3*STANDARD_BORDER));
    text(reviewList.get(count).cool, 4*STANDARD_BORDER, funnyY+(5*STANDARD_BORDER));
    //scrollbar
    fill(white); 
    stroke(medium);
    rect(TEXT_AREA_X + TEXT_AREA_SIZE_X -20, NAV_BAR_SIZE_Y + (2*STANDARD_BORDER) + DROP_MENU_Y - (textMove / 5), 19, scrollBarLength);
    noStroke();
    //drawing widgets and checking that they are touched
    if (widgetList != null)
    {
      for (int i = 0; i < widgetList.size(); i++)
      { 
        Widget aWidget = (Widget) widgetList.get(i);
        if (aWidget.label.equals("useful"))
        {
          aWidget.clicked(reviewList.get(count).usefulAdded);
        } else if (aWidget.label.equals("funny"))
        {
          aWidget.clicked(reviewList.get(count).funnyAdded);
        } else if (aWidget.label.equals("cool"))
        {
          aWidget.clicked(reviewList.get(count).coolAdded);
        }
        aWidget.draw();
      }
    }
  }

  void drawStars(Review review, int extraY)
  {
    float stars = 0;
    Query starQuery = new Query(review.businessName, review.userName, review.date);
    starQuery.search();
    stars = starQuery.averageStars();
    for (int i = 0; i < stars; i++)
    {
      image(star, STANDARD_BORDER+TEXT_BORDER+(i*STAR_SPACING), NAV_BAR_SIZE_Y+(7*STANDARD_BORDER)+DROP_MENU_Y+TEXT_BORDER + extraY);
    }
  }
} 