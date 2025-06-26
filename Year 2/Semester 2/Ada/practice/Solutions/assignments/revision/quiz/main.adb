with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   type Month_Type is (January, February, March, April, May, June,
                       July, August, September, October, November, December);

   type Date is record
      Day   : Integer range 1 .. 31 := 1;
      Month : Month_Type := January;
      Year  : Integer range 1 .. 3000 := 2024;
   end record;

   My_birthday : Date := (others => <>);  
begin
   Put_Line("Day: " & Integer'Image(My_birthday.Day));
   Put_Line("Month: " & Month_Type'Image(My_birthday.Month));
   Put_Line("Year: " & Integer'Image(My_birthday.Year));
end Main;
