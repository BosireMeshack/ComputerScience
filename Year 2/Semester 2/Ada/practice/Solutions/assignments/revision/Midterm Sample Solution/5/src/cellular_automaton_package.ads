--Grade 3
generic
   type Cell is (<>);
   with function Rule(C: Cell; N: Natural) return Cell;
package Cellular_Automaton_Package is

   type Cellular_Automaton(Height: Positive; Width: Positive) is private;
   
   procedure Run(C: in out Cellular_Automaton; N: Natural);
   procedure Iterate(C: in out Cellular_Automaton);
   procedure Put(C: Cellular_Automaton);
   
   --Grade 4
   type Coordinate is record
      X: Positive;
      Y: Positive;
      Value: Cell;
   end record;
   
   type Coordinate_Array is array(Positive range <>) of Coordinate;
   
   procedure Init(InCA: in Coordinate_Array; OutCA: out Cellular_Automaton);
   
private
   
   function Is_Alive(C: Cell) return Boolean;
   
   type Board_M is array(Positive range <>, Positive range <>) of Cell;
   
   type Cellular_Automaton(Height: Positive; Width: Positive) is record
      Board: Board_M(1..Height, 1..Width) := (others => (others => Cell'First));
   end record;

end Cellular_Automaton_Package;
