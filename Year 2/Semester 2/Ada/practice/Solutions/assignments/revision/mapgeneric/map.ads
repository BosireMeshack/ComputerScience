with Ada.Text_IO;
use Ada.Text_IO;

generic
   -- formal parameters of generic function
   type A is private; -- elem types
   type B is private; -- nonlimited definate types

   type Index is (<>); -- any discrete type
   type Arr_A is array(Index range <>) of A; --range is indefinate
   type Arr_B is array(Index range <>) of B;
   with function Op(X: A) return B; -- generic function declaration
   function map(XA: Arr_A) return Arr_B;