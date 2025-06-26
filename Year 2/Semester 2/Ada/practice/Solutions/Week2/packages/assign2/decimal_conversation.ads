with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Decimal_Conversion is
   function decimal_to_binary (n: Integer) return Unbounded_String;
   function decimal_to_hexadecimal (w: Integer) return Unbounded_String;

end Decimal_Conversion;