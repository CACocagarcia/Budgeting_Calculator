import javax.swing.JOptionPane; 
/*---------------------- -------------------------------------------*/
Table Weekly_Income;
float[] weekly_income_array_size;
/*------------------------------------------------------------------*/
/*-----------------------------------------------------------------*/
Table Weekly_Expenses_Amount_Table;
float[] weekly_expenses_array_size;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
Table Transactions_Name;
Table Transactions_Date;
Table Transactions_Amount;

String[] transactions_name_array_size;
String[] transactions_date_array_size;
String[] transactions_amount_array_size; 
float[] transactions_amountfloat_array_size; 
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
String[] title_names = {""};
/*--------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
String[] weekly_income_input = {""};
String weekly_income_output = "";
int weekly_income_output_int = 0; 
int estimated_monthly_income = 0;
String estimated_monthly_income_str = "";
int mmonthly = 0;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
// For Swtich Cases
String[] weekly_expenses_array_size_0 = {""};
String[] weekly_expenses_array_size_1 = {""};
String[] weekly_expenses_array_size_2 = {""};
String[] weekly_expenses_array_size_3 = {""};
String[] weekly_expenses_array_size_4 = {""};
String[] weekly_expenses_array_size_5 = {""};
/*------------------------------------------------------------------*/
// For Switch Cases
String[] RideShare_weekly_expenses_input = {""};
String[] Food_weekly_expenses_input = {""};
String[] Entertainment_weekly_expenses_input = {""};
String[] Rent_monthly_expenses_input = {""};
String[] Phone_monthly_expenses_input = {""}; 
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
float remaining_weekly = 0;
float remaining_monthly = 0;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------- */
//// BELOW IS FOR ADDING THE DAILY TRANSACTIONS
String transaction_name_input ;
String transaction_date_input ;
String transaction_amount_input ; 
/*------------------------------------------------------------------------------------------------------- */
float rideshare_sum = 0;
float food_sum = 0;
float entertainment_sum = 0;
float total_sum ; 

