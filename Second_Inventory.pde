// importing libraries
import javax.swing.JOptionPane; // input dialog box
PImage img; // to be able to load an image

String[] Equipment = {""};
String[] Count = {""};
int[] int_count_array = {};

Table History;

// Global variables used on event function
String[] count_input = {""};
int count_int_input;

void setup(){
  // canvas
  size(1500,700);
  background(#FFFFFF);
  
  // loaging image
  img = loadImage("AegisLogo.jpg");
}

void draw(){
  // this allows for the background to be cleared out each loop
  background(#FFFFFF);
  
  // frame + image positioning
  fill(#334CD3);
  rect(0,0,width,170);
  image(img, 25, 40); 
  
  // program title
  textAlign(CENTER);
  textSize(32); 
  fill(#FFFFFF);
  text("IT Asset Inventory", width/2, 170/2); 
  
  // diplay date 
  int d = day();
  int m = month();
  int y = year();
  String ds = String.valueOf(d);
  String ms = String.valueOf(m);
  String ys = String.valueOf(y);
  String Date = ms + "/" + ds + "/" + ys;
  textAlign(LEFT);
  textSize(20);
  text(Date, width-150, 170/2);
  
  // Load Tables
  Equipment = loadStrings("Equipment.csv");
  Count = loadStrings("Count.csv");
  History = loadTable("History.csv","header");
  
  // Processing Tables Set-Up
  int_count_array = int(Count);
  
  // text configurations
  textSize(15);
  fill(0);
  int titlesy = 210;
  
  // display information
  for (int i = 0 ; i < Count.length ; i++){
    
    text(Equipment[i], 30, titlesy);
    text(Count[i], 300, titlesy);
    
    titlesy = titlesy + 24;
  }
  
}

void keyPressed(){
  
   // Date 
  int d = day();
  int m = month();
  int y = year();
  String ds = String.valueOf(d);
  String ms = String.valueOf(m);
  String ys = String.valueOf(y);
  String this_date = ms + "/" + ds + "/" + ys;
  
  String main_dialog_input = JOptionPane.showInputDialog("Enter Case");
  
  if (main_dialog_input == null){
    main_dialog_input = "null"; 
  }
  
  switch(main_dialog_input){
    case "add d6000":
      count_input[0] = JOptionPane.showInputDialog("How many D600 are you adding to inventory ?");
      count_int_input = int(count_input[0]);
      // println(count_int_input); // debug
      
      count_int_input = count_int_input + int_count_array[1];
      // println(count_int_input); // debug
      
      String[] filesave_d6000 = {Count[0],str(count_int_input), Count[2], Count[3], Count[4], Count[5], Count[6]};
      saveStrings("data/Count.csv", filesave_d6000);
      
      TableRow plus_d6000 = History.addRow();
      // quantity
      plus_d6000.setString("Quantity",count_input[0]);
      // Equipment
      plus_d6000.setString("Equipment", "D600");
      // Description
      plus_d6000.setString("Description", "ADD");
      // Date
      plus_d6000.setString("Date", this_date);
      // Save Record
      saveTable(History, "data/History.csv");
 
    break; 
  }
}
