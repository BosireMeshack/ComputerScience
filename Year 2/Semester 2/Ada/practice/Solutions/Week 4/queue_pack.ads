 
 
 with Ada.Text_IO;
use Ada.Text_IO;

package Queue_Pack is

   type Queue(Max: Positive) is limited private;
   
   --procedure Create_Queue(Q: in out Queue; .....);
   --function Create_Queue(Q: Queue) return Queue;
   
   procedure Enqueue(Q: in out Queue; E: in Integer);
   procedure Dequeue(Q: in out Queue; E: out Integer);
   
   function Get_First(Q: Queue) return Integer;
   function Is_Empty(Q: Queue) return Boolean;
   function Is_Full(Q: Queue) return Boolean;
   function Size(Q: Queue) return Natural;
   
   --function ">"(Q1, Q2: in Queue) return Boolean;
   
private
   
   type Arr is array(Integer range <>) of Integer;
   
   type Queue(Max: Positive) is limited record
      Data: Arr(0..Max); 
      First, Last: Natural := 0;
      Size: Natural := 0;
   end record;

   
end Queue_Pack;
