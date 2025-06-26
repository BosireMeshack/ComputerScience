package body Queue_Pack is

   procedure Enqueue(Q: in out Queue; E: in Elem) is
   begin
      if Q.Last >= Q.Max then
         Put_Line("The queue is full");
         return;
      end if;
      
      Q.Data(Q.Last) := E;
      Q.Last := Index'Succ(Q.Last);
      Q.Size := Q.Size + 1;
   end Enqueue;
    
   procedure Dequeue(Q: in out Queue; E: out Elem) is
   begin
      if Q.Size = 0 then
         Put_Line("Queue is empty");
         return;
      end if;
      
      E := Q.Data(Q.First);
      for I in Q.Data'First..Q.Last loop
         Q.Data(I) := Q.Data(Index'Succ(I));
      end loop;
      Q.Last := Index'Pred(Q.Last);
      Q.Size := Q.Size - 1;
   end Dequeue;
   
   function Get_First(Q: Queue) return Elem is
   begin
      return Q.Data(Q.First);
   end Get_First;
      
   function Is_Empty(Q: Queue) return Boolean is
   begin
      return Q.Size = 0;
   end Is_Empty;
      
   function Is_Full(Q: Queue) return Boolean is
   begin
      return Q.Size = Q.Max;
   end Is_Full;
   
   function Size(Q: Queue) return Natural is
   begin
      return Q.Size;
   end Size;
   
   procedure For_Each(Q: in out Queue) is
   begin
      for I in Q.First..Index'Pred(Q.Last) loop
         Process_Elem(Q.Data(I));
      end loop;
   end For_Each;

end Queue_Pack;
