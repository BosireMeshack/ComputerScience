with Ada.Float_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
use Ada.Float_Text_IO;

procedure isprime is
   
   function Prime(N: Integer) return Boolean is
      --Fact: Positive := 1;
   begin

      if (N <= 1) then
      return False;
      elsif (N = 2) then
      return True;
      end if;

      for I in 2..N loop
         if (N mod I) = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Prime;
   
   Num: Integer;
   
begin
   PutLine("Enter an integer: ");
   Get(Num);
   if Prime(Num) then
      PutLine("Is Prime");
   else
      PutLine("Is not Prime");
   end if;
     
end isprime;
