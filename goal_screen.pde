import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;
lol, this is so cool

import java.util.*;
import java.math.*;
//import android.view.inputmethod.InputMethodManager;

 Selection select=null;
boolean check;
int total=0;
double money=0;
double scholarships=1000;
double amount=0;
int complete=0;
int completeScholarship=0;
int year=year();

int len=0;
int gamescreen=0;
boolean overAddButton=false;
boolean overSubtractButton=false;
boolean overEnterButtonAddMoney=false;
boolean overBackButtonAddMoney=false;
boolean overSubtractScholarship=false;
boolean overAddScholarship=false;
boolean correctAmount=true;
boolean tracker=true;
boolean trackerGoal=true;
boolean rodentReleased=false;

boolean numYearsScreenContinue=false;
boolean numYearsScreenBack=false;

boolean chooseNewCollege=false;

boolean collegeUofMAA=false;
boolean collegeMSU=false;
boolean collegeBU=false;
boolean collegeCU=false;
boolean collegeCoU=false;
boolean collegeDC=false;
boolean collegeHU=false;
boolean collegePU=false;
boolean collegeUofP=false;
boolean collegeYU=false;
boolean collegeMTU=false;
boolean collegeSU=false;
boolean collegeMIT=false;

boolean tracker2=true;
boolean tracker3=true;

String input="";
String input2="";
int goHome=1;
int collegeChoice=0;
int numYears=0;

PImage homeimg, backgroundimg;

College choice=null;



void setup(){ 
  select=new Selection (0.5, 1, 1000.00);
  select.changeYear(year);
   money=select.getMoney();
  size(720, 1280);
  len=(int)(width*0.8);
  homeimg=loadImage("home.jpg");
   homeimg.resize(width,height);
   backgroundimg=loadImage("bg.jpg");
   backgroundimg.resize(width,height);
   background(homeimg);
}

void draw()
 {    if (gamescreen==0)
           mainScreen();
  else if(gamescreen==1)
      goal();
      
   else if (gamescreen==2)
     addMoney();
     
   else if (gamescreen==3)
     subtractMoney();
     
   else if (gamescreen==4)
      addScholarship();
      
   else if (gamescreen==5)
      subtractScholarship();
      
    else if (gamescreen==6)
      optionsScreen();
      
    else if (gamescreen==7)
      createGoalScreen();
      
}

void mainScreen()
{background(homeimg);
  if(rodentReleased)
    { rodentReleased=false;
        tracker=true; 
      gamescreen=6;
        }}

//------------------------------------------------------------------Goal Bar Screen

