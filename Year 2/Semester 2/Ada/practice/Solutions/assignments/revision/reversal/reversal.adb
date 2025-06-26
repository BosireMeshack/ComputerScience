procedure Reversal(A : in out Arr) is 
   I: Index := A'First;
   J: Index := A'Last;
   Temp: Elem;
   begin

   while I<J loop
      Temp:=A(I);
      A(I):=A(J);
      A(J):=Temp;
      I:=Index'Succ(I);
      J:=Index'Pred(J);
      
   end loop;
end Reversal;