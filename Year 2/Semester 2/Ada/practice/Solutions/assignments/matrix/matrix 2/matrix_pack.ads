with Ada.Text_IO;
use Ada.Text_IO;

package Matrix_Pack is
   
   type Index is new Integer;
   type Elem is new Integer;
   type Matrix is array(Index range <>, Index range <>) of Elem;
   
   -- rows become colums and columns become rows
   function Transpose(A : Matrix) return Matrix;
   function Determinant(A: Matrix) return Elem;
   procedure Print_Matrix(M: in Matrix);
   --  procedure Input_Matrix(M: in out Matrix);

end Matrix_Pack;