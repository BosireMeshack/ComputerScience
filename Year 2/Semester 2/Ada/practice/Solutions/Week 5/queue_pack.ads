with Ada.Text_IO;
use Ada.Text_IO;

generic
   type Elem is private;
   type Index is (<>);
   type Arr is array(Index range <>) of Elem;
   --with function ">="(S: Natural; M: Index) return Boolean is <>;
   with function "="(S: Natural; M: Index) return Boolean is <>;
   
package Queue_Pack is

   type Queue(Max: Index) is limited private;
   
   procedure Enqueue(Q: in out Queue; E: in Elem);
   procedure Dequeue(Q: in out Queue; E: out Elem);
   
   function Get_First(Q: Queue) return Elem;
   function Is_Empty(Q: Queue) return Boolean;
   function Is_Full(Q: Queue) return Boolean;
   function Size(Q: Queue) return Natural;
   
   generic
      with procedure Process_Elem(Item: in out Elem);
   procedure For_Each(Q: in out Queue);
     
private
   
   type Queue(Max: Index) is limited record
      Data: Arr(Index'First..Max);
      First, Last: Index := Index'First;
      Size: Natural := 0;
   end record;
   
   
end Queue_Pack;
