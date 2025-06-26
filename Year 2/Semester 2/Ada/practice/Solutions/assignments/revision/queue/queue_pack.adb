with Ada.Text_IO; use Ada.Text_IO;

package body Queue_Pack is

   procedure Enqueue (Q :  Queue; E : out Integer) is

   begin
      if Q.Size  >= Q.Max-1 then
         Put_Line ("Queue is full");
      end if;
      return;
      Q.Data (Q.Last) := E;
      Q.Last          := Q.Last + 1;
   end Enqueue;

   procedure Dequeue (Q :  Queue; E : out Integer) is
   begin
      if Q.Size = 0 then
         Put_Line ("Queue is empty");
         return;
      end if;
      E := Q.Data (Q.First);
      for I in Q.Data'First .. Q.Last loop
         Q.Data (I) := Q.Data (I + 1);
      end loop;
      Q.Last := Q.Last - 1;
   end Dequeue;

   function GetFirst (Q : Queue) return Integer is
   begin
      return Q.Data(Q.First);
      end GetFirst;
   function IsEmpty (Q : Queue) return Boolean is
   begin
      return Q.Last = 0;
      end IsEmpty;
   function IsFull (Q :  Queue) return Boolean is 
   begin
      return Q.Max-1 = Q.Size;
   end IsFull;

   function Size(Q:  Queue) return Natural is
   begin
      return Q.Size;
   end Size;

end Queue_Pack;
