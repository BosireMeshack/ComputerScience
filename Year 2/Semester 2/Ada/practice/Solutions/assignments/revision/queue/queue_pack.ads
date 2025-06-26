
package Queue_Pack is

   --  type Elem is private;
   --  type Index is (<>);
   --  type Arr is array(Index range <>) of Elem;
   type Queue(Max:Natural) is limited private;

   procedure Enqueue(Q: Queue; E: Integer);
   procedure Dequeue(Q: Queue; E: Integer);
   function GetFirst(Q: Queue) return Integer;
   function IsEmpty(Q:  Queue) return Boolean;
   function IsFull(Q: Queue) return Boolean;
   function Size(Q: Queue) return Natural;

private
   type Arr is array(Natural range <>) of Integer;
   type Queue(Max: Natural) is limited record
      Data: Arr(0.. Max);
      First, Last: Natural := 0;
      Size: Natural := 0;
   end record;

end Queue_Pack;