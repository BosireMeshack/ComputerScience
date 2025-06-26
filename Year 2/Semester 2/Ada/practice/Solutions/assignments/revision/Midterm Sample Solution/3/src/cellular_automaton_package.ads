generic
   type Cell is (<>);
   with function Rule(C: Cell) return Cell;
package Cellular_Automaton_Package is

   type Cellular_Automaton(Height: Positive; Width: Positive) is private;
   
   procedure Run(C: in out Cellular_Automaton; N: Natural);
   procedure Iterate(C: in out Cellular_Automaton);
   procedure Put(C: Cellular_Automaton);
   
private
   
   type Board_M is array(Positive range <>, Positive range <>) of Cell;
   
   type Cellular_Automaton(Height: Positive; Width: Positive) is record
      Board: Board_M(1..Height, 1..Width) := (others => (others => Cell'First));
   end record;

end Cellular_Automaton_Package;
