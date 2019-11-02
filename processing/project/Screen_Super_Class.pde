//Ruth && He && Leo && Caroline
class Screen {
  ArrayList<Widget> widgetList;
  ArrayList<Review> reviewList;
  int count=0;
  boolean reviewPage=false;

  Screen(ArrayList<Review> reviewList)
  {
    this.reviewList = reviewList;
  }

  Screen(Review aReview)
  {
    reviewList = new ArrayList<Review>();
    reviewList.add(aReview);
  }

  Screen()
  {
  }

  void checkScrollBar ()
  {
    if (count < reviewList.size())
    {
      if (TEXT_AREA_SIZE_Y*(reviewList.get(count).textLength-ONE_TEXT_AREA_LENGTH)/ONE_TEXT_AREA_LENGTH>0)
        scrollBarLength = TEXT_SHADE_BOTTOM_Y-(TEXT_AREA_Y+SCREENY/15)-(TEXT_AREA_SIZE_Y*(reviewList.get(count).textLength-ONE_TEXT_AREA_LENGTH)/ONE_TEXT_AREA_LENGTH)/5;
      else
        scrollBarLength = TEXT_SHADE_BOTTOM_Y-(TEXT_AREA_Y+SCREENY/15);
    }
  }

  void checkWidgetEvents() {
    int event;
    editingColor = light;
    submitted = false;
    if (currentScreen.widgetList != null)
    {
      for (int i = 0; i < currentScreen.widgetList.size(); i++)
      { 
        Widget aWidget = (Widget) currentScreen.widgetList.get(i);
        event = aWidget.getEvent(mouseX, mouseY); 
        switch(event)
        {
        case NEXT_EVENT:  // go to the next review and reset scroll bar
          if (currentScreen.count<currentScreen.reviewList.size()) {
            currentScreen.count++;
            textMove = -1;
          }
          break;
        case BACK_EVENT:// go to the before review and reset scroll bar
          if (currentScreen.count >= 1) {
            currentScreen.count--;
            textMove = -1;
          }
          break;
        case TO_ALL_REVIEWS_EVENT:  
          screenNumber = ALL_REVIEWS_SCREEN;
          break;
        case TO_SINGLE_REVIEW_EVENT:
          if(screenNumber == SEARCH_SCREEN)
          {
            fromSearchScreen = true;
            String businessName = searchScreenCP5.get(Textfield.class, "Business Name").getText();
            String reviewerName = searchScreenCP5.get(Textfield.class, "Reviewer Name").getText();
            String afterDate = searchScreenCP5.get(Textfield.class, "Made After Date").getText();
            String beforeDate = searchScreenCP5.get(Textfield.class, "Made Before Date").getText();
            Query currentQuery = new Query(businessName, reviewerName, afterDate, beforeDate);
            ArrayList<Review> results = currentQuery.search();
            if (results.size() >= 1)
            {
              aWidget.updateIndex(results.get(0).index);
            }
          }
          screenNumber = SINGLE_REVIEW_SCREEN; // go to the single review page and record witch review will be displayed
          toSingleReviewPage(aWidget);
          theSingleReviewIndex = aWidget.index;
          break;
        case FUNNY:
          if (allReviewsList.get(reviewIndex).funnyAdded==false) // check if already click the like buttons, if already be clicked than click it again will cancel the liking.
          {
            allReviewsList.get(reviewIndex).funny++;
            allReviewsList.get(reviewIndex).funnyAdded=true;
          } else
          {
            allReviewsList.get(reviewIndex).funny--;
            allReviewsList.get(reviewIndex).funnyAdded=false;
          }

          break;
        case USEFUL:
          if (allReviewsList.get(reviewIndex).usefulAdded==false)
          {
            allReviewsList.get(reviewIndex).useful++;
            allReviewsList.get(reviewIndex).usefulAdded=true;
          } else
          {
            allReviewsList.get(reviewIndex).useful--;
            allReviewsList.get(reviewIndex).usefulAdded=false;
          }

          break;
        case COOL:
          if (allReviewsList.get(reviewIndex).coolAdded==false)
          {
            allReviewsList.get(reviewIndex).cool++;
            allReviewsList.get(reviewIndex).coolAdded=true;
          } else
          {
            allReviewsList.get(reviewIndex).cool--;
            allReviewsList.get(reviewIndex).coolAdded=false;
          }

          break;
        case STAR_ONE_EVENT:  // click on different stars will change those stars to be lighted.
          giveStars = ONE_STAR;
          for (int j=0; j<1; j++)
          {
            currentStar[j] = star1;
          }
          for (int j=1; j<5; j++)
          {
            currentStar[j] = greyStar;
          }
          break;
        case STAR_TWO_EVENT:
          giveStars = TWO_STAR;
          for (int j=0; j<2; j++)
          {
            currentStar[j] = star1;
          }
          for (int j=2; j<5; j++)
          {
            currentStar[j] = greyStar;
          }
          break;
        case STAR_THREE_EVENT:
          giveStars = THREE_STAR;
          for (int j=0; j<3; j++)
          {
            currentStar[j] = star1;
          }
          for (int j=3; j<5; j++)
          {
            currentStar[j] = greyStar;
          }
          break;
        case STAR_FOUR_EVENT:
          giveStars = FOUR_STAR;
          for (int j=0; j<4; j++)
          {
            currentStar[j] = star1;
          }
          for (int j=4; j<5; j++)
          {
            currentStar[j] = greyStar;
          }
          break;
        case STAR_FIVE_EVENT:
          giveStars = FIVE_STAR;
          for (int j=0; j<5; j++)
          {
            currentStar[j] = star1;
          }
          for (int j=5; j<5; j++)
          {
            currentStar[j] = greyStar;
          }
          break;
        case EDITING_EVENT:
          if (clickTextBox == false)
          {
            writeReviewText = "";
            clickTextBox = true;
          }
          editingColor = medium;
          editing = true;
          break;
        case SUBMIT_EVENT:
          if (screenNumber == ADD_REVIEW_SCREEN)
            addReviewScreen.submit();
          break;
        case TO_SPECIFIC_REVIEWS_EVENT:
          screenNumber = SPECIFIC_REVIEWS_SCREEN;
          break;
        case TO_GRAPHS_EVENT:
          println("graphs event");
          if (graphScreen!=null)
            setGraph(aWidget.label, aWidget.secondEvent);
          else
            setGraph(aWidget.label, aWidget.secondEvent);
          break;
        case SEARCH_EVENT:
          String businessName = searchScreenCP5.get(Textfield.class, "Business Name").getText();
          String reviewerName = searchScreenCP5.get(Textfield.class, "Reviewer Name").getText();
          String afterDate = searchScreenCP5.get(Textfield.class, "Made After Date").getText();
          String beforeDate = searchScreenCP5.get(Textfield.class, "Made Before Date").getText();
          Query currentQuery = new Query(businessName, reviewerName, afterDate, beforeDate);
          ArrayList<Review> results = currentQuery.search();
          if (results.size() >= 1)
          {
            searchScreen.hide();
            screenNumber = RESULTS_SCREEN;
            resultsScreen.update(results, currentQuery);
          } else
          {
            searchScreen.noResults();
          }
          break;
        case TO_ADD_REVIEW_EVENT:
          screenNumber = ADD_REVIEW_SCREEN;
          break;
        case NEXT_RESULT_PAGE_EVENT:
          resultsScreen.nextPage();
          break;
        case PREVIOUS_RESULT_PAGE_EVENT:
          resultsScreen.previousPage();
          break;
        case RETURN_EVENT:
          if (screenNumber == RESULTS_SCREEN)
          {
            screenNumber = SEARCH_SCREEN;
          } else
          {
            if (fromResultsScreen)
            {
              screenNumber = RESULTS_SCREEN;
            } else if (fromSearchScreen)
            {
              screenNumber = SEARCH_SCREEN;
            } else
            {
              screenNumber = HOMEPAGE;
            }
          }
          break;
        }
        if (event <= 29 && event >= 22)
        {
          resultsScreen.goToReview(event);
        }
      }
      if (screenNumber == ALL_REVIEWS_SCREEN)
        reviewIndex = currentScreen.count;
      else
        reviewIndex = theSingleReviewIndex;
    }
  }