void goal(){
    
  //checks if the year has changed and compounds interest if yes
  year=year();
    if(year!=select.checkYear())
    {select.changeYear();}
    
  
  //Only runs once; creates the goal bar, fills it, writes the labels
    if(trackerGoal)
      {background(backgroundimg);
    money=select.getMoney();
    rodentReleased=false;
    KetaiKeyboard.hide(this);
  double cleaning1=(money*(len)/total);
  double cleaning2=((scholarships*len)/total);
  
        fill(0,0,0);
   complete=(int)(money*(len)/total);
   completeScholarship=(int)((scholarships*len)/total);
   textSize(30);
     
   if (complete+completeScholarship>=len)
     {complete=len-completeScholarship;
      text("Congratulations! You have reached your goal!", 95, 150);}
    
   else if(complete==0 && completeScholarship==0)
           {text("Why don't you add some money?", 95, 150);}
           
    else if (cleaning1<=5 && cleaning2<=5)
    {}
    
    else if(cleaning1<=5)
      {if(scholarships>0)
   text("$"+scholarships,45+complete+completeScholarship, 90);}
   
     else if(cleaning2<=5)
      {if(money>0)
        text("$"+money, 45+complete, 90);}
       
    
         else
    { textSize(30);
    if(money>0)
  text("$"+money, 45+complete, 90);
  if(scholarships>0)
   text("$"+scholarships,45+complete+completeScholarship, 90);}
 
  stroke(0);  
  fill(150);
  rect(70,100,len,30,7);
  
  stroke(100);
  fill(38,230,0);
  rect(70,100,complete,30,7,0,0,7);
  
  stroke(100);
  fill(230,230,0);
  rect(70+complete,100,completeScholarship,30,0,7,7,0);
  
  fill(0);
  textSize(30);
  text("$"+total, len+30, 160);
  
  textSize(30);
  text("$"+0, 70, 160);
  
   

overEnterButtonAddMoney=false;
overBackButtonAddMoney=false;
trackerGoal=false;}

   stroke(10);
  //creates the add money button; fills if the mouse is over it
  if((mouseX>=50 && mouseX<=250) && (mouseY>=500 && mouseY<=650))
       {overAddButton=true; fill(100,100,100);}
 else
  { overAddButton=false;fill(200,200,200);}

      rect(50,500,200,150,10);
      
 //creates the subtract money button; fills if the mouse is over it     
 if((mouseX>=400 && mouseX<=600) && (mouseY>=500 && mouseY<=650))
   {overSubtractButton=true;fill(100,100,100);}

   
   else
    { overSubtractButton=false;fill(200,200,200);}
     
      rect(400, 500, 200, 150, 10);
      
      
  if((mouseX>=50 && mouseX<=250) && (mouseY>=200 && mouseY<=350))
   {overAddScholarship=true;fill(100,100,100);}

   
   else
    { overAddScholarship=false;fill(200,200,200);}
           
   rect(50,200,200,150,10);   
   
   if((mouseX>=400 && mouseX<=600) && (mouseY>=200 && mouseY<=350))
   {overSubtractScholarship=true;fill(100,100,100);}

   
   else
    { overSubtractScholarship=false;fill(200,200,200);}
      
   rect(400, 200, 200, 150, 10);
   
   if((mouseX>=100 && mouseX<=600) && (mouseY>=800 && mouseY<=900))
   {chooseNewCollege=true;fill(100,100,100);}

   
   else
    { chooseNewCollege=false;fill(200,200,200);}
   
   rect(100, 800, 500, 100, 100);
      
   textSize(30);  
   fill(0,0,0);    
 text("Add", 105, 550);
 text( "Money", 100, 600);
 text("Withdraw", 420, 550);
 text("Money", 430, 600);
 
 text("Add", 105, 250);
 text( "Scholarship", 70, 300);
 text("Subtract", 440, 250);
 text("Scholarship", 423, 300);
 
 text("Choose a New College", 170, 860); 
 
 // if the mouse is clicked on the add or subtract money button, it changes the screen
  if (rodentReleased) 
    {if(overAddButton)
      {tracker=true;
        gamescreen=2;}
      
      
      else if(overSubtractButton)
      {tracker=true;
      gamescreen=3;}
      
      else if(overAddScholarship)
      {tracker=true;
        gamescreen=4;}
      
      
      else if(overSubtractScholarship)
      {tracker=true;
      gamescreen=5;}
      
      else if(chooseNewCollege)
      {tracker=true;
       tracker2=true;
       tracker3=true;
      gamescreen=6;}
    
    
    else
      rodentReleased=false;}
      
 //Ensures that the second if statement only runs once     
  trackerGoal=false;
  
}

//--------------------------------------------------------------------------------------------------------------------Add Money
  void addMoney(){
  if(tracker)
{background(backgroundimg);
  fill(280,280,280);
rect(225, 200, 200, 50);
  input="";
  amount=0;
  overAddButton=false;
  overSubtractButton=false;
  rodentReleased=false;
  KetaiKeyboard.toggle(this);
}

//this makes sure text dissappears if the backspace is pressed
if( !input.equals(input2))
    {fill(280,280,280);
    rect(225, 200, 200, 50);
      input2=input;}

//the amount they're adding
fill(0);
textSize(30);
text(input, 235, 235);

  //checks if the mouse is over the enter amount button and fills if yes  
  if((mouseX>=50 && mouseX<=250) && (mouseY>=300 && mouseY<=450))
       {overEnterButtonAddMoney=true;
       fill(100,100,100);}
 else
   {overEnterButtonAddMoney=false;
   fill(150,150,150);
 }
    
     rect(50,300,200,150,10);
      
     //checks if the mouse is over the back button and fills if yes     
 if((mouseX>=400 && mouseX<=600) && (mouseY>=300 && mouseY<=450))
   {overBackButtonAddMoney=true;
   fill(100,100,100);}
   
   else
     {overBackButtonAddMoney=false;
     fill(150,150,150);}
 
 rect(400,300,200,150,10);
 
 fill(0,0,0);    
 text("Submit", 90, 375);
 
 text("Back", 460, 375);
 
  if (rodentReleased)
  //is supposed to add the money and go back to the goal screen; so far, it fails to work
    {if(overEnterButtonAddMoney && input.length()>0)
      {try{amount= Double.parseDouble(input);      
      select.addMoney(amount);
      trackerGoal=true;
        gamescreen=1;
        }
      //displays error 
        catch (Exception e){text("ERROR! You have entered an invalid amount", 300, 400); 
                rodentReleased=false;}}
       //Goes back to the goal screen
     else if(overBackButtonAddMoney)
      {trackerGoal=true;
      gamescreen=1;}
      
      else
        rodentReleased=false;}
      
 tracker=false;
  
  
}

