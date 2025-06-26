with Ada.Text_IO, Reversal, Reversal1;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
use Ada.Text_IO;

procedure Main is

   type Arr1 is array(Integer range <>) of Integer;
   T: Arr1:=(1,2,4,5,6,10);

   procedure Swap(X,Y: in out Integer) is
   Temp: Integer :=X;
   begin
      X:=Y;
      Y:=Temp;
   end Swap;

   --R: Arr1(T'Range);
   --procedure My_Rev is new Reversal(Integer, Integer, Arr1);
   procedure My_Rev1 is new Reversal1(Integer, Integer, Arr1, Swap);
begin
   My_Rev1(T);
   for I in T'Range loop
      Put_Line (Integer'Image(T(I)));
   end loop;

end Main;