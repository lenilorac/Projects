//Ruth
class Graph extends Screen {

  String xAxis, yAxis;
  ArrayList<Integer> chartList;
  PImage barChartImage, scatterPlot, pieChart;

  void init_images() {
    barChartImage = loadImage("barChartInverted.png");
    barChartImage.resize(2*(SCREENX/15), 2*(SCREENX/15));
    scatterPlot = loadImage("scatterPlotInverted.png");
    scatterPlot.resize(2*(SCREENX/15), 2*(SCREENX/15));
    pieChart = loadImage("pieChartInverted.png");
    pieChart.resize(2*(SCREENX/15), 2*(SCREENX/15));
  }

  void init_widgets(String title) {
    noStroke();
    Widget bar, scatter, pie;
    if (title.equals("Reviews Over Time")) {
      scatter = new  Widget(SCREENX/2, SCREENY-(2*(SCREENX/12))+(SCREENX/100), 2*(SCREENX/15), 2*(SCREENX/15), scatterPlot, title, TO_GRAPHS_EVENT, SCATTER_GRAPH);
      widgetList.add(scatter);
    }
    bar = new  Widget((SCREENX/2)+(SCREENX/100)+(2*(SCREENX/15)), SCREENY-(2*(SCREENX/12))+(SCREENX/100), 2*(SCREENX/15), 2*(SCREENX/15), barChartImage, title, TO_GRAPHS_EVENT, BAR_CHART);
    pie = new  Widget((SCREENX/2)+(2*(SCREENX/100))+(4*(SCREENX/15)), SCREENY-(2*(SCREENX/12))+(SCREENX/100), 2*SCREENX/15, 2*(SCREENX/15), pieChart, title, TO_GRAPHS_EVENT, PIE_CHART);
    widgetList.add(bar);
    widgetList.add(pie);
  }

  Graph(String xAxis, String yAxis, String title) {
    super();
    this.xAxis=xAxis;
    this.yAxis=yAxis;
    widgetList = new ArrayList<Widget>();
    init_images();
    init_lists();
    init_widgets(title);
  }

  void drawWidgets() {
    fill(light);
    rect(0, SCREENY-(2*(SCREENX/12)), SCREENX, SCREENY-(2*(SCREENX/12)));
    for (int i=0; i < widgetList.size(); i++)
    {
      Widget aWidget = (Widget) widgetList.get(i); 
      aWidget.draw();
    }
  }

  int[] toIntArray(ArrayList<Integer> arrayList) {
    int [] array = new int[arrayList.size()];
    for (int i=0; i<arrayList.size(); i++) 
      array[i] = (int) arrayList.get(i);
    return array;
  }

  float[] toFloatArray(ArrayList<Integer> arrayList) {
    ArrayList<Float> floatArrayList = new ArrayList<Float>();
    for (int i=0; i<arrayList.size(); i++) {
      floatArrayList.add(i, (float)arrayList.get(i));
    }
    float [] array = new float[floatArrayList.size()];
    int i = 0;
    for (Float f : floatArrayList) 
      array[i++] = (f != null ? f : Float.NaN);
    return array;
  }

  ArrayList<String> toStringArrayList (ArrayList arrayList) {
    ArrayList<String> stringList = new ArrayList<String>();
    for (int i=0; i<arrayList.size(); i++) {
      stringList.add(i, arrayList.get(i).toString());
    }
    return stringList;
  }

  String[] toStringArray(ArrayList arrayList) {
    String[] stringArray = new String[arrayList.size()];
    for (int i=0; i<arrayList.size(); i++) {
      stringArray[i] = arrayList.get(i).toString();
    }
    return stringArray;
  }
}