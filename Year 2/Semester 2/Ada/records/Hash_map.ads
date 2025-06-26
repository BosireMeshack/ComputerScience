with Ada.Text_IO;
use Ada.Text_IO;

package Hash_Map is

   type Key_Type is new Integer;
   type Value_Type is new Integer;


   type Key_Value_Pair is record
      Key   : Key_Type;
      Value : Value_Type;
   end record;

   type Hashmap(Size : Natural) is private;

   procedure Insert(H : in out Hashmap; Key : Key_Type; Value : Value_Type);
   procedure Delete(H : in out Hashmap; Key : Key_Type);
   function Retrieve(H : Hashmap; Key : Key_Type) return Value_Type;
   function Contains(H : Hashmap; Key : Key_Type) return Boolean;

private

   
   Hash_Table_Size : constant := 256;
   type Hash_Table is array (0 .. Hash_Table_Size - 1) of Key_Value_Pair;

   type Hashmap(Size : Natural) is record
      Table : Hash_Table;
   end record;

   function Hash_Function(Key : Key_Type) return Natural;

end Hash_Map;