with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure pi is
n: Integer;
pi: Float;
begin
for I in 1..N loop
   pi:=pi*Float((I+1))**Float(2/I**2);
end loop;

Put(pi);
end pi;