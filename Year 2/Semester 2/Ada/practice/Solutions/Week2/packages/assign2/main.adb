with Ada.Text_IO; use Ada.Text_IO;
with Decimal_Conversion; 
-- use Decimal_Conversion;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   N: Integer;
begin
   Put("Enter a number: ");
   Get(N);
   Put("Binary: ");
   Put_Line(decimal_to_binary(N));
   Put("Hexadecimal: ");
   Put_Line(decimal_to_hexadecimal(N));
end Main;