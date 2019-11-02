class Query
{
  ArrayList<Review> reviews = allReviewsList;
  String bName, rName, beforeDate = "/", afterDate = "/";
  LocalDate realBeforeDate, realAfterDate, specificDate;
  int reviewCount = 0;
  boolean blankBusiness, blankName, blankAfterDate, blankBeforeDate, aResult = false;
  //Leo
  Query(String bName, String rName, String afterDate, String beforeDate)
  {
    this.bName = bName;
    this.rName = rName;
    this.afterDate = afterDate;
    this.beforeDate = beforeDate;
  }
  Query(String bName, String rName, LocalDate specificDate)
  {
    this.bName = bName;
    this.rName = rName;
    this.specificDate = specificDate;
  }
  Query(Review review)
  {
    this.bName = review.businessName;
    this.rName = review.userName;
    this.specificDate = review.date;
  }
  Query()
  {
  }
  //Leo
  //method for finding average star rating of a business
    float averageStars()
  {
    float reviewCount = 0, starCount = 0;
    for (int i = 0; i < allReviewsList.size(); i++)
    {
      if(allReviewsList.get(i).businessName.equals(bName))
      {
        int stars = allReviewsList.get(i).stars;
        starCount += stars;
        reviewCount++;
      }
    }
    starCount /= reviewCount;
    starCount = Math.round(starCount);
    return starCount;
  }
  //Ruth
  //method for counting overall stars
  ArrayList<Integer> countStars()
  {
    int oneStar=0, twoStar=0, threeStar=0, fourStar=0, fiveStar=0;
    ArrayList<Integer> starsList = new ArrayList<Integer>();
    for (int i = 0; i < allReviewsList.size(); i++) {
      int stars = allReviewsList.get(i).stars;
      switch(stars) {
        case(ONE_STAR):
        oneStar++;
        break;
        case(TWO_STAR):
        twoStar++;
        break;
        case(THREE_STAR):
        threeStar++;
        break;
        case(FOUR_STAR):
        fourStar++;
        break;
        case(FIVE_STAR):
        fiveStar++;
        break;
      }
    } 
    starsList.add(oneStar); 
    starsList.add(twoStar); 
    starsList.add(threeStar); 
    starsList.add(fourStar); 
    starsList.add(fiveStar);
    return starsList;
  }
  //Ruth
  //method to find reviews over time
  ArrayList<Integer> reviewsOverTime() {
    Integer seven=0, eight=0, nine=0, ten=0, eleven=0, tweleve=0, thirteen=0, fourteen=0, fifteen=0, sixteen=0, seventeen=0, eighteen=0;
    ArrayList<Integer> yearList = new ArrayList<Integer>();
    for (int i = 0; i < allReviewsList.size(); i++) {
      int year = allReviewsList.get(i).date.getYear();
      switch(year) {
        case(2007):
        seven++;
        break;
        case(2008):
        eight++;
        break;
        case(2009):
        nine++;
        break;
        case(2010):
        ten++;
        break;
        case(2011):
        eleven++;
        break;
        case(2012):
        tweleve++;
        break;
        case(2013):
        thirteen++;
        break;
        case(2014):
        fourteen++;
        break;
        case(2015):
        fifteen++;
        break;
        case(2016):
        sixteen++;
        break;
        case(2017):
        seventeen++;
        break;
        case(2018):
        eighteen++;
        break;
      }
    } 
    yearList.add(seven); 
    yearList.add(eight); 
    yearList.add(nine); 
    yearList.add(ten); 
    yearList.add(eleven); 
    yearList.add(tweleve); 
    yearList.add(thirteen); 
    yearList.add(fourteen); 
    yearList.add(fifteen); 
    yearList.add(sixteen); 
    yearList.add(seventeen); 
    yearList.add(eighteen);
    return yearList;
  }
  //Ruth
  //A method to count the number of useful funny and cool
  ArrayList<Integer> ufcCounter() 
  {
    int useful=0, funny=0, cool=0;
    ArrayList<Integer> ufcList = new ArrayList<Integer>();
    for (int i = 0; i < allReviewsList.size(); i++) {
      useful += allReviewsList.get(i).useful;
      funny += allReviewsList.get(i).funny;
      cool += allReviewsList.get(i).cool;
    } 
    ufcList.add(useful); 
    ufcList.add(funny); 
    ufcList.add(cool);
    return ufcList;
  }
  //Ruth
  ArrayList<Review> getReviewsByUser(String userId)
  {
    reviews = allReviewsList;
    ArrayList<Review> reviews = allReviewsList;
    int i=0;
    while ( i<reviews.size() ) {
      if (!reviews.get(i).userId.equals(userId))
        reviews.remove(i);
      else 
      i++;
    }
    if (reviews.size()<1)
      reviews=null;
    return reviews;
  }
  //Ruth
  ArrayList<Review> getReviewsOfBusiness(String businessId)
  {
    reviews = allReviewsList;
    int i=0;
    while (i < reviews.size())
    {
      if (!reviews.get(i).businessID.equals(businessId))
        reviews.remove(i);
      else 
      i++;
    }
    if (reviews.size()<1)
      reviews=null;
    return reviews;
  }
  //Leo
  //method to get an ArrayList of matching reviews
  ArrayList<Review> search()
  {
    reviews = new ArrayList<Review>(0);
    if (specificDate == null)
    {
      blankBusiness = blankString(bName);
      blankName = blankString(rName);
      blankAfterDate = blankString(afterDate);
      blankBeforeDate = blankString(beforeDate);
      realAfterDate = checkDate(afterDate);
      realBeforeDate = checkDate(beforeDate);
      if ((realAfterDate.isBefore(barrier) && !blankAfterDate) || (realBeforeDate.isBefore(barrier) && !blankBeforeDate))
        return reviews;
      if (blankBusiness && blankName && blankAfterDate && blankBeforeDate)
        return reviews;
      reviews = allReviewsList;
      if (!blankBusiness)
        reviews = checkReviews(reviews, bName, BUSINESS_TYPE);
      if (!blankName)
        reviews = checkReviews(reviews, rName, REVIEWER_TYPE);
      if (!blankAfterDate)
        reviews = checkReviews(reviews, realAfterDate, AFTER_DATE);
      if (!blankBeforeDate)
        reviews = checkReviews(reviews, realBeforeDate, BEFORE_DATE);
      return reviews;
    } else
    {
      reviews = checkReviews(allReviewsList, bName, BUSINESS_TYPE);
      reviews = checkReviews(reviews, rName, REVIEWER_TYPE);
      reviews = checkReviews(reviews, specificDate, EXACT_DATE);
      return reviews;
    }
  }
  //Leo
  //method to filter reviews by matching businessName or userName
  ArrayList<Review> checkReviews(ArrayList<Review> reviews, String string, int type)
  {
    ArrayList<Review> temp = new ArrayList<Review>(0);
    Review aReview;
    String data;
    for (int i = 0; i < reviews.size(); i++)
    {
      aReview = reviews.get(i);
      if (type == BUSINESS_TYPE)
        data = aReview.businessName;
      else
        data = aReview.userName;
      if (string.equalsIgnoreCase(data))
      {
        temp.add(aReview);
      }
    }
    return temp;
  }
  //Leo
  //method to filter reviews by matching date range
  ArrayList<Review> checkReviews(ArrayList<Review> reviews, LocalDate date, int type)
  {
    ArrayList<Review> temp = new ArrayList<Review>(0);
    Review aReview;
    LocalDate tempDate;
    for (int i = 0; i < reviews.size(); i++)
    {
      aReview = reviews.get(i);
      tempDate = aReview.date;
      if (type == AFTER_DATE)
      {
        if (tempDate.isAfter(date) || tempDate.equals(date))
          temp.add(aReview);
      } else if(type == BEFORE_DATE)
      {
        if (tempDate.isBefore(date) || tempDate.equals(date))
          temp.add(aReview);
      } else if(type == EXACT_DATE)
      {
        if (tempDate.equals(date))
          temp.add(aReview);
      }
    }
    return temp;
  }
  //Leo
  //Method to determine nature of query, eg. just a business search, just a user search
  int queryType()
  {
    if (!blankString(bName) && blankString(rName) && blankString(afterDate) && blankString(beforeDate))
    {
      return BUSINESS_TYPE;
    } else if (blankString(bName) && !blankString(rName) && blankString(afterDate) && blankString(beforeDate))
    {
      return REVIEWER_TYPE;
    } else if (blankString(bName) && blankString(rName) && !blankString(afterDate) && blankString(beforeDate))
    {
      return AFTER_DATE;
    } else if (blankString(bName) && blankString(rName) && blankString(afterDate) && !blankString(beforeDate))
    {
      return BEFORE_DATE;
    } else if (blankString(bName) && blankString(rName) && !blankString(afterDate) && !blankString(beforeDate))
    {
      return DATE_RANGE;
    } else if (!blankString(bName) && !blankString(rName) && blankString(afterDate) && blankString(beforeDate))
    {
      return BUSINESS_REVIEWER_TYPE;
    } else if (!blankString(bName) && blankString(rName) && !blankString(afterDate) && blankString(beforeDate))
    {
      return BUSINESS_AFTER_DATE;
    } else if (!blankString(bName) && blankString(rName) && blankString(afterDate) && !blankString(beforeDate))
    {
      return BUSINESS_BEFORE_DATE;
    } else if (!blankString(bName) && blankString(rName) && !blankString(afterDate) && !blankString(beforeDate))
    {
      return BUSINESS_DATE_RANGE;
    } else if (blankString(bName) && !blankString(rName) && !blankString(afterDate) && blankString(beforeDate))
    {
      return REVIEWER_AFTER_DATE;
    } else if (blankString(bName) && !blankString(rName) && blankString(afterDate) && !blankString(beforeDate))
    {
      return REVIEWER_BEFORE_DATE;
    } else if (blankString(bName) && !blankString(rName) && !blankString(afterDate) && !blankString(beforeDate))
    {
      return REVIEWER_DATE_RANGE;
    } else if (!blankString(bName) && !blankString(rName) && !blankString(afterDate) && blankString(beforeDate))
    {
      return BUSINESS_REVIEWER_AFTER_DATE;
    } else if (!blankString(bName) && !blankString(rName) && blankString(afterDate) && !blankString(beforeDate))
    {
      return BUSINESS_REVIEWER_BEFORE_DATE;
    } else if (!blankString(bName) && !blankString(rName) && !blankString(afterDate) && !blankString(beforeDate))
    {
      return BUSINESS_REVIEWER_DATE_RANGE;
    }
    return 0;
  }
  //Leo
  boolean blankString(String string)
  {
    if (string.equals(""))
    {
      return true;
    } else if(string.equals("eg. Randy's Flowers"))
    {
      return true;
    } else if (string.equals("eg. Susanne Waters"))
    {
      return true;
    } else if (string.equals("eg. dd-mm-yyyy"))
    {
      return true;
    } else
    {
      return false;
    }
  }
  //Leo
  //Method to process date String input or date LocalDate input
  LocalDate checkDate(String date)
  {
    LocalDate realDate = stringToDate(date);
    return realDate;
  }
  //Leo
  LocalDate stringToDate(String date)
  {
    LocalDate result;
    try
    {  
      result = dateFormatter(date);
    }
    catch(Exception e)
    {
      date = "01-01-1900";
      result = dateFormatter(date);
    }
    return result;
  }
  //Leo
  //Method to return relevant information for display on the results page
  String getInfo(int type)
  {
    String info = "";
    switch(type)
    {
    case BUSINESS_TYPE:
      info = bName + " has had " + reviewCount + " reviews, with an average star rating of:";
      break;
    case REVIEWER_TYPE:
      info = "Users by the name " + rName + " have made " + reviewCount + " reviews, giving an average star rating of:";
      break;
    case AFTER_DATE:
      info = reviewCount + " reviews have been made since " + realAfterDate + ", with an average star rating of:";
      break;
    case BEFORE_DATE:
      info = reviewCount + " reviews have been made before " + realBeforeDate + ", with an average star rating of:";
      break;
    case DATE_RANGE:
      info = reviewCount + " reviews have been made between " + realBeforeDate + " and " + realAfterDate + ", with an average star rating of:";
      break;
    case BUSINESS_REVIEWER_TYPE:
      info =  "Users by the name " + rName + " have made " + reviewCount + " reviews about " + bName + ", with an average star rating of:";
      break;
    case BUSINESS_AFTER_DATE:
      info = bName + " has had " + reviewCount + " reviews since " + realAfterDate + ", with an average star rating of:";
      break;
    case BUSINESS_BEFORE_DATE:
      info = bName + " has had " + reviewCount + " reviews before " + realBeforeDate + ", with an average star rating of:";
      break;
    case BUSINESS_DATE_RANGE:
      info = bName + " has had " + reviewCount + " reviews bewteen " + realBeforeDate + " and " + realAfterDate + ", with an average star rating of:";
      break;
    case REVIEWER_AFTER_DATE:
      info = "Users by the name " + rName + " have made " + reviewCount + " reviews since " + realAfterDate + ", with an average star rating of:";
      break;
    case REVIEWER_BEFORE_DATE:
      info = "Users by the name " + rName + " have made " + reviewCount + " reviews before " + realBeforeDate + ", with an average star rating of:";
      break;
    case REVIEWER_DATE_RANGE:
      info = "Users by the name " + rName + " have made " + reviewCount + " reviews bewteen " + realBeforeDate + " and " + realAfterDate + ", with an average star rating of:";
      break;
    case BUSINESS_REVIEWER_AFTER_DATE:
      info = "Users by the name " + rName + " have made " + reviewCount + " reviews about " + bName + " since " + realAfterDate + ", with an average star rating of:";
      break;
    case BUSINESS_REVIEWER_BEFORE_DATE:
      info = "Users by the name " + rName + " have made " + reviewCount + " reviews about " + bName + " before " + realBeforeDate + ", with an average star rating of:";
      break;
    case BUSINESS_REVIEWER_DATE_RANGE:
      info = "Users by the name " + rName + " have made " + reviewCount + " reviews about " + bName + " between " + realBeforeDate + " and " + realAfterDate + ", with an average star rating of:";
      break;
    }
    return info;
  }
}