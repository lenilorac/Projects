import java.util.*;
import controlP5.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import org.gicentre.utils.stat.*;
import java.io.*;

ArrayList<Review> allReviewsList;
ArrayList<Review> specificReviewList;
Table table;

int FPS = 60, DURATION = 5 * FPS;
PImage image;

BarChart barChart;
ArrayList<String> starNumbers;
ArrayList<Integer> yearNumbers;
ArrayList<String> ufcList;
String starsDescription;
String timeDescription;
String ufcDescription;
int count = 0, indexCount = 0;
int theSingleReviewIndex, reviewIndex;
int giveStars=0;
PFont stdFont, arial26, arial16;
color black, white, grey, darkgrey, light, dark, medium, editingColor, yellow, green, red;
PImage nextImage;
PImage previousImage;
PImage funny, funny1, useful, useful1, cool, cool1, star, star1, logo;
PImage editingImg, greyStar;
PImage[] currentStar;

ControlP5 searchScreenCP5, addReviewScreenCP5, dropDownListsCP5;
DateTimeFormatter formatter;
StringBuffer stringBuffer;

Screen currentScreen;
SearchScreen searchScreen;
ReviewScreen allReviewsScreen;
ReviewScreen specificReviewsScreen;
ReviewScreen singleReviewScreen;
HomePage homepage;
NavBar navigation;
Graph graphScreen;
AddReviewScreen addReviewScreen;
Query query;
ResultsScreen resultsScreen;
BarGraph barScreen;
ScatterGraph scatterScreen;
PieGraph pieScreen;
XYChart lineChart;
LocalDate barrier;

int screenNumber = 2;

float textMove =- 1;
float scrollBarLength;

String writeReviewText = "Click here to edit.";
boolean editing;

