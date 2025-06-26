with Ada.Text_IO, Reversal;
use Ada.Text_IO;

procedure Exercise25 is
   
   type Arr is array(Integer range <>) of Integer;
   
   type Arr2 is array(Integer range <>) of String;   
   
   procedure My_Reversal is new Reversal(Integer, Integer, Arr);
   
   procedure My_Reversal2 is new Reversal(String, Integer, Arr2);
   
   A1: Arr := (1,2,3,4,5,6);
   
begin
   
   My_Reversal(A1);
   
   for I in A1'Range loop
      Put_Line(Integer'Image(A1(I)));
   end loop;
   
   
end Exercise25;

--ArrayList<Integer>
--package My_Arr_List is new ArrayList(Integer);
