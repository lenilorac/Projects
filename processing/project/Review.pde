//Ruth && He
class Review
{
  String userId, userName, businessID, businessName;
  int stars, index;
  LocalDate date; 
  String text; 
  int useful, funny, cool;
  int textLength, emptyLine = 0;
  char[] textToChar;
  boolean usefulAdded = false, funnyAdded = false, coolAdded = false, isGuestReview=false;

  Review (String userId, String userName, String businessID, String businessName, int stars, LocalDate date, String text, int useful, int funny, int cool, int index) // the formal review
  {
    this.userId = userId;
    this.userName = userName;
    this.businessID = businessID;
    this.businessName = businessName;
    this.stars = stars;
    this.date = date;
    this.text = text;
    this.useful = useful;
    this.funny = funny;
    this.cool = cool;
    this.index = index;
  }

  Review (String userName, String businessName, int stars, String text) // a brand new review
  {
    this.userId = "Guest";
    this.userName = userName;
    this.businessID = getBusinessId(businessName);
    this.businessName = businessName;
    this.stars = stars;
    this.date = getDate();
    this.text = text;
    this.useful = 0;
    this.funny = 0;
    this.cool = 0;
    this.isGuestReview = true;
  }

  Review ( String userName, String businessName, int stars, LocalDate date, String text, int useful, int funny, int cool, int index)
  {
    this.userId = "";
    this.userName = userName;
    this.businessID = "";
    this.businessName = businessName;
    this.stars = stars;
    this.date = date;
    this.text = text;
    this.useful = useful;
    this.funny = funny;
    this.cool = cool;
    this.index = index;
    this.isGuestReview = true;
  }

  // -He    get the length of the new review.
  void getLength()
  {
    textToChar = text.toCharArray();

    for (int i=170; i<textToChar.length; i++) // if has new line length + 65;
    {
      if (textToChar[i]=='\n')
      {
        emptyLine++;
      }
    }

    int emptyLength = emptyLine * 65;
    textLength = text.length();
  }

  // He - get the real date today.
  LocalDate getDate()
  {
    LocalDate now = LocalDate.now();
    return now;
  }

  String toString()
  {
    String text = userName + " " + businessName + " " + stars + " " + date + " " + useful + " " + funny + " " + cool;
    return text;
  }


  // He - search business Id if already have the business in the formal reviews.
  String getBusinessId(String businessName)
  {
    String businessId = "";
    for (int i=0; i<allReviewsList.size(); i++)
    {
      if (businessName.equalsIgnoreCase(allReviewsList.get(i).businessName)) // try to find the business name if in the formal reviews we already have them.
      {
        businessId = allReviewsList.get(i).businessID; // and get their business ID
        return businessId;
      }
    }
    businessId = "Unknown Business"; // else set their business ID to "unknown business"
    return businessId;
  }
}