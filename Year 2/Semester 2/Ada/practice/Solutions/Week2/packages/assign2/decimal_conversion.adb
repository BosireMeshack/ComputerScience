with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Decimal_Conversion is

   function decimal_to_binary(N: Integer) return Unbounded_String is
      Bin : Unbounded_String := To_Unbounded_String("");
      Num : Integer := N;
   begin
      if Num = 0 then
         return To_Unbounded_String("0");
         end if;

      while Num > 0 loop
         if Num mod 2 = 0 then
            Bin := To_Unbounded_String("0") & Bin;
         else
            Bin := To_Unbounded_String("1") & Bin;
         end if;
         Num := Num / 2;
      end loop;

      return Bin;
   end decimal_to_binary;

   function decimal_to_hexadecimal( W: Integer) return Unbounded_String is
      Hex_Chars : constant String := "0123456789ABCDEF";
      Hex : Unbounded_String := To_Unbounded_String("");
      Num : Integer := W;
   begin
      if Num = 0 then
         return To_Unbounded_String("0");
      end if;

      while Num > 0 loop
         Hex := To_Unbounded_String(Hex_Chars(Num mod 16 + 1)) & To_Unbounded_String(Hex);
         Num := Num / 16;
      end loop;
      return Hex;
   end decimal_to_binary;

end Decimal_Conversion;