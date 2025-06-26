with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;


procedure swap is
   A:Integer;
   B:Integer;
   
procedure swap1(A,B :in out Integer) is
   Temp: Integer:=A;
 
   begin
   A:=B;
   B:=Temp;
   Put(A);
   Put(B);

   end swap1;

   begin
   A:=10;
   B:=20;
   swap1(A,B);
   
end swap;