generic
   type Elem is private;
   type Key(<>) is private;
   with function Condition( K: Key; E: Elem) return Boolean;

package Database_Pkg is

   type Database(Max: Natural) is limited private;
   procedure InsertElem(DB: in out Database; E: Elem; Success: out Boolean);
   procedure GetElem(DB: in Database; K: in Key; E: out Elem; Success: out Boolean);
   procedure UpdateElem(DB: in out Database; K: in Key; E: in Elem; Success: out Boolean);
   procedure DeleteElem( DB: in out Database; K: in Key; Success: out Boolean);

   private

   type Arr is array(Natural range <>) of Elem;
   type Database(Max: Natural) is limited record
      Elements: Arr(0..Max);
      Size: Natural :=0;

   end record;


end Database_Pkg;