with Ada.Text_IO;
use Ada.Text_IO;

package Hash_Map is

   type Key_Type is new Integer; -- new data type called Key_Type
   type Value_Type is new Integer; -- new data type called Value_Type

   -- Key_Value record that is public
   type Key_Value_Pair is record
      Key   : Key_Type;
      Value : Value_Type;
   end record;
   -- instantiation of a private record called Hashmap
   type Hashmap(Size : Natural) is private;

   -- Declaration of functions and procedures for the Hashmap record
   -- procedure for inserting a Key_Value Pair into the Hashmap
   procedure Insert(H : in out Hashmap; Key : Key_Type; Value : Value_Type);
   -- Procedure for deleting key_value pairs from a hashtable(sequence of Key_Value Pairs), the value is identified by the key entered
   procedure Delete(H : in out Hashmap; Key : Key_Type);
   -- function that returns the value of the entered key_type
   function Retrieve(H : Hashmap; Key : Key_Type) return Value_Type;
   -- function that checks if the entered key exists in the Hashmap
   function Contains(H : Hashmap; Key : Key_Type) return Boolean;

private

   
   Hash_Table_Size : constant := 256;
   --  definition of data structure for the elements in the Hashmap record
   type Hash_Table is array (0 .. Hash_Table_Size - 1) of Key_Value_Pair;

   type Hashmap(Size : Natural) is record
      Table : Hash_Table;
   end record;

   function Hash_Function(Key : Key_Type) return Natural;

end Hash_Map;