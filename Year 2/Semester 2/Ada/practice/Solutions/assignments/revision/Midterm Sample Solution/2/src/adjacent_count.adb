function Adjacent_Count(M: Matrix; X,Y: Index) return Natural is
   StartX: Index;
   StartY: Index;
   EndX: Index;
   EndY: Index;
   Count: Natural := 0;
begin
   if X = M'First(1) then
      StartX := M'First(1);
   else
      StartX := Index'Pred(X);
   end if;
   
   if Y = M'First(2) then
      StartY := M'First(2);
   else
      StartY := Index'Pred(Y);
   end if;
   
   if X = M'Last(1) then
      EndX := M'Last(1);
   else
      EndX := Index'Succ(X);
   end if;
   
   if Y = M'Last(2) then
      EndY := M'Last(2);
   else
      EndY := Index'Succ(Y);
   end if;
   
   for I in StartX..EndX loop
      for J in StartY..EndY loop
         if (not (I = X and J = Y)) and Predicate(M(I, J)) then
            Count := Count + 1;
         end if;
      end loop;
   end loop;
   return Count;
end Adjacent_Count;