  void setGraph(String graphName, int graphType) {
    switch(graphType) {
    case BAR_CHART:
      println("type = barchart & " + graphName);
      if (graphName.equals("Stars")) {
        barScreen = new BarGraph(query.countStars(), starNumbers, graphName, "Star Rating", "No. of Reviews", starsDescription);
        screenNumber=STARS_BAR;
        //println("label says stars");
      } else if (graphName.equals("Useful, Funny, Cool")) {
        barScreen = new BarGraph(query.ufcCounter(), ufcList, graphName, "Type of Like", "No. Of Reacts", ufcDescription);
        screenNumber=UFC_BAR;
        //println("label says ufc");
      } else if (graphName.equals("Reviews Over Time")) {
        barScreen = new BarGraph(query.reviewsOverTime(), yearNumbers, graphName, "Year", "No. of Reviews", timeDescription);
        screenNumber=TIME_BAR;
        //println("label says time");
      }
      break;
    case SCATTER_GRAPH:
      println("type = scatter plot & " + graphName);
      if (graphName.equals("Reviews Over Time")) {
        scatterScreen = new ScatterGraph(query.reviewsOverTime(), yearNumbers, graphName, "Year", "No. of Reviews", timeDescription);
        screenNumber=TIME_SCATTER;
      }
      break;
    case PIE_CHART:
      println("type = pie chart & " + graphName);
      if (graphName.equals("Stars")) {
        pieScreen = new PieGraph(query.countStars(), starNumbers, graphName, "No. of Reviews", "Star Rating", starsDescription);
        screenNumber=STARS_PIE;
      } else if (graphName.equals("Useful, Funny, Cool")) {
        pieScreen = new PieGraph(query.ufcCounter(), ufcList, graphName, "Type of Like", "No. Of Reviews", ufcDescription);
        screenNumber=UFC_PIE;
      } else if (graphName.equals("Reviews Over Time")) {
        pieScreen = new PieGraph(query.reviewsOverTime(), yearNumbers, graphName, "Year", "No. of Reviews", timeDescription);
        screenNumber=TIME_PIE;
      }
      break;
    }
  }

  void checkNavBar()
  {
    int event;
    for (int i = 0; i < navigation.widgetList.size(); i++)
    { 
      Widget aWidget = (Widget) navigation.widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      switch(event)
      {
      case TO_HOME_EVENT:
        screenNumber = HOMEPAGE;
        break;
      case TO_SEARCH_EVENT:
        screenNumber = SEARCH_SCREEN;
        break;
      case TO_ALL_REVIEWS_EVENT:  
        screenNumber=ALL_REVIEWS_SCREEN;
        break;
      case TO_ADD_REVIEW_EVENT:
        screenNumber=ADD_REVIEW_SCREEN;
        break;
      }
    }
  }
}