with Hash_Map;
with Ada.Text_IO; use Ada.Text_IO;

procedure Test_Hash_Map is
   Map : Hash_Map.Hashmap(Size => 256); 
begin

   Hash_Map.Insert(Map, 12, 100);
   Hash_Map.Insert(Map, 22, 200);
   Hash_Map.Insert(Map, 30, 300);

   Put_Line("Value for key 12: " & Integer'Image(Integer(Hash_Map.Retrieve(Map, 10))));
   Put_Line("Value for key 22: " & Integer'Image(Integer(Hash_Map.Retrieve(Map, 20))));

   if Hash_Map.Contains(Map, 30) then
      Put_Line("Key 30 exists");
   else
      Put_Line("Key 30 does not exist");
   end if;

   Hash_Map.Delete(Map, 22);

   if not Hash_Map.Contains(Map, 22) then
      Put_Line("Key 22 was deleted");
   end if;
   Put_Line("Value for key 22: " & Integer'Image(Integer(Hash_Map.Retrieve(Map, 20)))); 
end Test_Hash_Map;