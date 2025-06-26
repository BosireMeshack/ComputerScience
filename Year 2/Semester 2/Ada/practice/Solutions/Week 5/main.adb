with Ada.Text_IO, Queue_Pack;
use Ada.Text_IO;

procedure Main is

   type Elem is new Integer;
   type Index is new Natural;
   type Arr is array (Index range <>) of Elem;

   function My_Equality (S : Natural; I : Index) return Boolean is
   begin
      if Index (S) = I then
         return True;
      else
         return False;
      end if;
   end My_Equality;

   package My_Queue is new Queue_Pack (Elem, Index, Arr, My_Equality);
   use My_Queue;

   procedure Print_Elem (E : in out Elem) is
   begin
      Put_Line (Elem'Image (E));
   end Print_Elem;

   procedure Print_Queue is new My_Queue.For_Each (Print_Elem);

   Max : Index := Index'First + 5;
   Q   : Queue (Max);

begin

   Enqueue (Q, 1);
   Enqueue (Q, 1);
   Enqueue (Q, 1);
   Enqueue (Q, 1);
   Enqueue (Q, 1);
   Enqueue (Q, 1);

   Print_Queue (Q);

end Main;
