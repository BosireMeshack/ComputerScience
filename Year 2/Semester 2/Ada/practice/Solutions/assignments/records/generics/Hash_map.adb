package body Hash_map is

   procedure Insert(H : in out Hashmap; Key : Key_Type; Value : Value_Type) is
      Index : Natural := Hash_Function(Key); 
   begin
      H.Table(Index) :=(Key, Value);
   end Insert;

   procedure Delete(H : in out Hashmap; Key : Key_Type) is
      Index : Natural := Hash_Function(Key);
   begin
     H.Table(Index) := (others=> (Key => Key_Type'First, Value=>Value_Type'First));
   end Delete;

  
   function Retrieve(H : Hashmap; Key : Key_Type) return Value_Type is
      Index : Natural := Hash_Function(Key); 
   begin
      return H.Table(Index).Value;
   end Retrieve;

 
   function Contains(H : Hashmap; Key : Key_Type) return Boolean is
      Index : Natural := Hash_Function(Key); 
   begin
      return H.Table(Index).Key = Key;
   end Contains;
end Hash_map;