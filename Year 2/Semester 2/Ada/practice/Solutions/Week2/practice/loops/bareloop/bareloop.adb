with Ada.Text_IO;
use Ada.Text_IO;
 with Ada.Integer_Text_IO;
 use Ada.Integer_Text_IO;

 procedure bareloop is
   I:Integer :=5;
   begin
   loop
      Put_Line("Hello, world!" & Integer'Image(I));

      exit when I=0;
      I:=I-1;

   end loop;

 
 end bareloop;