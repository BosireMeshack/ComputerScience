with Matrix_Pack;
use Matrix_Pack;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is
   --  Rows, Cols: Matrix_Pack.Index;
   --  M: Matrix_Pack.Matrix;
   M: Matrix := ((1,2,3,10), (4,5,6,11), (7,8,9,12), (13,14,15,16));
begin
   --  Put("Enter number of rows: ");
   --  Ada.Integer_Text_IO.Get(Item => Rows);
   --  Put("Enter number of columns: ");
   --  Ada.Integer_Text_IO.Get(Item => Cols);
   --  M := (1..Rows, 1..Cols);
   --   Put_Line("Enter the Matrix");
   --  Input_Matrix(M); 
   Put_Line("Matrix:");
   Print_Matrix(M);
   Put_Line("Matrix Transpose:");
   Print_Matrix(Transpose(M));
   Put_Line("Determinant:");
   Put_Line(Elem'Image(Determinant(Transpose(M))));
end Main;