//He

boolean clickTextBox = false;   // check if user is typing
boolean submitted = false;     //  check if a review was submitted
boolean hasBlank = false;     //   ckeck if user didn't fill in all the blanks
int formalReviewsNumber;

class AddReviewScreen extends Screen
{ 
  boolean maxLength = false;  // check if the new review hit the length limitation
  Textfield businessNameBox, userNameBox;
  Textfield writtingBox;
  int blankCount = 0, submitCount = 0, maxCount = 200;

  AddReviewScreen()
  {
    super();
    setUpThis();
  }

  void setUpThis()  //set up
  {
    for (int i=0; i<5; i++)
    {
      currentStar[i] = greyStar; // default 0 stars
    }
    widgetList = new ArrayList();
    businessNameBox = addReviewScreenCP5.addTextfield("Business Box")
      .setPosition(STANDARD_BORDER, NAV_BAR_SIZE_Y + LARGE_BORDER).setSize(SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y)
      .setColorBackground(light).setCaptionLabel("").setText("eg. Randy's Flowers").setFont(arial26).setColorValue(grey);
    userNameBox = addReviewScreenCP5.addTextfield("Username Box")
      .setPosition(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER).setSize(SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y)
      .setColorBackground(light).setCaptionLabel("").setText("eg. He Liu").setFont(arial26).setColorValue(grey);
    Widget editingWidget = new Widget(TEXT_AREA_X, 340, TEXT_AREA_SIZE_X, TEXT_AREA_SIZE_Y*3/4, EDITING_EVENT); // when in typing mode , an editing will show on the page.
    Widget submitWidget = new Widget(SCREENX - STANDARD_BORDER - 250, SCREENY - 60, 250, 50, "Submit", grey, red, white, 26, SUBMIT_EVENT, true);                         // create the submit widget
    Widget[] starWidget = new Widget[5];
    starWidget[0] = new Widget(STAR_X, STAR_Y, greyStar.width / 8, greyStar.height / 8, greyStar, star, STAR_ONE_EVENT, "onestar");
    starWidget[1] = new Widget(STAR_X+ greyStar.height / 8 + STAR_Y_SPACING, STAR_Y, greyStar.width / 8, greyStar.height / 8, greyStar, star, STAR_TWO_EVENT, "twostar");
    starWidget[2] = new Widget(STAR_X+ (greyStar.height / 8) * 2 + (STAR_Y_SPACING) * 2, STAR_Y, greyStar.width / 8, greyStar.height / 8, greyStar, star, STAR_THREE_EVENT, "threestar"); // initialization for the stars widget(5)
    starWidget[3] = new Widget(STAR_X+ (greyStar.height / 8) * 3 + (STAR_Y_SPACING) * 3, STAR_Y, greyStar.width / 8, greyStar.height / 8, greyStar, star, STAR_FOUR_EVENT, "fourstar");
    starWidget[4] = new Widget(STAR_X+ (greyStar.height / 8) * 4 + (STAR_Y_SPACING) * 4, STAR_Y, greyStar.width / 8, greyStar.height / 8, greyStar, star, STAR_FIVE_EVENT, "fivestar"); 
    widgetList.add(editingWidget);
    widgetList.add(submitWidget);
    widgetList.add(starWidget[0]);
    widgetList.add(starWidget[1]);   // add those widgets to this screen's widget list.
    widgetList.add(starWidget[2]);
    widgetList.add(starWidget[3]);
    widgetList.add(starWidget[4]);
  }

