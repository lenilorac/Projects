//Leo

boolean fromResultsScreen = false;

class ResultsScreen extends Screen
{
  ArrayList<Review> results;
  int review = 0, page;
  float stars;
  String infoText = "testString";

  ResultsScreen()
  {
    super(); 
    reviewPage = false;
    setupResults();
  }

  void setupResults()
  {
    widgetList = new ArrayList<Widget>(0);
    for (int i = 0, offset = 0; i < 7; i++, offset += 58)
    {
      Widget result = new Widget(LARGE_BORDER * 3, NAV_BAR_SIZE_Y + LARGE_BORDER + offset, SCREENX - (4 * LARGE_BORDER), 58, light, i + 22, true);
      widgetList.add(result);
    }
    Widget next = new Widget(LARGE_BORDER * 3, NAV_BAR_SIZE_Y + LARGE_BORDER + (7 * 58), (SCREENX - (4 * LARGE_BORDER)) / 2, 54, "Previous", light, medium, white, 26, PREVIOUS_RESULT_PAGE_EVENT, true);
    Widget previous = new Widget(LARGE_BORDER * 3 + (SCREENX - (4 * LARGE_BORDER)) / 2, NAV_BAR_SIZE_Y + LARGE_BORDER + (7 * 58), (SCREENX - (4 * LARGE_BORDER)) / 2, 54, "Next", light, medium, white, 26, NEXT_RESULT_PAGE_EVENT, true);
    Widget goBack = new Widget(LARGE_BORDER, NAV_BAR_SIZE_Y + LARGE_BORDER + (7 * 58), 2 * LARGE_BORDER, 54, "Return", grey, darkgrey, white, 26, RETURN_EVENT, true);
    widgetList.add(next);
    widgetList.add(previous);
    widgetList.add(goBack);
  }

  void draw()
  {
    background(white);
    noStroke();
    fill(darkgrey);
    rect(LARGE_BORDER, NAV_BAR_SIZE_Y + LARGE_BORDER - SEARCHBAR_SIZE_Y, 2 * LARGE_BORDER, SEARCHBAR_SIZE_Y);
    fill(grey);
    rect(LARGE_BORDER, NAV_BAR_SIZE_Y + LARGE_BORDER, 2 * LARGE_BORDER, 406);
    fill(black);
    textFont(arial16);
    textSize(16);
    text(infoText, LARGE_BORDER + 10, NAV_BAR_SIZE_Y + LARGE_BORDER + 10, 2 * LARGE_BORDER - 20, SCREENY);
    fill(light);
    rect(LARGE_BORDER * 3, NAV_BAR_SIZE_Y + LARGE_BORDER, SCREENX - (4 * LARGE_BORDER), 406);
    fill(medium);
    rect(LARGE_BORDER * 3, NAV_BAR_SIZE_Y + LARGE_BORDER - SEARCHBAR_SIZE_Y, SCREENX - (4 * LARGE_BORDER), SEARCHBAR_SIZE_Y);
    fill(white);
    textFont(arial26);
    textSize(28);
    text("Results:", (LARGE_BORDER * 3) + (SCREENX - (4 * LARGE_BORDER)) / 2.5, NAV_BAR_SIZE_Y + LARGE_BORDER - (2 * SMALL_BORDER));
    text("Info:", LARGE_BORDER * 1.75, NAV_BAR_SIZE_Y + LARGE_BORDER - (2 * SMALL_BORDER));
    review = (page - 1) * 7;
    for (int i = 0; i < 7; i++)
    {
      if (i + review < results.size())
      {
        widgetList.get(i).displayResultWidget(results.get(i + review));
      } else
      {
        widgetList.get(i).hideResultWidget();
      }
    }
    for (int i = 0; i < widgetList.size(); i++)
    {
      widgetList.get(i).draw();
    }
    drawStars();
  }

  void reset()
  {
    for (int i = 0; i < widgetList.size(); i++)
    {
      widgetList.get(i).hideResultWidget();
    }
    infoText = "";
  }

  void update(ArrayList<Review> results, Query query)
  {
    fromResultsScreen = false;
    int type = query.queryType();
    stars = query.averageStars();
    infoText = query.getInfo(type);
    this.results = results;
    page = 1;
  }

  void nextPage()
  {
    if ((page * 7) <= results.size())
    {
      page++;
    }
  }

  void previousPage()
  {
    if (page > 1)
    {
      page--;
    }
  }

  void drawStars()
  {
    int yOffset = 0;
    if(infoText.length() <= 80)
    {
      yOffset = 25;
    }else if(infoText.length() <= 100)
    {
      yOffset = 45;
    }else if(infoText.length() <= 140)
    {
      yOffset = 85;
    }
    for (int i = 0; i <stars; i++)
    {
      image(star, LARGE_BORDER + (i * 20) + 10, (3 * LARGE_BORDER) + yOffset);
    }
  }

  void goToReview(int number)
  {
    fromResultsScreen = true;
    number -= 22;
    Review review = widgetList.get(number).getReview();
    theSingleReviewIndex = review.index;
    screenNumber = SINGLE_REVIEW_SCREEN;
    toSingleReviewPage(review);
  }
}
