with Ada.Text_IO;
use Ada.Text_IO;

package body Cellular_Automaton_Package is

   procedure Run(C: in out Cellular_Automaton; N: Natural) is
   begin
      for I in 1..N loop
         Iterate(C);
         Put(C);
         delay 0.5;
      end loop;
   end Run;
      
   procedure Iterate(C: in out Cellular_Automaton) is
      Prev_State: Cellular_Automaton := C;
   begin
      for I in C.Board'Range(1) loop
         for J in C.Board'Range(2) loop
            C.Board(I, J) := Rule(Prev_State.Board(I,J));
         end loop;
      end loop;
   end Iterate;
      
   procedure Put(C: Cellular_Automaton) is
   begin
      for I in C.Board'Range(1) loop
         for J in C.Board'Range(2) loop
            Put(Cell'Image(C.Board(I, J))& "|" & " ");
         end loop;
         New_Line;
      end loop;
      New_Line;
   end Put;

end Cellular_Automaton_Package;
