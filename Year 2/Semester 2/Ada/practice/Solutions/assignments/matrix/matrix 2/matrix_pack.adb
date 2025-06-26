with Ada.Integer_Text_IO;
package body Matrix_Pack is


   function Transpose(A : Matrix) return Matrix is
      Trans : Matrix(A'First(2)..A'Last(2), A'First(1)..A'Last(1));
   begin
      for I in A'First(1)..A'Last(1) loop
         for J in A'First(2)..A'Last(2) loop
            Trans(J, I) := A(I, J);
         end loop;
      end loop;
      return Trans;
   end Transpose;

    function Determinant(A: Matrix) return Elem is
      function Minor(M: Matrix; Row, Col: Index) return Matrix is
         Result : Matrix(1..M'Length(1)-1, 1..M'Length(2)-1);
         R, C : Index := 1;
      begin
         for I in M'Range(1) loop
            if I /= Row then
               C := 1;
               for J in M'Range(2) loop
                  if J /= Col then
                     Result(R, C) := M(I, J);
                     C := C + 1;
                  end if;
               end loop;
               R := R + 1;
            end if;
         end loop;
         return Result;
      end Minor;

      Det : Elem := 0;
      Sign : Integer := 1;
   begin
      if A'Length(1) /= A'Length(2) then
         raise Constraint_Error with "Matrix must be square!";
      end if;

      if A'Length(1) = 2 then
         return A(A'First(1), A'First(2)) * A(A'First(1) + 1, A'First(2) + 1) - A(A'First(1), A'First(2) + 1) * A(A'First(1) + 1, A'First(2));
      else
         for J in A'Range(2) loop
            Det := Det + Elem(Sign) * A(A'First(1), J) * Determinant(Minor(A, A'First(1), J));
            Sign := -Sign;
         end loop;
         return Det;
      end if;
   end Determinant;
   
   
   procedure Print_Matrix(M: in Matrix) is
   begin
      for I in M'First(1)..M'Last(1) loop
         for J in M'First(2)..M'Last(2) loop
            Put(Elem'Image(M(I, J)) & " ");
         end loop;
         New_Line;
      end loop;
   end Print_Matrix;

   --  procedure Input_Matrix(M: in out Matrix) is 
   --     --Rows, Cols : Index;
   --     begin
   --        --  Put("Enter number of rows: ");
   --        --  Get(Rows);
   --        --  Put("Enter number of columns: ");
   --        --  Get(Cols);
   --        for I in M'First(1)..M'Last(1) loop
   --           for J in M'First(2)..M'Last(2) loop
   --              Put("Enter element (" & Index'Image(I) & ", " & Index'Image(J) & "): ");
   --              Ada.Integer_Text_IO.Get(Item => M(I, J));
   --           end loop;
   --        end loop;
   --  end Input_Matrix;

end Matrix_Pack;