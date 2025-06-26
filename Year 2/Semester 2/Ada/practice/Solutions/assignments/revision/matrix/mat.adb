with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Mat is
   type Matrix_Type is array(1..3,1..3) of Integer;
   M:Matrix_Type := ((3,4,5),(7,8,9), (12,13,14));

begin
   for I in M'Range(1) loop
   for J in M'Range(2) loop
         Put(Integer'Image(M(I,J)) & " ");
      end loop;
      New_Line;
   end loop;
end Mat;