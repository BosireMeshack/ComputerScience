procedure Reversal1(T: in out Arr) is
   I: Index := T'First;
   J: Index := T'Last;
begin
   while I<J loop
      Swap(T(I), T(J));
      I:= Index'Succ(I);
      J:=Index'Pred(J);
   end loop;
end Reversal1;