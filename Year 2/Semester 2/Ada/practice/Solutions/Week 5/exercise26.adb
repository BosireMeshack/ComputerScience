with Ada.Text_IO, Reversal1;
use Ada.Text_IO;

procedure Exercise26 is
   
   type Arr is array(Integer range <>) of Integer;
   
   procedure Swap(X, Y: in out Integer) is
      Tmp: Integer := X;
   begin
      X := Y;
      Y := Tmp;
   end Swap;
   
   procedure My_Reversal is new Reversal1(Integer, Integer, Arr, Swap);
   
   A1: Arr := (1,2,3,4,5,6);
   
begin
   
   My_Reversal(A1);
   
   for I in A1'Range loop
      Put_Line(Integer'Image(A1(I)));
   end loop;
end Exercise26;
