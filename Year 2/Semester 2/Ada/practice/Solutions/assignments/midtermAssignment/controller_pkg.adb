
with Ada.Text_IO; use Ada.Text_IO;

package body Controller_Pkg is

   procedure Create(C : in out Controller; E : in Elem) is
      Success : Boolean;
   begin
      DB_Inst.InsertElem(C.DB, E, Success);
      if Success then
         Put_Line("Create: Element inserted successfully.");
      else
         Put_Line("Create: Database is full. Insert failed.");
      end if;
   end Create;

   procedure Read(C : in out Controller; K : in Key) is
      Success : Boolean;
      Temp    : Elem;
   begin
      DB_Inst.GetElem(C.DB, K, Temp, Success);
      if Success then
         Put_Line("Read: " & JSON(Temp));
      else
         Put_Line("Read: Element not found.");
      end if;
   end Read;

   procedure Update(C : in out Controller; K : in Key; E : in Elem) is
      Success : Boolean;
   begin
      DB_Inst.UpdateElem(C.DB, K, E, Success);
      if Success then
         Put_Line("Update: Element updated successfully.");
      else
         Put_Line("Update: Element not found.");
      end if;
   end Update;

   procedure Delete(C : in out Controller; K : in Key) is
      Success : Boolean;
   begin
      DB_Inst.DeleteElem(C.DB, K, Success);
      if Success then
         Put_Line("Delete: Element deleted successfully.");
      else
         Put_Line("Delete: Element not found.");
      end if;
   end Delete;

end Controller_Pkg;
