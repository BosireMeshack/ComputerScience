package body Queue_Pack is

   procedure Enqueue(Q: in out Queue; E: in Integer) is
   begin
      if Q.Size >= Q.Max - 1 then
         Put_Line("The queue is full");
         return;
      end if;
      
      Q.Data(Q.Last) := E;
      Q.Last := Q.Last + 1;
      Q.Size := Q.Size + 1;
   end Enqueue;
    
   procedure Dequeue(Q: in out Queue; E: out Integer) is
   begin
      E := Integer'First;
      if Q.Size = 0 then
         Put_Line("Queue is empty");
         return;
      end if;
      
      E := Q.Data(Q.First);
      for I in Q.Data'First..Q.Last loop
         Q.Data(I) := Q.Data(I + 1);
      end loop;
      Q.Last := Q.Last - 1;
      Q.Size := Q.Size - 1;
   end Dequeue;
   
   function Get_First(Q: Queue) return Integer is
   begin
      return Q.Data(Q.First);
   end Get_First;
      
   function Is_Empty(Q: Queue) return Boolean is
   begin
      return Q.Size = 0;
   end Is_Empty;
      
   function Is_Full(Q: Queue) return Boolean is
   begin
      return Q.Size =  Q.Max - 1;
   end Is_Full;
   
   function Size(Q: Queue) return Natural is
   begin
      return Q.Size;
   end Size;

end Queue_Pack;
