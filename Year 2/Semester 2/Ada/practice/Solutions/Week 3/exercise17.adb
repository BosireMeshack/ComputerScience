with Ada.Text_IO;
use Ada.Text_IO;

procedure Exercise17 is
   
   type Index is new Integer;
   type Elem is new Integer;
   type Arr is array(Index range <>) of Elem;
   
   procedure Swap(A, B: in out Elem) is
      Tmp: Elem := A;
   begin
      A := B;
      B := Tmp;
   end Swap;
   
   procedure Own_Bubble_Sort(A: in out Arr) is
      Swapped: Boolean;
   begin
      for I in A'First..A'Last - 1 loop
         Swapped := False;
         for J in A'First..A'Last - 1 - (I - A'First) loop
            If A(J) > A(J + 1) then
               Swap(A(J), A(J + 1));
               Swapped := True;
            end if;
         end loop;
         exit when not Swapped;
      end loop;
   end Own_Bubble_Sort;
   
   A: Arr := (3,6,1,5,3);
   
begin
   
   for I in A'Range loop
      Put(Elem'Image(A(I)));
      Put(" ");
   end loop;
   New_Line;
   
   Own_Bubble_Sort(A);
   
   for I in A'Range loop
      Put(Elem'Image(A(I)));
      Put(" ");
   end loop;

   
end Exercise17;
