with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is

   subtype Natural is Integer range 0..Integer'Last;
   subtype Positive is Integer range 1..Integer'Last;

   --Alias
   subtype Degree_Celsius is Float;
   subtype Liquid_Water_Temp is Degree_Celsius range 0.0..100.0;

   type Month_Duration is range 1..31;
   type Month is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);


   type T_Arr is array(Integer range <>) of Integer;

   type Index is new Integer;
   type Elem is new Integer;
   type Arr is array(Index range <>) of Elem;

   type My_Year_Arr is array(Month) of Month_Duration;

   Cal: constant My_Year_Arr := (31,28,31,30,31,30,31,31,30,31,30,31);
   Feb_Days: Month_Duration := Cal(Feb);


begin



end Main;
