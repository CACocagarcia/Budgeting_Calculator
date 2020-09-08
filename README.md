# Budgeting_Calculator

This program was made using Processing.js and importing javax.swing.JOptionPane library for the user input dialog

Purpose: to create a program that will allow a user to keep track of their weekly budget by allowing the user to input their weekly budget divided into categories, and record their daily expenses/transactions.

-- VIDEO OF THE PROGRAM AVAILABLE ON FILES
         

# Program Layout: 
1) Weekly Income Row: this row displays the weekly income that the user inputs. On the right side it will display the estimated Monthly Income by multiplying the Weekly Income by    4
2) Weekly Expenses Table: This table is built using three sets of data: 
  a) Weekly Expenses Title: Static Text
  b) Column - Expenses Names: These titles are fixed values saved in an array that's being displayed in three different locations (Weekly Expenses Table, Monthly Expenses Table,     Weekly Sum of Expenses Table). The titles are displayed dynamically using a For Loop. The titles "TOTAL" and "REMAINING" are displayed after the expenses titles are displayed      using an IF Stament
  c) Column - Dollar Vallues: This values are saved in a .tsv file called Weekly_Expenses_Amount. The user can assign the dollar amount by inputing the proper commands. The values are dynamically displayed using a For Loop
3) Monthly Expenses Table: The dollar amount values of this table are dynamic. They change as the Weekly Expenses dollar amount changes. The dollar amount of the Weekly Expenses Table are grabbed and multipled by 4. These values are not saved in a file. They are always displayed because they're under the void draw() function
4) Record Transaction Table: This table is composed by 4 components: 
  a) Static Title
  b) Transaction Name Table: The values of this column are collected as the user inputs the transaction and then the value is saved in the transactions_name.tsv file
  c) Transaction Date Table: The values of this column are collected as the user inputs the transaction and then the value is saved in the transactions_date.tsv file
  d) Transaction Dollar Amount Table: The values of this column are collected as the user inputs the transaction and then the value is saved in the transactions_amount.tsv file
5) Weekly Sum of Expenses Table:
  This Table is a dynamic table that displays the sum of the recorded transactions. It functions through a For Loop with an IF Statement inside, where it compares the transaction    name and grabs is dollar amount value and adds it according to its category
6) Comparison Table: This table is a dynamic table where it compares the values of the Weekly Sum of Expenses table vs the Weekly Expenses table and it outputs the values. It determines if you are over the budget or inside the budget. 

# How Does it Work 
The goal of the program is to prompt a user to input a command that will allow the user to assign values,record transactions,calculate totals, and save the data .
To activate the prompt:

press any key to activate the prompt

The program will ask you to "Enter Case" -> ALL CASES ARE CASE SENSITIVE -> The following cases are: 
1) Weekly Income: To assign how much is your weekly income. the value is saved and displayed on the weekly income row
2) Weekly RideShare: To assign the dollar amount to budget for RideShare3
3) Weekly Food: To assign the dollar amount to budget for Food
4) Weekly Entertaiment: To assign the dollar amount to budget for Entertainment
5) Monthly Rent: To calculate how much to save per week to be able to pay for rent at the end of the month. This is calculated by grabbing the monthly rent rate and divide it by four 
6) Monthly Phone: To calculate how much to save per week to be able to pay for phone at the end of the month. This is calculated by grabbing the monthly phone rate and divide it by four
7) Add: This will activate for the user to record a transaction done during that week. Then the user will be asked to input the transaction name, date, and amount. The transaction name can only be: RideShare, Food, Entertainment
8) Total: To activate and display the values for the Weekly Sum of Expenses and Comparison table
9) Save: to take a screenshot of the programs panel and save it as a png file. 

# Improvements to be made

- Add Delete Transaction: The program is unable to delete a transaction. To delete a transaction, the user must detele the data from the tsv files. 
-- Idea on how to do it: user must input transaction name and amount >> read three tables using a For Loop >> obtain the specific index in the arrays  >> match them >> delete the tokens


