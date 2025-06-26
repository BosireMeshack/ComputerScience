with Ada.Text_IO;
use Ada.Text_IO;

package Matrix_Pack is
   
   type Index is new Integer;
   type Elem is new Integer;
   type Matrix is array(Index range <>, Index range <>) of Elem;
   
   -- Declarations
   procedure Add(A: in out Matrix; B: in Matrix);
   
   -- C: Matrix := A + B;
   function "+"(A, B: Matrix) return Matrix;
   
   function "*"(A, B: Matrix) return Matrix;
   function "*"(E: Elem; M: Matrix) return Matrix;
   procedure Multiply(E: in Elem; M: in out Matrix);
   function Diagonal(A: Matrix) return Elem;
   procedure Print_Matrix(M: in Matrix);

   

end Matrix_Pack;
