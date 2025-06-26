generic
   type Elem is private;
   type Index is (<>);
   type Arr is array(Index range <>) of Elem;
procedure Reversal(A : in out Arr);