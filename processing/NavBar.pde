//Leo
class NavBar
{ 
  ArrayList widgetList;
  PImage homeImage, searchImage, reviewImage, graphImage, addImage, homeImageHover, searchImageHover, reviewImageHover, graphImageHover, addImageHover;

  NavBar()
  {
    //these widgets are always visible -Leo
    Widget goHomeWidget, goSearchWidget, goReviewWidget, goAddReviewWidget;
    homeImage = loadImage("home.png");
    searchImage = loadImage("search.png");
    reviewImage = loadImage("reviews.png");
    graphImage = loadImage("graphs.png");
    addImage = loadImage("add.png");
    homeImageHover = loadImage("homeHover.png");
    searchImageHover = loadImage("searchHover.png");
    reviewImageHover = loadImage("reviewsHover.png");
    graphImageHover = loadImage("graphsHover.png");
    addImageHover = loadImage("addHover.png");
    goHomeWidget = new Widget(50, (NAV_BAR_SIZE_Y/3), 63, NAV_ICON_SIZE_Y, homeImage, homeImageHover, TO_HOME_EVENT, "goHome");
    goReviewWidget = new Widget((50 * 2) + 63, (NAV_BAR_SIZE_Y/3), 92, NAV_ICON_SIZE_Y, reviewImage, reviewImageHover, TO_ALL_REVIEWS_EVENT, "goReviews");
    goSearchWidget = new Widget((50 * 3) + 63 + 92, (NAV_BAR_SIZE_Y/3), 76, NAV_ICON_SIZE_Y, searchImage, searchImageHover, TO_SEARCH_EVENT, "goSearch");
    goAddReviewWidget = new Widget((50 * 4) + 63 + 92 + 76, (NAV_BAR_SIZE_Y/3), 138, NAV_ICON_SIZE_Y, addImage, addImageHover, TO_ADD_REVIEW_EVENT, "goAdd");
    widgetList = new ArrayList();
    widgetList.add(goHomeWidget);
    widgetList.add(goSearchWidget);
    widgetList.add(goReviewWidget);
    widgetList.add(goAddReviewWidget);
  }

  void draw()
  {
    //drawing our consistent navigation bar
    fill(medium);
    noStroke();
    setGradient(0, 0, (float)SCREENX, (float)NAV_BAR_SIZE_Y, light, dark);
    image(logo, (SCREENX-((SCREENX/12)+(2*(SCREENX/25))+SCREENX/100)), 0);
    for (int i = 0; i < widgetList.size(); i++)
    { 
      Widget aWidget = (Widget) widgetList.get(i); 
      aWidget.draw();
    }
  }
} 