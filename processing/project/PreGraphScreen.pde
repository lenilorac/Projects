class PreGraphScreen extends Screen {

  
  PreGraphScreen() {
    super();
    init_widgets();
    
  }
  
  void init_widgets() {
    star.resize(NAV_ICON_SIZE,NAV_ICON_SIZE);
    Widget goStarsGraph, reviewsOverTime, locationByContinent;
    goStarsGraph = new  Widget(200,300, NAV_ICON_SIZE*3,NAV_ICON_SIZE, "Stars", green, black, stdFont, TO_GRAPHS_EVENT, true);
    reviewsOverTime = new  Widget(400,300, NAV_ICON_SIZE*3,NAV_ICON_SIZE, "Reviews Over Time", green, black, stdFont, TO_GRAPHS_EVENT, false);
    widgetList = new ArrayList();
    widgetList.add(goStarsGraph);
    widgetList.add(reviewsOverTime);
  }
  
  void draw() {
    background(white);
    if (widgetList!=null) {
      for(int i=0; i<widgetList.size(); i++)
      { 
        Widget aWidget = (Widget) widgetList.get(i);
        aWidget.draw();
      }
    }
  }
  
}