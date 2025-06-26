with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

-- instanciating the package
with increment_by;

procedure show_increment is
A: Integer:=2;
B: Integer:=3;
C:Integer;
begin
C := increment_by(A,B);
Put(C);
Put(increment_by(A,B));

end show_increment;