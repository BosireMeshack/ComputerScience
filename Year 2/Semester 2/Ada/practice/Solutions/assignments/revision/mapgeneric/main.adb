with Ada.Text_IO;
use Ada.Text_IO;
-- only import generic functions
with map;


procedure Main is
   -- the two arrays we will pass to our generic
   type Arr1 is array(Integer range <>) of Integer;
   type Arr2 is array(Integer range <>) of Float;

   function Half(X: Integer) return Float is
   begin
      return Float(X)/2.0;
   end Half;
   --generic function(Map) instantiation
   function My_Map is new Map(Integer, Float, Integer, Arr1, Arr2, Half);
   A: Arr1:=(1,3,4,56,23);
   B: Arr2(A'Range);

begin
   --calling the instance of Map function
   B:= My_Map(A);
   -- printing the B elements
   for I in B'Range loop
   Put_Line(Float'Image(B(I)));
   end loop;
end Main;