//Caroline
/*class Pie {
 int xpos, ypos;
 float pwidth, pheight;
 color pcolor;
 String title;
 ArrayList<String> pielabels;
 ArrayList<Float> pievalues;
 float total;
 float newangle;
 float oldangle;
 float currentangle;
 int opacity;
 Screen screen;
 
 Pie(int xpos, int ypos, float pwidth, float pheight, color pcolor, String title, 
 ArrayList<String> chartlabels, ArrayList<Float> pievalues, Screen screen) {
 this.xpos = xpos;
 this.ypos = ypos;
 this.pwidth = pwidth;
 this.pheight = pheight;
 this.pcolor = pcolor;
 this.title = title;
 this.pielabels = chartlabels;
 this.pievalues = pievalues;
 this.screen = screen;
 newangle = 0;
 oldangle = 0;
 currentangle = 0;
 opacity = 80;
 for (float value : pievalues) {
 total += value;
 }
 }
 
 void update() {
 if (currentangle < TWO_PI) {
 currentangle += TWO_PI/200;
 }
 }
 
 void display() {
 newangle = 0;
 oldangle = 0;
 fill(pcolor, opacity);
 arc(xpos, ypos, pwidth, pheight, 0, currentangle);
 stroke(0);
 int i = 0;
 for (float value : pievalues) {
 value = pievalues.get(i);
 String label = pielabels.get(i);
 i++;
 noFill();
 newangle += (value/total) * 2 * PI;
 if (currentangle > newangle) {
 arc(xpos, ypos, pwidth, pheight, oldangle, newangle, PIE);
 
 //tbc
 }
 }
 }
 }
 */