float rideshare_comp = 0;
float food_comp = 0;
float entertainment_comp = 0;
float total_comp ; 
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
void setup() {
  size(1200, 600);
}
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
void draw() {
  loadData();
  background(0);

  /*--------------------------------- MAIN TITLES -------------*/
  textAlign(CENTER);
  stroke(10); 
  text("Budgetting Calculator", width/2, 50);

  textAlign(LEFT);
  text("Weekly Income: $", 75, 100);
  text("Monthly Income: $", 250, 100);
  text("Record Transactions", 830, 100);

  textAlign(LEFT);
  text("Weekly Expenses", 75, 150);
  text("Monthly Expenses", 320, 150);
  text("Weekly Sum of Expenses", 75, 375);
  text("Comparison", 320, 375);

  /*--------------------------------- WEEKLY EXPENSES TITLES -------------*/
  int y = 25;
  String[] name_weekly_expenses = {"RideShare", "Food", "Entertainment", "Rent", "Phone", "TOTAL", "REMAINING"} ;
  title_names = name_weekly_expenses ; 
  for (int i = 0; i < name_weekly_expenses.length; i++) {
    text(name_weekly_expenses[i], 75, 150 + y);
    text(name_weekly_expenses[i], 320, 150 + y);
    text(name_weekly_expenses[i], 75, 375 + y);
    text(name_weekly_expenses[i], 320, 375 + y); 
    y = y + 25;
  }

  /*--------------------------------- DISPLAY OF Weekly Income Information -------------*/
  text(weekly_income_array_size[0], 175, 100);
  mmonthly = int(weekly_income_array_size[0]*4);
  text(mmonthly, 353, 100);

  /*--------------------------------- DISPLAY OF Second Table Information -------------*/
  int yy = 25;
  float monthly_rent_to_weekly = 0; 
  float monthly_phone_to_weekly = 0;
  float weekly_rideshare_to_monthly = 0;
  float weekly_food_to_monthly = 0;
  float weekly_entertainment_to_monthly = 0;
  float weekly_expenses_sum = 0;
  float monthly_expenses_sum = 0;
  
  float food_comp = 0;
  float ride_comp = 0;
  float ent_comp = 0; 

  //loading table
  Weekly_Expenses_Amount_Table = loadTable("Weekly_Expenses_Amount.tsv");

  // size of the array will be the number of rows in the table
  weekly_expenses_array_size = new float[Weekly_Expenses_Amount_Table.getRowCount()];

  //Accessing data by iteration
  for (int i = 0; i < Weekly_Expenses_Amount_Table.getRowCount(); i++) {
    weekly_expenses_array_size[i] = Weekly_Expenses_Amount_Table.getFloat(i, 0);

    if (weekly_expenses_array_size[i] == weekly_expenses_array_size[3]) {
      monthly_rent_to_weekly = weekly_expenses_array_size[i] / 4 ; 
      text("$ " + monthly_rent_to_weekly, 210, 150 + yy);
      // this is for the sum of weekly expenses input table
      text("$ " + monthly_rent_to_weekly, 210, 475);
      // blank
      text("$" + weekly_expenses_array_size[3], 467, 150 + yy);
      yy = yy + 25;
    } else if (weekly_expenses_array_size[i] == weekly_expenses_array_size[4]) {
      monthly_phone_to_weekly = weekly_expenses_array_size[i] / 4;
      text("$ " + monthly_phone_to_weekly, 210, 150 + yy);
      // this is for the sum of weekly expenses input table
      // blank
      text("$ " + monthly_phone_to_weekly, 210, 500);
      text("$" + weekly_expenses_array_size[4], 467, 150 + yy);
      yy = yy + 25;
    } else if (weekly_expenses_array_size[i] == weekly_expenses_array_size[0]) {
      weekly_rideshare_to_monthly = weekly_expenses_array_size[i] * 4;
      text("$ " + weekly_expenses_array_size[0], 210, 150 + yy);
      text("$" + weekly_rideshare_to_monthly, 467, 150 + yy); 
      // comparison
      ride_comp =  weekly_expenses_array_size[i] - rideshare_sum; 
      text("$ " + ride_comp, 467, 400);
      yy = yy + 25;
    } else if (weekly_expenses_array_size[i] == weekly_expenses_array_size[1]) {  
      weekly_food_to_monthly = weekly_expenses_array_size[i] * 4;
      text("$ " + weekly_expenses_array_size[1], 210, 150 + yy);
      text("$ " + weekly_food_to_monthly, 467, 150 + yy);
      // comparison
      food_comp = weekly_expenses_array_size[i] - food_sum ;
      text("$ " + food_comp, 467, 425);
      yy = yy + 25;
    } else if (weekly_expenses_array_size[i] == weekly_expenses_array_size[2]) {
      weekly_entertainment_to_monthly = weekly_expenses_array_size[i] * 4;
      text("$ " + weekly_expenses_array_size[2], 210, 150 + yy);
      text("$" + weekly_entertainment_to_monthly, 467, 150 + yy);
      // comparison 
      ent_comp = weekly_expenses_array_size[i] - entertainment_sum; 
      text("$ " + ent_comp, 467, 450);
      yy = yy + 25;
    } else {
      text("$ " + weekly_expenses_array_size[i], 210, 150 + yy);
      yy = yy + 25;
    }
    monthly_expenses_sum = weekly_rideshare_to_monthly + weekly_food_to_monthly + weekly_entertainment_to_monthly + weekly_expenses_array_size[3] + weekly_expenses_array_size[4] ; 
    weekly_expenses_sum = weekly_expenses_array_size[0]+weekly_expenses_array_size[1]+weekly_expenses_array_size[2]+monthly_rent_to_weekly+monthly_phone_to_weekly ;
  }
  //println(weekly_expenses_sum);
  text("$ " + weekly_expenses_sum, 210, 300);
  text("$ " + monthly_expenses_sum, 467, 300);
  remaining_weekly = floor(weekly_income_array_size[0] - weekly_expenses_sum);
  remaining_monthly = floor(mmonthly - monthly_expenses_sum);
  text("$ " + remaining_weekly, 210, 325);
  text("$ " + remaining_monthly, 467, 325);
  /*------------------------------------------------------------------------------------------------------- */
  /*------------------------------------------------------------------------------------------------------- */
  /*--------------------------------------------- Daily Transactions Tables ----------------------------*/
  //loading table
  Transactions_Name = loadTable("transactions_name.tsv");
  Transactions_Date = loadTable("transactions_date.tsv");
  Transactions_Amount = loadTable("transactions_amount.tsv");

  // size of the array will be the number of rows in the table
  transactions_name_array_size = new String[Transactions_Name.getRowCount()];
  transactions_date_array_size = new String[Transactions_Date.getRowCount()];
  transactions_amount_array_size = new String[Transactions_Amount.getRowCount()];
  transactions_amountfloat_array_size = new float[Transactions_Amount.getRowCount()];
  int dty = 0 ; 
  int dty_total = 0;
  float transactions_sum = 0; 
  for (int i = 0; i < Transactions_Amount.getRowCount(); i++) {
    transactions_name_array_size[i] = Transactions_Name.getString(i, 0);
    transactions_date_array_size[i] = Transactions_Date.getString(i, 0);
    transactions_amount_array_size[i] = Transactions_Amount.getString(i, 0);
    transactions_amountfloat_array_size[i] = Transactions_Amount.getFloat(i, 0);

    text(transactions_name_array_size[i], 790, 150 + dty ) ;
    text(transactions_date_array_size[i], 900, 150 + dty ) ;
    text(transactions_amount_array_size[i], 980, 150 + dty ) ;

    transactions_sum += transactions_amountfloat_array_size[i]; 
    dty = dty + 25;
    dty_total = i + 1;
  }
  /*----------------------------------------------------------------*/
  if (dty_total == Transactions_Amount.getRowCount()) {
    text("TOTAL", 790, dty + 150); 
    text("$ " + transactions_sum, 980, dty + 150);

    float sumoftotals  = food_sum + rideshare_sum + entertainment_sum + monthly_rent_to_weekly + monthly_phone_to_weekly; 
    float remainingoftotals = weekly_income_array_size[0] - sumoftotals; 

    text("$ " + rideshare_sum, 210, 400);
    text("$ " + food_sum, 210, 425);
    text("$ " + entertainment_sum, 210, 450);
    text("$ " + sumoftotals, 210, 525);
    text("$ " + remainingoftotals, 210, 550);
    
    float comp_tot = food_comp + ride_comp + ent_comp;
    text("$ " + comp_tot, 467, 525); 
  } else {
    println("sum is not out");
  }

  /*------------------------------------------------------------------------------------------------------- */
  /*--------------------------------------- Closing Void Draw ---------------------------------------------------------------- */
}
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
void loadData() {
  //loading the table
  Weekly_Income = loadTable("Weekly_Income_Table.tsv");
  // size of the array will be the number of rows in the table
  weekly_income_array_size = new float[Weekly_Income.getRowCount()];
  //println(weekly_income_array_size.length); 
  // Accessing data by iteration
  for (int i = 0; i < Weekly_Income.getRowCount(); i++) {
    weekly_income_array_size[i] = Weekly_Income.getFloat(i, 0);
  }
}
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */
/*------------------------------------------------------------------------------------------------------- */

