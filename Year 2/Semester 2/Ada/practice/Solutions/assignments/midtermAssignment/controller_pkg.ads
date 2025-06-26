with Database_Pkg;

generic
   type Elem is private;
   type Key(<>)  is private;
   with function Condition(K : Key; E : Elem) return Boolean;
   with function JSON(E : Elem) return String;

package Controller_Pkg is

   package DB_Inst is new Database_Pkg(Elem => Elem,Key => Key,Condition => Condition);


   type Controller(Max : Natural) is limited private;
   procedure Create(C : in out Controller; E : in Elem);
   procedure Read (C : in out Controller; K : in Key);
   procedure Update(C : in out Controller; K : in Key; E : in Elem);
   procedure Delete(C : in out Controller; K : in Key);

private
   type Controller(Max : Natural) is limited record
      DB : DB_Inst.Database(Max);
   end record;

end Controller_Pkg;