//------------------------------------------------------------------------------------------------------------------------------Subtract Money
void subtractMoney(){
  if(tracker)
{background(backgroundimg);
  fill(280,280,280);
rect(225, 200, 200, 50);
  input="";
  amount=0;
  overAddButton=false;
  overSubtractButton=false;
  rodentReleased=false;
  KetaiKeyboard.toggle(this);
}

//this makes sure text dissappears if the backspace is pressed
if( !input.equals(input2))
    {fill(280,280,280);
    rect(225, 200, 200, 50);
      input2=input;}

//the amount they're adding
fill(0);
textSize(30);
text(input, 235, 235);

  //checks if the mouse is over the enter amount button and fills if yes  
  if((mouseX>=50 && mouseX<=250) && (mouseY>=300 && mouseY<=450))
       {overEnterButtonAddMoney=true;
       fill(100,100,100);}
 else
   {overEnterButtonAddMoney=false;
   fill(150,150,150);
 }
    
     rect(50,300,200,150,10);
      
     //checks if the mouse is over the back button and fills if yes     
 if((mouseX>=400 && mouseX<=600) && (mouseY>=300 && mouseY<=450))
   {overBackButtonAddMoney=true;
   fill(100,100,100);}
   
   else
     {overBackButtonAddMoney=false;
     fill(150,150,150);}
 
 rect(400,300,200,150,10);
 
 fill(0,0,0);    
 text("Submit", 90, 375);
 
 text("Back", 460, 375);
 
  if (rodentReleased)
  //is supposed to add the money and go back to the goal screen; so far, it fails to work
    {if(overEnterButtonAddMoney && input.length()>0)
      {try{amount= Double.parseDouble(input);      
      select.withdrawMoney(amount);
      trackerGoal=true;
        gamescreen=1;
        }
      //displays error 
        catch (Exception e){text("ERROR! You have entered an invalid amount", 300, 400); 
                rodentReleased=false;}}
       //Goes back to the goal screen
     else if(overBackButtonAddMoney)
      {trackerGoal=true;
      gamescreen=1;}
      
      else
        rodentReleased=false;}
      
 tracker=false;
  
}



//----------------------------------------------------------------------------------------------------------Add Scholarship

