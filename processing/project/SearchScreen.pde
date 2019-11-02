//Leo

boolean fromSearchScreen = false;

class SearchScreen extends Screen
{
  boolean searched = false, noResults = false;
  Textfield businessBox, reviewerBox, dateBoxOne, dateBoxTwo;
  int count = 0, maxCount = 200, page, review;

  SearchScreen ()
  {
    super(); 
    reviewPage = false;
    setupSearch();
  }

  void setupSearch()
  {
    widgetList = new ArrayList<Widget>(0);
    businessBox = searchScreenCP5.addTextfield("Business Name")
      .setPosition(STANDARD_BORDER, NAV_BAR_SIZE_Y + LARGE_BORDER).setSize(SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y)
      .setColorBackground(light).setCaptionLabel("").setText("eg. Randy's Flowers").setFont(arial26).setColorValue(grey);
    reviewerBox = searchScreenCP5.addTextfield("Reviewer Name")
      .setPosition(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER).setSize(SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y)
      .setColorBackground(light).setCaptionLabel("").setText("eg. Susanne Waters").setFont(arial26).setColorValue(grey);
    dateBoxOne = searchScreenCP5.addTextfield("Made After Date")
      .setPosition(STANDARD_BORDER, NAV_BAR_SIZE_Y + (3 * LARGE_BORDER) - SEARCHBAR_SIZE_Y).setSize(SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y)
      .setColorBackground(light).setCaptionLabel("").setText("eg. dd-mm-yyyy").setFont(arial26).setColorValue(grey);
    dateBoxTwo = searchScreenCP5.addTextfield("Made Before Date")
      .setPosition(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + (3 * LARGE_BORDER) - SEARCHBAR_SIZE_Y).setSize(SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y)
      .setColorBackground(light).setCaptionLabel("").setText("eg. dd-mm-yyyy").setFont(26).setFont(arial26).setColorValue(grey);
    Widget search = new Widget(STANDARD_BORDER, SCREENY - (4 * STANDARD_BORDER), SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y, "Search", light, medium, white, 26, SEARCH_EVENT, true);
    Widget lucky = new Widget(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, SCREENY - (4 * STANDARD_BORDER), SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y, "I'm Feeling Lucky", light, medium, white, 26, TO_SINGLE_REVIEW_EVENT, true);
    widgetList.add(search);
    widgetList.add(lucky);
  }

  void draw()
  {
    background(white);
    textFont(arial26);
    fill(light);
    text("Business Name:", STANDARD_BORDER, NAV_BAR_SIZE_Y + LARGE_BORDER - 10);
    text("Reviewer Name:", STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER - 10);
    text("Made After Date:", STANDARD_BORDER, NAV_BAR_SIZE_Y + (3 * LARGE_BORDER) - SEARCHBAR_SIZE_Y - 10);
    text("Made Before Date:", STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + (3 * LARGE_BORDER) - SEARCHBAR_SIZE_Y - 10);
    searchScreenCP5.show();
    if (businessBox.isMousePressed())
    {
      businessBox.clear();
      businessBox.setColorValue(white);
    }
    if (reviewerBox.isMousePressed())
    {
      reviewerBox.clear();
      reviewerBox.setColorValue(white);
    }
    if (dateBoxOne.isMousePressed())
    {
      dateBoxOne.clear();
      dateBoxOne.setColorValue(white);
    }
    if (dateBoxTwo.isMousePressed())
    {
      dateBoxTwo.clear();
      dateBoxTwo.setColorValue(white);
    }
    for (int i = 0; i < widgetList.size(); i++)
    {
      widgetList.get(i).draw();
    }
    if (noResults)
    {
      if (count >= maxCount)
      {
        count = 0;
        noResults = false;
      }
      count++;
      fill(red);
      rect(20 + (SEARCHBAR_SIZE_X / 2), NAV_BAR_SIZE_Y + (3.8 * LARGE_BORDER), SEARCHBAR_SIZE_X + 60, SEARCHBAR_SIZE_Y);
      fill(white);
      textSize(26);
      textFont(arial26);
      text("Sorry, no results found!", HALFSCREENX - (1.4 * LARGE_BORDER), NAV_BAR_SIZE_Y + (4 * LARGE_BORDER) + STANDARD_BORDER);
    }
  }

  void noResults()
  {
    noResults = true;
  }

  void hide()
  {
    searchScreenCP5.hide();
  }

  void reset()
  {
    fromSearchScreen = false;
    businessBox.setText("eg. Randy's Flowers");
    reviewerBox.setText("eg. Susanne Waters");
    dateBoxOne.setText("eg. dd-mm-yyyy");
    dateBoxTwo.setText("eg. dd-mm-yyyy");
    businessBox.setColorValue(grey);
    reviewerBox.setColorValue(grey);
    dateBoxOne.setColorValue(grey);
    dateBoxTwo.setColorValue(grey);
    count = 0;
    noResults = false;
  }
} 