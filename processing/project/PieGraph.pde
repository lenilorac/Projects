//Ruth
class PieGraph extends Graph {

  float sum;
  ArrayList<String> labels;
  int startYLabels;
  int[] angles;
  String title, description;
  color[] fillColor = {#F88017, #E67451, #E56717, #CC6600, #FF7F50, #E78A61, #F87431, #FFDB58, #F9966B, #C04000, #C11B17, #7E3517};

  PieGraph(ArrayList<Integer> anglesArrayList, ArrayList labelsInt, String titlePassed, String xAxis, String yAxis, String description) {
    super(xAxis, yAxis, titlePassed);
    title=titlePassed;
    this.description=description;
    angles = toIntArray(anglesArrayList);
    labels = toStringArrayList(labelsInt);
    if (angles.length>5) 
      startYLabels = 140;
    else
      startYLabels=160;
    calculateSum();
    dataToAngles();
  }

  void calculateSum() {
    sum=0;
    for (int i=0; i<angles.length; i++) {
      sum+=angles[i];
    }
  }

  void dataToAngles () {
    for (int i=0; i<angles.length; i++) {
      int temp = angles[i];
      angles[i] = Math.round((temp/sum)*360);
    }
  }

  //PieChart draw method
  void pieChart(float diameter, int[] data) {
    float lastAngle = 0;
    for (int i=0; i < data.length; i++) {
      if (i>=fillColor.length) {
        float gray = map(i, 0, data.length, 0, 255);
        fill(gray);
      } else {
        fill(fillColor[i]);
      }
      arc(6*(SCREENX/8), 4*(SCREENY/9), diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
    }
  }

  void draw() {
    background(255);
    pieChart(300, angles);
    fill(120); 
    textSize(25);
    text(title, (SCREENX/25), 200);
    textSize(14);
    text(description, (SCREENX/25), 200+(SCREENX/100), SCREENX/3-(SCREENX/25), SCREENX/3*2-(SCREENX/25));
    for (int i=0; i<labels.size(); i++) {
      noStroke();
      fill(120); 
      textSize(14);
      text(labels.get(i), SCREENX/25+STANDARD_BORDER, startYLabels+(2*(SCREENX/12)) + (i*20)); 
      fill(fillColor[i]);
      rect(SCREENX/25+STANDARD_BORDER+50, startYLabels+(2*(SCREENX/12))+(i*20)-8, 7, 7);
    }
    drawWidgets();
  }
}