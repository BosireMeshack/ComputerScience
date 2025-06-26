
--generic function implementation
function Map(XA: Arr_A) return Arr_B is
   Y: Arr_B(XA'Range);
begin
   for I in XA'Range loop
   Y(I):=Op(XA(I));
   return Y;
   end loop;
end Map;


