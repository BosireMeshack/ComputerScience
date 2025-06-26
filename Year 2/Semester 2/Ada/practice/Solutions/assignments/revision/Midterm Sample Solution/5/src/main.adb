with Ada.Text_IO, Adjacent_Count, Cellular_Automaton_Package;
use Ada.Text_IO;

procedure Main is

   --Grade 2
   type Matrix is array(Integer range <>, Integer range <>) of Integer;

   function Is_Even(I: Integer) return Boolean is
   begin
      return (I mod 2) = 0;
   end Is_Even;

   function Even_Adjacents is new Adjacent_Count(Integer, Integer, Matrix, Is_Even);

   M: Matrix(1..5, 1..5);

   --Grade 3
   type Cell is (O, I);

   function Rule(C: Cell; N: Natural) return Cell is
   begin
      if C = O then
         if N = 3 then
            return I;
         else
            return O;
         end if;
      else
         if N = 3 or N = 2 then
            return I;
         else
            return O;
         end if;
      end if;
   end Rule;

   package Cell_Pack is new Cellular_Automaton_Package(Cell, Rule);
   use Cell_Pack;

   --Grade 4
   C1 : Coordinate := (X => 1, Y => 1, Value => Cell'Last);
   C2 : Coordinate := (X => 2, Y => 3, Value => Cell'Last);
   InCA : Coordinate_Array (1 .. 2) := (C1, C2);
   CA: Cellular_Automaton(3,3);

   Config : Coordinate_Array := ( (3, 1, I), (3, 2, I), (3, 3, I), (2, 3, I), (1, 2, I));
   CA2 : Cellular_Automaton(10,10);

begin

   --Grade 2
   for I in M'Range (1) loop
      for J in M'Range (2) loop
         M (I, J) := Integer (I * J);
         Ada.Text_IO.Put (Integer'Image (M (I, J)));
      end loop;
      Ada.Text_IO.New_Line;
   end loop;

   Ada.Text_IO.Put (Integer'Image (Even_Adjacents (M, 1, 1))); --3
   Ada.Text_IO.Put (Integer'Image (Even_Adjacents (M, 3, 3))); --8
   Ada.Text_IO.Put (Integer'Image (Even_Adjacents (M, 4, 5))); --3
   Ada.Text_IO.Put (Integer'Image (Even_Adjacents (M, 5, 5))); --3

   --Grade 3 & 4
   New_Line(2);
   Init(InCA, CA);
   Run(CA, 5);

   New_Line(2);
   --Grade 5
   Init(Config, CA2);
   Put(CA2);
   New_Line;
   Run(CA2, 3);

end Main;