void settings ()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  //intropage setup
  /*image = loadImage("useful.png");
  frameRate(FPS);
  smooth(4);
  imageMode(CENTER);*/
  
  black = color(0);
  white = (#FFFFFF);
  light = color(#FF9C33);
  editingColor = light;
  dark=color(#FF8300);
  medium=color(#FF8B10);
  grey = color(#D3D3D3);
  yellow = color(#FFD700);
  green = color(#9ACD32);
  red = color(#CC0000);
  darkgrey = color(#A9A9A9);

  //graph setup
  barChart = new BarChart(this);
  lineChart = new XYChart(this);
  init_lists();

  //define font
  stdFont = createFont("ArialNova-128.vlw", 32);
  arial26 = createFont("ArialMT-26.vlw", 26);
  arial16 = createFont("ArialMT-16.vlw", 16);
  textFont(stdFont); 

  //define images
  nextImage = loadImage("next.png");
  nextImage.resize(ARROW_SIZE_X, ARROW_SIZE_Y);
  previousImage = loadImage("previous.png");
  previousImage.resize(ARROW_SIZE_X, ARROW_SIZE_Y);
  funny = loadImage("funny.png");
  funny1 = loadImage("funny1.png");
  useful = loadImage("useful.png");
  useful1 = loadImage("useful1.png");
  cool = loadImage("cool.png");
  cool1 = loadImage("cool1.png");
  star = loadImage("star.png");
  star1 = loadImage("star1.png");
  editingImg = loadImage("editing.png");
  greyStar = loadImage("greyStar.png");
  logo = loadImage("logo.png");
  logo.resize(LARGE_BORDER+(2*STANDARD_BORDER), LARGE_BORDER);
  currentStar = new PImage[5];

  //define specific objects
  searchScreenCP5  = new ControlP5(this);
  addReviewScreenCP5 = new ControlP5(this);

  barrier = dateFormatter("02-01-1900");

  //loading of review data -Leo & He //Recent dates and date formatting - Ruth
  allReviewsList = new ArrayList<Review>();
  ArrayList<Integer> recentReviews = new ArrayList <Integer>(10);
  String[] csvArray = loadStrings("reviews.csv");
  String csvFile = Arrays.toString(csvArray);
  allReviewsList = new ArrayList<Review>(0);
  try
  {
    Scanner scanner = new Scanner(csvFile).useDelimiter(",");
    for (int i = 0; i < 10; i++)
      scanner.next();
    while (scanner.hasNext())
    {
      String userID = scanner.next();
      String userName = scanner.next();
      String businessID = scanner.next();
      String businessName = scanner.next();
      businessName = businessName.replace("\"", "");
      String stars = scanner.next();
      int starsInt = Integer.parseInt(stars);
      //String date = scanner.next();
      stringBuffer = new StringBuffer(scanner.next());
      stringBuffer.deleteCharAt(2); stringBuffer.insert(2,"-"); stringBuffer.deleteCharAt(5); stringBuffer.insert(5,"-");
      String date = stringBuffer.toString();
      LocalDate trueDate = dateFormatter(date);
      String text = "";
      boolean getText = true;
      while (getText)
      {
        if (scanner.hasNextInt())
        {
          getText = false;
        } else
        {
          text += scanner.next();
        }
      }
      text = text.replace("\"", "");
      String useful = scanner.next();
      int usefulInt = Integer.parseInt(useful);
      String funny = scanner.next();
      int funnyInt = Integer.parseInt(funny);
      String cool = scanner.next();
      cool = cool.replaceAll("\\D+", "");
      int coolInt = Integer.parseInt(cool);
      Review review = new Review(userID, userName, businessID, businessName, starsInt, trueDate, text, usefulInt, funnyInt, coolInt, indexCount);
      review.getLength();
      allReviewsList.add(review);
      updateRecentReviews(trueDate, indexCount, recentReviews);
      indexCount++;
    }
    scanner.close();
  }
  catch(Exception e)
  {
    //there will never be an exception to catch so we catch 'em all!
  }
  formalReviewsNumber = allReviewsList.size(); // save how many formal reviews we have
  table = loadTable("..\\guestReviews.csv", "header"); // read the guest reviews csv file
  if (table !=null)
  {
    for (int i=0; i < table.getRowCount(); i++) // read line by line
    {
      TableRow row = table.getRow(i);
      LocalDate reviewDate = dateFormatterGuest(row.getString("date"));
      Review review = new Review(row.getString("user_id"), row.getString("user_name"), row.getString("business_id"), row.getString("business_name"), row.getInt("stars"), 
        reviewDate, row.getString("text"), row.getInt("useful"), row.getInt("funny"), row.getInt("cool"), i+indexCount); // read the review by it's header
      review.getLength(); // count it's length
      allReviewsList.add(review); //  add them to the allReviewsList
      updateRecentReviews(reviewDate, i, recentReviews);
    }
  }
  if (allReviewsList.get(0).textLength-ONE_TEXT_AREA_LENGTH>0)
    scrollBarLength = 440 - (allReviewsList.get(0).textLength - ONE_TEXT_AREA_LENGTH) / 5; // compute the scroll bar
  else
    scrollBarLength = 440; 

  //initalising screens
  screenNumber = HOMEPAGE;
  navigation = new NavBar();
  allReviewsScreen = new ReviewScreen(allReviewsList);
  homepage = new HomePage(recentReviews);
  searchScreen = new SearchScreen();
  query = new Query();
  graphScreen = null;
  addReviewScreen = new AddReviewScreen();
  resultsScreen = new ResultsScreen();
  currentScreen = homepage;
}

//Ruth & Leo
void draw()
{
  //image fade in, ERROR
  /*int fc = frameCount % DURATION;
  float opacity = map(fc, 0, DURATION, 0, 0400);
  if (millis()/1000 > 5) {
    tint (-1, opacity);
    image(image, width >>1, height>>1);
  } */
  background(white);
  if (screenNumber == SEARCH_SCREEN)
  {
    searchScreen.draw();
  } else if (screenNumber == RESULTS_SCREEN)
  {
    searchScreen.hide();
    resultsScreen.draw();
  } else if (screenNumber == SINGLE_REVIEW_SCREEN)
  {
    searchScreen.hide();
    singleReviewScreen.draw();
  } else
  {
    fromResultsScreen = false;
    fromSearchScreen = false;
    searchScreen.hide();
    searchScreen.reset();
    resultsScreen.reset();
  }
  if (screenNumber == ADD_REVIEW_SCREEN)
  {
    addReviewScreen.draw();
  } else
  {
    addReviewScreen.hide();
    addReviewScreen.reset();
  }
  switch(screenNumber)
  {
  case HOMEPAGE:
    homepage.draw();
    break;
  case ALL_REVIEWS_SCREEN:
    allReviewsScreen.draw();
    break;
  case SPECIFIC_REVIEWS_SCREEN:
    specificReviewsScreen.draw();
    break;
  case STARS_BAR:
  case TIME_BAR:
  case UFC_BAR:
    barScreen.draw();
    break;
  case STARS_SCATTER:
  case TIME_SCATTER:
  case UFC_SCATTER:
    scatterScreen.draw();
    break;
  case STARS_PIE:
  case TIME_PIE:
  case UFC_PIE:
    pieScreen.draw();
    break; 
  case ADD_REVIEW_SCREEN:
    addReviewScreen.draw();
    break;
  }
  navigation.draw();
}


//Ruth & Leo & He
void mousePressed()
{
  editing = false;
  currentScreen.checkWidgetEvents();
  currentScreen.checkNavBar();

  if (currentScreen.reviewPage == true)
    currentScreen.checkScrollBar();

  switch(screenNumber)   
  {
  case HOMEPAGE:
    currentScreen = homepage;
    break;
  case SEARCH_SCREEN:
    currentScreen = searchScreen;
    break;
  case ALL_REVIEWS_SCREEN:
    currentScreen = allReviewsScreen;
    break;
  case SINGLE_REVIEW_SCREEN:
    currentScreen = singleReviewScreen;
    break;
  case SPECIFIC_REVIEWS_SCREEN:
    currentScreen = specificReviewsScreen;
    break;
  case STARS_BAR:
  case TIME_BAR:
  case UFC_BAR:
    currentScreen=barScreen;
    break;
  case STARS_SCATTER:
  case TIME_SCATTER:
  case UFC_SCATTER:
    currentScreen = scatterScreen;
    break;
  case STARS_PIE:
  case TIME_PIE:
  case UFC_PIE:
    currentScreen = pieScreen;
    break; 
  case ADD_REVIEW_SCREEN:
    currentScreen = addReviewScreen;
    ;
    break;
  case RESULTS_SCREEN:
    currentScreen = resultsScreen;
    break;
  }
}

// He  - move the text using mouse wheel, change the value of textMove
void mouseWheel(MouseEvent event)  
{
  if (currentScreen.reviewPage) // is review page
  {
    if (mouseX >= STANDARD_BORDER && mouseX <= STANDARD_BORDER + 860 && mouseY >= (NAV_BAR_SIZE_Y + (2*STANDARD_BORDER) + DROP_MENU_Y) && mouseY <= (NAV_BAR_SIZE_Y + (2*STANDARD_BORDER) + DROP_MENU_Y + 440))
    {
      if (currentScreen.reviewList.get(currentScreen.count).textLength>ONE_TEXT_AREA_LENGTH) // if text is longer than the text area than it could move
      {
        if (textMove<0)
        {
          if (textMove>-(TEXT_AREA_SIZE_Y*(currentScreen.reviewList.get(currentScreen.count).textLength-ONE_TEXT_AREA_LENGTH)/ONE_TEXT_AREA_LENGTH)) // when it's hit the bottom than the text couldn't be moved down.
            textMove += -event.getCount()*25;  
          else
            textMove=-(TEXT_AREA_SIZE_Y*(currentScreen.reviewList.get(currentScreen.count).textLength-ONE_TEXT_AREA_LENGTH)/ONE_TEXT_AREA_LENGTH)+1;
        } else
          textMove=-1; // when it's hit the head than the text couldn't move above.
      }
    }
  }
}

// He - move the scroll bar when drag it and change the value of textMove
void mouseDragged() // move scroll bar 
{
  if ((TEXT_AREA_Y+SCREENY/15+1-textMove/5>=TEXT_AREA_Y+SCREENY/15)) {  // if the scroll bar hit the bottom then the scroll bar could be moved down
    if (TEXT_AREA_Y+SCREENY/15+1-textMove/5+scrollBarLength<=TEXT_SHADE_BOTTOM_Y) {

      if (mouseX>=TEXT_AREA_X+TEXT_AREA_SIZE_X-20&&mouseX<=TEXT_AREA_X+TEXT_AREA_SIZE_X-1&&mouseY>=TEXT_AREA_Y+SCREENY/15+1-textMove/5&&mouseY<=TEXT_AREA_Y+SCREENY/15+1-textMove/5+scrollBarLength) { // if the scroll bar hit the top then the scroll bar could be moved up
        textMove+=5*(pmouseY-mouseY);   // if the scroll bar is being dragging down than the text move + else text move -
      }
    } else 
    textMove+=1;
  } else 
  textMove+=-1;
}

LocalDate dateFormatter (String date)
{
  formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
  LocalDate enteredDate = null;
  enteredDate = LocalDate.parse(date, formatter);
  return enteredDate;
}

LocalDate dateFormatterGuest (String date) {
  formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  LocalDate enteredDate = null;
  enteredDate = LocalDate.parse(date, formatter);
  return enteredDate;
}

void updateRecentReviews (LocalDate newDate, int indexOfReviewList, ArrayList<Integer> recentReviews)
{
  if (recentReviews.size()==0)
  {
    recentReviews.add(indexOfReviewList);
  } else
  {
    boolean set=false;
    for (int j=0; j<recentReviews.size()&&!set; j++)
    {
      if (newDate.isAfter(allReviewsList.get(recentReviews.get(j)).date))
      {
        recentReviews.add(j, indexOfReviewList);
        set=true;
        if (recentReviews.size() > 10)
          recentReviews.remove(10);
      }
    }
  }
}

// He - use this to type text in the add review page.
void keyPressed()
{
  if (screenNumber==ADD_REVIEW_SCREEN&&editing==true&&addReviewScreen.getNewReviewLength()<=GUEST_REVIEW_LIMITATION )    // if text is not longer than the limitation
  {
    if (key=='\b'&&writeReviewText.length()>=1) // if has any thing in the text then the backspace could be used.
    {
      writeReviewText = writeReviewText.substring(0, writeReviewText.length()-1); // delete a character
    } else if (key != CODED)
    {
      writeReviewText+=key;     // don't write code in text.
      addReviewScreen.maxLength = false;
    }
  } else if (screenNumber==ADD_REVIEW_SCREEN&&editing==true&&addReviewScreen.getNewReviewLength()>=GUEST_REVIEW_LIMITATION ) // if text is longer than the limitation, than only backspace could be used.
  {
    if (key=='\b')
    {
      writeReviewText = writeReviewText.substring(0, writeReviewText.length()-1);
    }
    addReviewScreen.maxLength = true;
  }
}

void mouseMoved()
{
Widget aWidget;
  if (screenNumber == SEARCH_SCREEN)
  {
    aWidget = searchScreen.widgetList.get(0);
    aWidget.hovered(mouseX, mouseY);
    aWidget = searchScreen.widgetList.get(1);
    aWidget.hovered(mouseX, mouseY);
  } else if (screenNumber == RESULTS_SCREEN)
  {
    aWidget = resultsScreen.widgetList.get(7);
    aWidget.hovered(mouseX, mouseY);
    aWidget = resultsScreen.widgetList.get(8);
    aWidget.hovered(mouseX, mouseY);
    aWidget = resultsScreen.widgetList.get(9);
    aWidget.hovered(mouseX, mouseY);
  } else if (screenNumber == SINGLE_REVIEW_SCREEN)
  {
    aWidget = singleReviewScreen.widgetList.get(3);
    aWidget.hovered(mouseX, mouseY);
  } else if (screenNumber == ADD_REVIEW_SCREEN)
  {
    aWidget = addReviewScreen.widgetList.get(1);
    aWidget.hovered(mouseX, mouseY);
  }
  for (int i = 0; i < navigation.widgetList.size(); i++)
  {
    aWidget = (Widget) navigation.widgetList.get(i);
    aWidget.hovered(mouseX, mouseY);
  }
}

void createSpecificReviewsSceen(ArrayList<Review> reviews)
{
  screenNumber = SPECIFIC_REVIEWS_SCREEN;
  specificReviewsScreen = new ReviewScreen(reviews);
}

void toSingleReviewPage(Widget aWidget) 
{
  Review aReview = allReviewsList.get(aWidget.index);
  singleReviewScreen = new ReviewScreen(aReview);
}

void toSingleReviewPage(Review aReview)
{
  singleReviewScreen = new ReviewScreen(aReview);
}

void setGradient(int x, int y, float w, float h, color c1, color c2)
{
  noFill(); // Left to right gradient
  for (int i = x; i <= x+w; i++)
  {
    float inter = map(i, x, x+w, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(i, y, i, y+h);
  }
}

void init_lists()
{
  starNumbers = new ArrayList<String>();
  starNumbers.add("One"); 
  starNumbers.add("Two"); 
  starNumbers.add("Three"); 
  starNumbers.add("Four"); 
  starNumbers.add("Five");
  yearNumbers = new ArrayList<Integer>();
  for (int i=2007; i<2019; i++)
  {
    yearNumbers.add(i);
  }
  ufcList = new ArrayList<String>();
  ufcList.add("Useful"); 
  ufcList.add("Funny"); 
  ufcList.add("Cool");
  starsDescription = "This graph shows the number of businesses that have recieved this star rating.";
  timeDescription = "This graph shows the number of reviews that were written in a certain year";
  ufcDescription = "This graph shows the number of reviews that have recieved a funny, useful or cool rating";
}

void dropDowns (Review aReview)
{
  dropDownListsCP5 = new ControlP5(this);
  ArrayList<Review> reviewsByuser = query.getReviewsByUser(aReview.userId);
  List l = null;
  for (int i=0; i<reviewsByuser.size(); i++)
  {
    l.add(reviewsByuser.get(i).businessName);
  }
  dropDownListsCP5.addScrollableList("Other Reviews by User")
    .setPosition(SCREENX/3, NAV_BAR_SIZE_Y+STANDARD_BORDER)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l)
    ;
  ArrayList<Review> reviewsofBusiness = query.getReviewsOfBusiness(aReview.businessID);
  for (int i=0; i<reviewsByuser.size(); i++)
  {
    l.add(reviewsofBusiness.get(i).businessName);
  }
  dropDownListsCP5.addScrollableList("Other Reviews of this business")
    .setPosition((SCREENX/3)*2, NAV_BAR_SIZE_Y+STANDARD_BORDER)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(l)
    ;
}