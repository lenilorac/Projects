//Ruth
class HomePage extends Screen
{
  ArrayList<Integer> recentReviews;
  PImage barChartImage, scatterPlot, pieChart;

  HomePage(ArrayList<Integer> recentReviews)
  {
    super();
    reviewPage = false;
    this.recentReviews = recentReviews;
    widgetList = new ArrayList<Widget>();
    barChartImage = loadImage("starGraph.png");
    barChartImage.resize(SCREENX/15, SCREENX/15);
    scatterPlot = loadImage("timeGraph.png");
    scatterPlot.resize(SCREENX/15, SCREENX/15);
    pieChart = loadImage("ufcGraph.png");
    pieChart.resize(SCREENX/15, SCREENX/15);
    init_widgets();
  }
  void init_widgets()
  {
    Widget widgetRecentReviews;
    for (int i=0; i<recentReviews.size(); i++) {
      widgetRecentReviews = new Widget(STANDARD_BORDER, 150 + (50*i), SCREENX/5*3, 50, i+1 + ". " + allReviewsList.get(recentReviews.get(i)).businessName + " by " + allReviewsList.get(recentReviews.get(i)).userName + " on " + allReviewsList.get(recentReviews.get(i)).date, light, white, 16, TO_SINGLE_REVIEW_EVENT, recentReviews.get(i));
      widgetList.add(widgetRecentReviews);
    }
    Widget goStarsGraph, reviewsOverTime, ufc;
    goStarsGraph = new  Widget(SCREENX-((3*(SCREENX/15))+(3*STANDARD_BORDER/4)), NAV_BAR_SIZE_Y+STANDARD_BORDER+STANDARD_BORDER, 3*(SCREENX/15), 3*(SCREENX/15), barChartImage, "Stars", TO_GRAPHS_EVENT, PIE_CHART);
    reviewsOverTime = new  Widget(SCREENX-((3*(SCREENX/15))+(3*STANDARD_BORDER/4)), NAV_BAR_SIZE_Y+LARGE_BORDER+SMALL_BORDER, 3*(SCREENX/15), 3*(SCREENX/15), scatterPlot, "Reviews Over Time", TO_GRAPHS_EVENT, PIE_CHART);
    ufc = new  Widget(SCREENX-((3*(SCREENX/15))+(3*STANDARD_BORDER/4)), NAV_BAR_SIZE_Y+(2*LARGE_BORDER)+SMALL_BORDER, 3*(SCREENX/15), 3*(SCREENX/15), pieChart, "Useful, Funny, Cool", TO_GRAPHS_EVENT, PIE_CHART);
    widgetList.add(goStarsGraph);
    widgetList.add(reviewsOverTime);
    widgetList.add(ufc);
  } 

  void draw()
  {
    background(white);
    noStroke();
    fill(light);
    textFont(arial26);
    textSize(26);
    text("Recent Reviews", SCREENX/5 - SMALL_BORDER, 140);
    fill(grey); 
    rect(SCREENX-(SCREENX/4), NAV_BAR_SIZE_Y, SCREENX, SCREENY); 
    fill(white);

    for (int i=0; i < widgetList.size(); i++)
    {
      Widget aWidget = (Widget) widgetList.get(i); 
      aWidget.draw();
      if (i>=recentReviews.size()) {
        int y=aWidget.y+25;
        if (aWidget.label.length()>15) {
          y=aWidget.y+5;
        }
        text(aWidget.label, aWidget.x+SCREENX/15+SMALL_BORDER, y, 140, 100);
      }
    }
    text("Data Graphs", SCREENX-((3*(SCREENX/15))+(3*STANDARD_BORDER/4)), 140);
  }
}