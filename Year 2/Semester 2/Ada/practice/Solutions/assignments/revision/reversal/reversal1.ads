generic
   type Elem is limited private; --no assignment, no comparison
   type Index is (<>);
   type Arr is array(Index range <>) of Elem;
   with procedure Swap(X,Y: in out Elem);
procedure Reversal1(T: in out Arr);