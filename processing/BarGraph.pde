//Ruth
class BarGraph extends Graph {

  float[] floatArray;
  String[] labelsArray;
  String title;
  String description;

  BarGraph(ArrayList<Integer> dataList, ArrayList labels, String titlePassed, String xAxis, String yAxis, String description) {
    super(xAxis, yAxis, titlePassed);
    title=titlePassed;
    this.description=description;

    floatArray = toFloatArray(dataList);
    labelsArray = toStringArray(labels);
    println(labelsArray[1]);

    textSize(5);
    barChart.setData(floatArray);
    barChart.setBarLabels(labelsArray);
    println(labelsArray[1]);
    barChart.setBarColour(medium);
    barChart.setBarGap(5);
    barChart.setValueFormat("####");
    barChart.setMinValue(0);
    barChart.showValueAxis(true); 
    barChart.showCategoryAxis(true);
  }

  void drawAxis() {
    textSize(15);
    text(xAxis, SCREENX/3+(2*(SCREENX/25))+(13*SCREENX/75)+(2*STANDARD_BORDER), 6*SCREENY/8 + STANDARD_BORDER);
    int x = SCREENX/3+(2*(SCREENX/25))-(2*STANDARD_BORDER);
    int y = 5*SCREENY/8 - STANDARD_BORDER;
    pushMatrix();
    translate(x, y);
    rotate(3*PI/2);
    translate(-x, -y);
    text(yAxis, x, y);
    popMatrix();
  }

  void draw() {
    background(255);
    textSize(12);
    barChart.draw(SCREENX/3+(2*(SCREENX/25)), SCREENY/4, SCREENX/3*2-(2*(SCREENX/25)), SCREENY/2);
    drawAxis();
    fill(120); 
    textSize(25); 
    text(title, (SCREENX/25), 200);
    textSize(14);
    text(description, (SCREENX/25), 200+(SCREENX/100), SCREENX/3-(SCREENX/25), SCREENX/3*2-(SCREENX/25)); 
    drawWidgets();
  }
}