void addScholarship(){
  if(tracker)
{background(backgroundimg);
  fill(280,280,280);
rect(225, 200, 200, 50);
  input="";
  amount=0;
  overAddButton=false;
  overSubtractButton=false;
  rodentReleased=false;
  KetaiKeyboard.toggle(this);
}

//this makes sure text dissappears if the backspace is pressed
if( !input.equals(input2))
    {fill(280,280,280);
    rect(225, 200, 200, 50);
      input2=input;}

//the amount they're adding
fill(0);
textSize(30);
text(input, 235, 235);

  //checks if the mouse is over the enter amount button and fills if yes  
  if((mouseX>=50 && mouseX<=250) && (mouseY>=300 && mouseY<=450))
       {overEnterButtonAddMoney=true;
       fill(100,100,100);}
 else
   {overEnterButtonAddMoney=false;
   fill(150,150,150);
 }
    
     rect(50,300,200,150,10);
      
     //checks if the mouse is over the back button and fills if yes     
 if((mouseX>=400 && mouseX<=600) && (mouseY>=300 && mouseY<=450))
   {overBackButtonAddMoney=true;
   fill(100,100,100);}
   
   else
     {overBackButtonAddMoney=false;
     fill(150,150,150);}
 
 rect(400,300,200,150,10);
 
 fill(0,0,0);    
 text("Submit", 90, 375);
 
 text("Back", 460, 375);
 
  if (rodentReleased)
  //is supposed to add the money and go back to the goal screen; so far, it fails to work
    {if(overEnterButtonAddMoney && input.length()>0)
      {try{amount= Double.parseDouble(input);      
      scholarships+=amount;
      trackerGoal=true;
        gamescreen=1;
        }
      //displays error 
        catch (Exception e){text("ERROR! You have entered an invalid amount", 300, 400); 
                rodentReleased=false;}}
       //Goes back to the goal screen
     else if(overBackButtonAddMoney)
      {trackerGoal=true;
      gamescreen=1;}
      
      else
        rodentReleased=false;}
      
 tracker=false;
  
}
  
  
void subtractScholarship(){
  if(tracker)
{background(backgroundimg);
  fill(280,280,280);
rect(225, 200, 200, 50);
  input="";
  amount=0;
  overAddButton=false;
  overSubtractButton=false;
  rodentReleased=false;
  KetaiKeyboard.toggle(this);
}

//this makes sure text dissappears if the backspace is pressed
if( !input.equals(input2))
    {fill(280,280,280);
    rect(225, 200, 200, 50);
      input2=input;}

//the amount they're adding
fill(0);
textSize(30);
text(input, 235, 235);

  //checks if the mouse is over the enter amount button and fills if yes  
  if((mouseX>=50 && mouseX<=250) && (mouseY>=300 && mouseY<=450))
       {overEnterButtonAddMoney=true;
       fill(100,100,100);}
 else
   {overEnterButtonAddMoney=false;
   fill(150,150,150);
 }
    
     rect(50,300,200,150,10);
      
     //checks if the mouse is over the back button and fills if yes     
 if((mouseX>=400 && mouseX<=600) && (mouseY>=300 && mouseY<=450))
   {overBackButtonAddMoney=true;
   fill(100,100,100);}
   
   else
     {overBackButtonAddMoney=false;
     fill(150,150,150);}
 
 rect(400,300,200,150,10);
 
 fill(0,0,0);    
 text("Submit", 90, 375);
 
 text("Back", 460, 375);
 
  if (rodentReleased)
  //is supposed to add the money and go back to the goal screen; so far, it fails to work
    {if(overEnterButtonAddMoney && input.length()>0)
      {try{amount= Double.parseDouble(input);      
      scholarships-=amount;
      trackerGoal=true;
        gamescreen=1;
        }
      //displays error 
        catch (Exception e){text("ERROR! You have entered an invalidd amount", 300, 400); 
                rodentReleased=false;}}
       //Goes back to the goal screen
     else if(overBackButtonAddMoney)
      {trackerGoal=true;
      gamescreen=1;}
      
      else
        rodentReleased=false;}
      
 tracker=false;
  
  
}  
  