  void draw()
  {
    background(white);      // draw background
    background(white);
    textFont(arial26);
    fill(light);
    text("Business Name:", STANDARD_BORDER, NAV_BAR_SIZE_Y + LARGE_BORDER - 10);
    text("Reviewer Name:", STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER - 10);
    addReviewScreenCP5.show();  // show business name and user name boxes
    if (businessNameBox.isMousePressed())  // if click on the business name box then clear the text in it.
    {
      businessNameBox.clear();
      businessNameBox.setColorValue(white);
    }
    if (userNameBox.isMousePressed()) // if click on the user name box then clear the text in it.
    {
      userNameBox.clear();
      userNameBox.setColorValue(white);
    }
    fill(editingColor);
    rect(TEXT_AREA_X, 340, TEXT_AREA_SIZE_X, TEXT_AREA_SIZE_Y*3/4); //  draw the text area
    fill(white);
    textFont(arial26);
    textSize(26);
    text(writeReviewText, TEXT_AREA_X + SMALL_BORDER, 340 + SMALL_BORDER, TEXT_AREA_SIZE_X - STANDARD_BORDER, TEXT_AREA_SIZE_Y*3/4 - STANDARD_BORDER);// draw the new text in the area
    if (editing)
    {
      fill(red);
      rect(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + SMALL_BORDER, SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y);
      fill(white);
      textSize(26);
      textFont(arial26);
      text("Currently Editing", STANDARD_BORDER + SEARCHBAR_SIZE_X + 155, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + 50);
    }
    for (int i=1; i < 2; i++)
    {
      Widget aWidget = (Widget) widgetList.get(i);   // only draw the submit and editing widget
      aWidget.draw();
    }    
    image(currentStar[0], STAR_X, STAR_Y, greyStar.width/8, greyStar.height/8);
    image(currentStar[1], STAR_X+greyStar.height/8 + STAR_Y_SPACING, STAR_Y, greyStar.width/8, greyStar.height/8);
    image(currentStar[2], STAR_X+(greyStar.height/8) *2+ (STAR_Y_SPACING) *2, STAR_Y, greyStar.width/8, greyStar.height/8);  //draw those stars
    image(currentStar[3], STAR_X+(greyStar.height/8) *3+ (STAR_Y_SPACING) *3, STAR_Y, greyStar.width/8, greyStar.height/8);
    image(currentStar[4], STAR_X+(greyStar.height/8) *4+ (STAR_Y_SPACING) *4, STAR_Y, greyStar.width/8, greyStar.height/8);
    if (submitted)
    {
      if(submitCount >= maxCount)
      {
        hasBlank = false;
        submitCount = 0;
      }else
        submitCount++;
      fill(medium);
      rect(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + SMALL_BORDER, SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y);
      fill(white);
      textFont(arial26);
      textSize(26);
      fill(white);
      text("Successfully Submitted!", STANDARD_BORDER + SEARCHBAR_SIZE_X + 155, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + 50);  //notice for Successfully submitted
    }
    if (hasBlank)
    {
      if(blankCount >= maxCount)
      {
        hasBlank = false;
        blankCount = 0;
      }else
        blankCount++;
      fill(red);
      rect(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + SMALL_BORDER, SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y);
      fill(white);
      textFont(arial26);
      textSize(26);
      fill(white);
      text("Please Fill All Fields", STANDARD_BORDER + SEARCHBAR_SIZE_X + 155, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + 50);//notice for unsuccessfully submitted
    } 
    if (maxLength)
    {
      fill(red);
      rect(STANDARD_BORDER + SEARCHBAR_SIZE_X + 60, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + SMALL_BORDER, SEARCHBAR_SIZE_X, SEARCHBAR_SIZE_Y);
      fill(white);
      textFont(arial26);
      textSize(26);
      fill(white);
      text("Text Max Length Hit", STANDARD_BORDER + SEARCHBAR_SIZE_X + 155, NAV_BAR_SIZE_Y + LARGE_BORDER + SEARCHBAR_SIZE_Y + 50); // notice for hit the length limitation
    }
  }

  void hide()
  {
    addReviewScreenCP5.hide(); // hide boxes
  }

  void reset()
  {
    for (int i = 0; i < 5; i++)
      currentStar[i] = greyStar;
    clickTextBox = false;
    writeReviewText = "Click here to edit.";  // reset those text in boxes after click back to the add review page.
    businessNameBox.setText("eg. Randy's Flowers");
    userNameBox.setText("eg. He Liu");
    userNameBox.setColorValue(grey);
    businessNameBox.setColorValue(grey);
    hasBlank = false;
  }

  void submit()
  {
    String userName = addReviewScreenCP5.get(Textfield.class, "Username Box").getText();  // store the user name
    String businessName = addReviewScreenCP5.get(Textfield.class, "Business Box").getText();// store the business name
    if (!userName.equals("User Name")&&!userName.equals("")&&!businessName.equals("Business Name")&&!businessName.equals("")&&giveStars!=0)
    {
      Review newReview = new Review(userName, businessName, giveStars, writeReviewText); // create a new review
      allReviewsList.add(newReview); // add it to the allreviewslist
      saveInFile(newReview);// save that review in guestReviews.csv
      giveStars=0; // reset the stars to 0
      writeReviewText = "Click here to edit."; // reset the text
      businessNameBox.setText("eg. Randy's Flowers");
      userNameBox.setText("eg. He Liu");
      for (int j=0; j<5; j++)
      {
        currentStar[j] = greyStar; // set stars back to 5 grey star
      }
      submitted = true;
      hasBlank = false;
      clickTextBox = false;
    } else
    {
      hasBlank = true;
    }
  }

  void saveInFile(Review newReview)
  {
    PrintWriter output;
    output = createWriter("guestReviews.csv");   // rewrite the guestReviews file
    output.println("user_id,user_name,business_id,business_name,stars,date,text,useful,funny,cool"); // print the table head
    for (int i=formalReviewsNumber; i<allReviewsList.size()-1; i++)
    {
      output.println(allReviewsList.get(i).userId+","+allReviewsList.get(i).userName+","+allReviewsList.get(i).businessID+","+allReviewsList.get(i).businessName+","+allReviewsList.get(i).stars+","+allReviewsList.get(i).date+",\""  //print those old guest review.
        +allReviewsList.get(i).text+"\","+allReviewsList.get(i).useful+","+allReviewsList.get(i).funny+","+allReviewsList.get(i).cool);
    }
    output.println(newReview.userId+","+newReview.userName+","+newReview.businessID+","+newReview.businessName+","+newReview.stars+","+newReview.date+",\"" //print the new guest review
      +newReview.text+"\","+newReview.useful+","+newReview.funny+","+newReview.cool);
    output.flush(); 
    output.close();
  }

  int getNewReviewLength()
  {
    int emptyLine=0;
    char[] textToChar = writeReviewText.toCharArray();  // get the new review length so now when hit the limitation

    for (int i=0; i<textToChar.length; i++)
    {
      if (textToChar[i]=='\n')
      {
        emptyLine++;
      }
    }

    int emptyLength = emptyLine * 80;
    int textLength = writeReviewText.length() + emptyLength;
    return textLength;
  }
}