void keyPressed() {

  String main_dialog_input = JOptionPane.showInputDialog("Enter Case");

  if (main_dialog_input == null) {
    main_dialog_input = "null" ;
  }

  switch(main_dialog_input) {
  case "Weekly Income":
    weekly_income_input[0]  = JOptionPane.showInputDialog("Enter Weekly Income");
    weekly_income_output = weekly_income_input[0] ;
    weekly_income_output_int = int(weekly_income_output);
    estimated_monthly_income = weekly_income_output_int * 4;
    estimated_monthly_income_str = str(estimated_monthly_income) ;
    String[] weekly_income_filesave = {weekly_income_input[0]};
    saveStrings("Weekly_Income_Table.tsv", weekly_income_filesave);
    break;
  case "Weekly RideShare": 
    RideShare_weekly_expenses_input[0] = JOptionPane.showInputDialog("Enter Weekly Budget for RideShare");
    weekly_expenses_array_size_0[0] = str(weekly_expenses_array_size[0]);
    weekly_expenses_array_size_0[0] = RideShare_weekly_expenses_input[0];
    String[] weekly_expenses_amount_filesave = {weekly_expenses_array_size_0[0], str(weekly_expenses_array_size[1]), str(weekly_expenses_array_size[2]), str(weekly_expenses_array_size[3]), str(weekly_expenses_array_size[4])};
    saveStrings("Weekly_Expenses_Amount.tsv", weekly_expenses_amount_filesave);
    break;
  case "Weekly Food":
    Food_weekly_expenses_input[0] = JOptionPane.showInputDialog("Enter Weekly Budget for Food");
    weekly_expenses_array_size_1[0] = str(weekly_expenses_array_size[1]);
    weekly_expenses_array_size_1[0] = Food_weekly_expenses_input[0] ; 
    String[] weekly_expenses_amount_filesave1 = {str(weekly_expenses_array_size[0]), weekly_expenses_array_size_1[0], str(weekly_expenses_array_size[2]), str(weekly_expenses_array_size[3]), str(weekly_expenses_array_size[4])};
    saveStrings("Weekly_Expenses_Amount.tsv", weekly_expenses_amount_filesave1);
    break; 
  case "Weekly Entertainment":
    Entertainment_weekly_expenses_input[0] = JOptionPane.showInputDialog("Enter Weekly Budget for Entertainment");
    weekly_expenses_array_size_2[0] = str(weekly_expenses_array_size[2]);
    weekly_expenses_array_size_2[0] = Entertainment_weekly_expenses_input[0] ;
    String[] weekly_expenses_amount_filesave2 = {str(weekly_expenses_array_size[0]), str(weekly_expenses_array_size[1]), weekly_expenses_array_size_2[0], str(weekly_expenses_array_size[3]), str(weekly_expenses_array_size[4])};
    saveStrings("Weekly_Expenses_Amount.tsv", weekly_expenses_amount_filesave2);
    break;
  case "Monthly Rent":
    Rent_monthly_expenses_input[0] = JOptionPane.showInputDialog("Enter Your Monthly Rent");
    weekly_expenses_array_size_3[0] = str(weekly_expenses_array_size[3]);
    weekly_expenses_array_size_3[0] = Rent_monthly_expenses_input[0];
    String[] weekly_expenses_amount_filesave3 = {str(weekly_expenses_array_size[0]), str(weekly_expenses_array_size[1]), str(weekly_expenses_array_size[2]), weekly_expenses_array_size_3[0], str(weekly_expenses_array_size[4])};
    saveStrings("Weekly_Expenses_Amount.tsv", weekly_expenses_amount_filesave3);
    break; 
  case "Monthly Phone":
    Phone_monthly_expenses_input[0] = JOptionPane.showInputDialog("Enter Your Monthly Phone Bill");
    weekly_expenses_array_size_4[0] = str(weekly_expenses_array_size[4]);
    weekly_expenses_array_size_4[0] = Phone_monthly_expenses_input[0];
    String[] weekly_expenses_amount_filesave4 = {str(weekly_expenses_array_size[0]), str(weekly_expenses_array_size[1]), str(weekly_expenses_array_size[2]), str(weekly_expenses_array_size[3]), weekly_expenses_array_size_4[0]};
    saveStrings("Weekly_Expenses_Amount.tsv", weekly_expenses_amount_filesave4);
    break;
  case "Add":
    transaction_name_input = JOptionPane.showInputDialog("Enter Transaction Name");
    transaction_date_input = JOptionPane.showInputDialog("Enter Transaction Date");
    transaction_amount_input = JOptionPane.showInputDialog("Enter Transaction Amount");

    String[] transaction_name_appended = append(transactions_name_array_size, transaction_name_input);
    String[] transaction_date_appended = append(transactions_date_array_size, transaction_date_input);
    String[] transaction_amount_appended = append(transactions_amount_array_size, transaction_amount_input);

    saveStrings("transactions_name.tsv", transaction_name_appended);
    saveStrings("transactions_date.tsv", transaction_date_appended);
    saveStrings("transactions_amount.tsv", transaction_amount_appended);
    break;
  case "Total":
  int size = transactions_amountfloat_array_size.length ; 
    for (int i = 0; i < size ; i++) {
      if (transactions_name_array_size[i].equals("Food")) {
        food_sum += transactions_amountfloat_array_size[i];
      } else if (transactions_name_array_size[i].equals("RideShare")) {
        rideshare_sum += transactions_amountfloat_array_size[i];
      } else if (transactions_name_array_size[i].equals("Entertainment")) {
        entertainment_sum += transactions_amountfloat_array_size[i];
      } else {
        println("bitching");
      }
    }
    break;
  case "Save":
    save("saving.png"); 
    break;
  case "null": 
    println("input is null");
    break;
  default: 
    println("Zulu");
    break;
  }
  /*--------------------------------------- Closing Void keyPressed ---------------------------------------------------------------- */
}
