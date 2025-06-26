with Ada.Text_IO, Adjacent_Count;
use Ada.Text_IO;

procedure Main is

   type Matrix is array (Integer range <>, Integer range <>) of Integer;

   function Is_Even (I : Integer) return Boolean is
   begin
      return (I mod 2) = 0;
   end Is_Even;

   function Even_Adjacents is new Adjacent_Count
     (Integer, Integer, Matrix, Is_Even);

   M : Matrix (1 .. 5, 1 .. 5);

begin
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
end Main;