void optionsScreen(){
  
  if (tracker3)
    {background(backgroundimg);
      rodentReleased=false;
   textSize(30);
  fill(0, 0, 0);
  text("Choose your college!", 170, 40);
 // KetaiKeyboard.hide(this);}
    
  int x=mouseX;
  int y=mouseY;
  
  textSize(30);
    if(x>=0 && x<=400 && y>=60 && y<=90)
       {  collegeUofMAA=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeUofMAA=false;}
        text("University of Michigan Ann Arbor", 0, 90);
        
   if(x>=0 && x<=400 && y>=110 && y<=140)
       {  collegeBU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeBU=false;}
       text("Brown University", 0, 140);
       
       if(x>=0 && x<=400 && y>=160 && y<=190)
       {  collegeCoU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeCU=false;}
  text("Cornell University", 0, 190);
  
  if(x>=0 && x<=400 && y>=210 && y<=240)
       {  collegeHU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeHU=false;}
  text("Harvard University", 0, 240);
  
   if(x>=0 && x<=400 && y>=260 && y<=290)
       {  collegeUofP=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeUofP=false;}
  text("University of Pennsylvania", 0, 290);
  
   if(x>=0 && x<=400 && y>=310 && y<=340)
       {  collegeMTU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeMTU=false;}
  text("Michigan Technological University", 0, 340);
  
    if(x>=0 && x<=300 && y>=360 && y<=390)
       {  collegeMSU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeMSU=false;}
  text("Michigan State University", 0, 390);
  
  if(x>=0 && x<=400 && y>=410 && y<=440)
       {  collegeCU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeCU=false;}
  text("Columbia University", 0, 440);
  
    if(x>=0 && x<=400 && y>=460 && y<=490)
       {  collegeDC=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeDC=false;}
  text("Dartmouth College", 0, 490);
  
   if(x>=0 && x<=400 && y>=510 && y<=540)
       {  collegePU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegePU=false;}
  text("Princeton University", 0, 540);
  
     if(x>=0 && x<=400 && y>=560 && y<=590)
       {  collegeYU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeYU=false;}
  text("Yale University", 0, 590);
  
      if(x>=0 && x<=400 && y>=610 && y<=640)
       {  collegeSU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeSU=false;}
  text("Stanford University", 0, 640);
  
       if(x>=0 && x<=400 && y>=660 && y<=690)
       {  collegeSU=true;
         fill(90,90,90);}
        else
        {  fill(0); collegeSU=false;}
text("Massachusetts Institute of Technology", 0, 690);   
    
    if (rodentReleased){
             if(collegeUofMAA)
              {collegeChoice=1;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
             else if(collegeBU)
              {collegeChoice=2;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeCoU)
              {collegeChoice=3;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeHU)
              {collegeChoice=4;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeUofP)
              {collegeChoice=5;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeMTU)
              {collegeChoice=6;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeMSU)
              {collegeChoice=7;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeCU)
              {collegeChoice=8;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeDC)
              {collegeChoice=9;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegePU)
              {collegeChoice=10;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeYU)
              {collegeChoice=11;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeSU)
              {collegeChoice=12;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
              else if(collegeMIT)
              {collegeChoice=13;
              tracker2=true;
              creatingCollege();
              gamescreen=7;}
              
           else
             rodentReleased=false;}

  
 tracker3=false; 
  
  
  
}

  
void createGoalScreen(){
  if(tracker2)
    {background(backgroundimg);
    rodentReleased=false;
     fill(255,255,255);
rect(200, 200, 200, 50);
fill(0); 
input="";
    textSize(30);
    text("How many years until you go to college?", 100,100);
  KetaiKeyboard.toggle(this);
 }
    
    
  if( !input.equals(input2))
    {fill(255,255,255);
    rect(200, 200, 200, 50);
      input2=input;}

//the amount they're adding
fill(0);
textSize(30);
text(input, 210, 235);


if(mouseX>=100 && mouseX<=300 && mouseY>=300 && mouseY<=450)
 {numYearsScreenContinue=true;
   fill(100,100,100);}
   
   else
     {numYearsScreenContinue=false;
     fill(150,150,150);}

rect(100,300,200,150,10);
fill(0);
text("Forward", 145, 380);

if(mouseX>=400 && mouseX<=600 && mouseY>=300 && mouseY<=450)
 {numYearsScreenBack=true;
   fill(100,100,100);}
   
   else
     {numYearsScreenBack=false;
     fill(150,150,150);}
     
rect(400,300,200,150,10);
fill(0);
text("Back", 470, 380); 

if(rodentReleased)
  {  if(input.length()>0 && numYearsScreenContinue)
    try{numYears= Integer.parseInt(input);      
      trackerGoal=true;
        creatingCollege();
        gamescreen=1;
        rodentReleased=false;
        }
      //displays error 
        catch (Exception e){rodentReleased=false;text("ERROR!", 300, 500); 
        text("You have entered an invalid amount", 100, 550);}
                
       else if(numYearsScreenBack)
            { tracker3=true;
            rodentReleased=false;
            gamescreen=6;}
      
      else
       {rodentReleased=false;}}
  

  tracker2=false;
} 


//-----------------------------------------------------------------------------
void keyReleased(){
 if(key==BACKSPACE && input.length()>0)
{ input=input.substring(0,input.length()-1);}
  else if(key==BACKSPACE)
    {input+="";}
  else
   input+=key;
 }
 
 void mouseReleased()
 {rodentReleased=true;}
 
 void creatingCollege(){
   if(numYears==0)
           numYears=1;
           
   if (collegeChoice==1)
      choice = new College("University of Michigan Ann Arbor", 27075, 27834, 28685, 29684, 30461, numYears);
      
  else if (collegeChoice==2)
      choice = new College("Brown University", 60460, 62694, 65380, 68106, 71050, numYears);
      
   else if (collegeChoice==3)
      choice = new College("Cornell University", 61618, 63606, 65494, 37613, 70321, numYears);
      
   else if (collegeChoice==4)
      choice = new College("Harvard University", 59950, 62250, 64400, 66900, 69600, numYears);
      
   else if (collegeChoice==5)
      choice = new College("Michigan Technological University", 26375, 27056, 28321, 29247, 30215, numYears);
      
   else if (collegeChoice==7)
      choice = new College("Michigan State University", 25365, 26104, 26821, 28108, 29393, numYears);
      
   else  if (collegeChoice==8)
      choice = new College("Columbia University", 64144, 66604, 69084, 71785, 68631, numYears);
      
    else if (collegeChoice==9)
      choice = new College("Dartmouth College", 63279, 65133, 67044, 69474, 71409, numYears);
      
    else if (collegeChoice==10)
      choice = new College("Princeton University", 55832, 58965, 61160, 63670, 66150, numYears);
      
     else  if (collegeChoice==11)
      choice = new College("Yale University", 61620, 63970, 66445, 68950, 71290, numYears);
      
    else if (collegeChoice==12)
      choice = new College("Stanford University", 60749, 62363, 64477, 66696, 69109, numYears);
      
    else if (collegeChoice==13)
      choice = new College("Massachusetts Institute of Technology", 59020, 61030, 63250, 65478, 67430, numYears);
      
      else 
              choice = new College("Massachusetts Institute of Technology", 59020, 61030, 63250, 65478, 67430, numYears);
    
          
     total=choice.calculateTotalCost();
     tracker=true;
   
 
 } 
 
 
 
 
 
 
 
 
 class Selection{
 
//private College holder=null;//college they selected
private double interest=0;//interest on their savings account
private int peryear=0;//how often that interest compounds ( 1 is annually, 2 is twice a year, etc)
private double money=0;//how much money the user currently has saved
private double goal=0;//how much money the user wants to save
//private static ArrayList<Selection> allColleges=new ArrayList<Selection>();
private int year=0;

/*public Selection (College c, double i, int p, double m)
{
  //holder=c;
  interest=i+1;
  peryear=p;
  //goal=holder.getTotalCost();
  money=m;
  allColleges.add(this);

}*/

public Selection (double i, int p, double m)
{
 // holder=c;
  interest=i+1;
  peryear=p;
  //goal=holder.getTotalCost();
  money=m;
//  allColleges.add(this);

}


public double getInterest()
{return interest;}
 
 public double applyInterest(double m)
 {return interest*m;}
  
 public double addMoney(double m)
 { money+=m;
 return money;}
 
 public double withdrawMoney(double m)
 {money-=m;
 return money;}
 
 public double getMoney()
 {return money;}
 
 public int checkYear()
 {return year;}
 
 public void changeYear(int n)
 {year=n;}
 
 public void changeYear()
   {for(int x=0; x<peryear; x++)
     money*=interest;
     year++;}
 //public Selection find
 
}

class College{
  String name;
  float year1, year2, year3, year4, year5, projected, interestRate, numYears;
  College(String n, float a, float b, float c, float d, float e, float f){
   name = n;
   year1 = a;
   year2 = b;
   year3 = c;
   year4 = d;
   year5 = e;
   interestRate = calculateInterest();
   f=numYears;
  }
  
  float calculateInterest(){
   float diff1, diff2, diff3, diff4;
   float x = 0;
   diff1 = year2 - year1;
   diff2 = year3 - year2;
   diff3 = year4 - year3;
   diff4 = year5 - year4;
   x = (diff1 + diff2 + diff3 + diff4)/4;
   return x;
  } 
  
  
  public int calculateTotalCost()
      {double d=(double)(year5*(1+(calculateInterest()*numYears)))*4;
        return (int)d;}
}
