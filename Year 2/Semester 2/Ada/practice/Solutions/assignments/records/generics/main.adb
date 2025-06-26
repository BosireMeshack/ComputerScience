with Ada.Text_IO; use Ada.Text_IO;
with Hash_map;

procedure Main is

   function Integer_Hash(Key : Integer) return Natural is
   begin
      return Natural(Key) mod 256;
   end Integer_Hash;

   --  function String_Hash(Key : String) return Natural is
   --     Sum : Natural := 0;
   --  begin
   --     for C of Key loop
   --        Sum := Sum + Character'Pos(C);
   --     end loop;
   --     return Sum mod 256;
   --  end String_Hash;

   package Integer_Hash_Map is new Hash_map(Key_Type => Integer, Value_Type => Integer, Hash_Function => Integer_Hash);
   --package String_Hash_Map is new Hash_map(Key_Type => String, Value_Type => Integer, Hash_Function => String_Hash);

   Int_Map : Integer_Hash_Map.Hashmap;
   --  Str_Map : String_Hash_Map.Hashmap;

begin
   Integer_Hash_Map.Insert(Int_Map, 1, 100);
   Integer_Hash_Map.Insert(Int_Map, 2, 200);
   Put_Line("Retrieve 1: " & Integer'Image(Integer_Hash_Map.Retrieve(Int_Map, 1)));
   Put_Line("Contains 2: " & Boolean'Image(Integer_Hash_Map.Contains(Int_Map, 2)));
   Integer_Hash_Map.Delete(Int_Map, 1);
   Put_Line("Contains 1 after delete: " & Boolean'Image(Integer_Hash_Map.Contains(Int_Map, 1)));

   --  String_Hash_Map.Insert(Str_Map, "Key1", 100);
   --  String_Hash_Map.Insert(Str_Map, "Key2", 200);
   --  Put_Line("Retrieve Key1: " & Integer'Image(String_Hash_Map.Retrieve(Str_Map, "Key1")));
   --  Put_Line("Contains Key2: " & Boolean'Image(String_Hash_Map.Contains(Str_Map, "Key2")));
   --  String_Hash_Map.Delete(Str_Map, "Key1");
   --  Put_Line("Contains Key1 after delete: " & Boolean'Image(String_Hash_Map.Contains(Str_Map, "Key1")));
end Main;