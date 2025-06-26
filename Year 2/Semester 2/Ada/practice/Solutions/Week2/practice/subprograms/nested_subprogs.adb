with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with increment_by;

procedure nested_subprogs is
   A:Integer;
   B: Integer;
   C:Integer;
   -- nested print procedure
   procedure printresult is
   begin
      Put(C);
   end printresult;

begin

   A:=10;
   B:=3;
   C:=increment_by(A,B);
   --call the printresult procedure1
   printresult;
   A:=20;
   B:=5;
   --call the printresult procedure2
   C:=increment_by(A,B);
   printresult;

end nested_subprogs;