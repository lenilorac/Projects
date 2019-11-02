//Ruth
class ScatterGraph extends Graph {

  float[] yData;
  float[] xData;
  String title, description;

  ScatterGraph (ArrayList<Integer> chartList, ArrayList<Integer> xDataList, String titlePassed, String xAxis, String yAxis, String description) {
    super(xAxis, yAxis, titlePassed);
    title=titlePassed;
    this.description=description;
    yData = toFloatArray(chartList);
    xData = toFloatArray(xDataList);

    textSize(12);
    lineChart.setData(xData, yData);
    lineChart.showXAxis(true); 
    lineChart.showYAxis(true); 
    lineChart.setMinY(0);

    lineChart.setYFormat("###");  
    lineChart.setXFormat("0000"); 

    lineChart.setPointColour(medium);
    lineChart.setPointSize(5);
    lineChart.setLineWidth(2);
  }

  void drawAxis() {
    textSize(15);
    text(xAxis, SCREENX/3+(2*(SCREENX/25))+(13*SCREENX/75)+(2*STANDARD_BORDER), 6*SCREENY/8 + STANDARD_BORDER);
    int x = SCREENX/3+(2*(SCREENX/25))-(STANDARD_BORDER);
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
    textSize(9);
    lineChart.draw(SCREENX/3+(2*(SCREENX/25)), SCREENY/4, SCREENX/3*2-(2*(SCREENX/25)), SCREENY/2);
    drawAxis();
    fill(120); 
    textSize(25); 
    text(title, (SCREENX/25), 200);
    textSize(14);
    text(description, (SCREENX/25), 200+(SCREENX/100), SCREENX/3-(SCREENX/25), SCREENX/3*2-(SCREENX/25));
    /*
    text("As we can see there are " + Math.round(chartList.get(0)) +  " reviews in " + Math.round(xData[0]) +  " and there are " + Math.round(chartList.get(1)) +  " reviews in " + Math.round(xData[1]) +  " and there are " + Math.round(chartList.get(2)) +  " reviews in " + Math.round(xData[2]) 
     +  " and there are " + Math.round(chartList.get(3)) +  " reviews in " + Math.round(xData[3]) +  " and there are " + Math.round(chartList.get(4)) +  " reviews in " + Math.round(xData[4]) 
     +  " and there are " + Math.round(chartList.get(5)) +  " reviews in " + Math.round(xData[5]) +  " and there are " + Math.round(chartList.get(6)) +  " reviews in " + Math.round(xData[6]) 
     +  " and there are " + Math.round(chartList.get(7)) +  " reviews in " + Math.round(xData[7]) +  " and there are " + Math.round(chartList.get(8)) +  " reviews in " + Math.round(xData[8])
     +  " and there are " + Math.round(chartList.get(9)) +  " reviews in " + Math.round(xData[9]) + ".", (SCREENX/25), 250+(SCREENX/100), SCREENX/3-(SCREENX/25), SCREENX/3*2-(SCREENX/25)); 
     */
    drawWidgets();
  }
}