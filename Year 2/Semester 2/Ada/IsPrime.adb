
with Ada.Integer_Text_IO;
with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
use Ada.Integer_Text_IO;
use Ada.Text_IO;

use Ada.Numerics.Elementary_Functions;


procedure IsPrime is
   
   function Prime(N: Integer) return Boolean is
      
   begin

      if (N <= 1) then
      return False;
      elsif (N = 2) then
      return True;
      end if;

      for I in 2..Integer(Sqrt(Float(N))) loop
         if (N mod I) = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Prime;
   
   Num: Integer;
   
begin
   --Put("Enter an integer: ");
   Get(Num);
   if Prime(Num) then
      Put("Is Prime");
   else
      Put("Is not Prime");
   end if;
     
end IsPrime;
