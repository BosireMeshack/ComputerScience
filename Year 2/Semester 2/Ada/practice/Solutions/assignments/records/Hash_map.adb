package body Hash_Map is

   -- converts the Key_type to Natural and maintains the key within the index range of the table
   function Hash_Function(Key : Key_Type) return Natural is
   begin
      return Natural(Key) mod Hash_Table_Size;
   end Hash_Function;

   procedure Insert(H : in out Hashmap; Key : Key_Type; Value : Value_Type) is
      Index : Natural := Hash_Function(Key); 
   begin
      for I in 0 .. Hash_Table_Size - 1 loop
         if H.Table(Index).Key = 0 or H.Table(Index).Key = Key then 
            H.Table(Index) := (Key, Value); 
            return;
         end if;
         Index := (Index + 1) mod Hash_Table_Size; 
      end loop;
      Put_Line("Hash table is full");
   end Insert;

   procedure Delete(H : in out Hashmap; Key : Key_Type) is
      Index : Natural := Hash_Function(Key);
   begin
     
      for I in 0 .. Hash_Table_Size - 1 loop
         if H.Table(Index).Key = Key then 
            H.Table(Index) := (0, 0); 
            Put_Line("Key deleted");
            return;
         elsif H.Table(Index).Key = 0 then 
            exit; 
         end if;
         Index := (Index + 1) mod Hash_Table_Size; 
      end loop;
      Put_Line("Key not found");
   end Delete;

  
   function Retrieve(H : Hashmap; Key : Key_Type) return Value_Type is
      Index : Natural := Hash_Function(Key); 
   begin
      for I in 0 .. Hash_Table_Size - 1 loop
         if H.Table(Index).Key = Key then 
            return H.Table(Index).Value;
         elsif H.Table(Index).Key = 0 then
            exit; 
         end if;
         Index := (Index + 1) mod Hash_Table_Size; 
      end loop;
      Put_Line("Key not found");
      return 0; 
   end Retrieve;

 
   function Contains(H : Hashmap; Key : Key_Type) return Boolean is
      Index : Natural := Hash_Function(Key); 
   begin
      for I in 0 .. Hash_Table_Size - 1 loop
         if H.Table(Index).Key = Key then 
            return True;
         elsif H.Table(Index).Key = 0 then 
            return False; 
         end if;
         Index := (Index + 1) mod Hash_Table_Size;
      end loop;
      return False;
   end Contains;
end Hash_Map;