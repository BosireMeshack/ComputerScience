with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure sumrec is

   type Index is new Integer;
   type Elem is new Integer;
   type Arr is array(Index range <>) of Elem;

   function SumArrRec(A: Arr; I: Index) return Elem is
   Sum: Elem :=0;

   begin
   if (I <= A'Last) then
   Sum:= A(I) + SumArrRec (A, Index'Succ(I));
   
   end if;
   return Sum;
   end SumArrRec;

   T: Arr:=(2,4,6,10);

begin

   Put(Elem'Image(SumArrRec(T, T'First)));


end sumrec;