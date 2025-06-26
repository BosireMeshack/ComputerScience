with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure nchoosek is 
n: integer;
k:integer;
r:integer;

function Factorial (n: Integer) return Positive is 
F: Integer:=1;
begin
   for I in 1..n loop
      F:= F*I;
   end loop;
   return F;
end Factorial;
begin

Get(n);
Get(k);
r:= Factorial(n) / Factorial (n-k);
Put(r);

end nchoosek;