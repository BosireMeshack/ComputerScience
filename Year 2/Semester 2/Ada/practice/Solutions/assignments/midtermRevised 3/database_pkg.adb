package body Database_Pkg is 

procedure InsertElem(DB: in out Database; E: Elem; Success: out Boolean) is 
      --Success: Boolean := False;
      begin
      if DB.Size <= DB.Elements'Last then
         DB.Elements(DB.Size) := E;
         DB.Size := DB.Size + 1;
         Success:= True;
         else
         Success:=False;
      end if;
      end InsertElem;

      procedure GetElem(DB: in Database; K: in Key; E: out Elem; Success: out Boolean) is
      --Success: Boolean := False;
      Found: Integer := -1;
      begin
         for I in 0..DB.Size - 1 loop
            if Condition(K, DB.Elements(I)) then
               Found:=I;
               exit;
               end if;
         end loop;
         if Found /= -1 then
            Success:= True;
            E := DB.Elements(Found);
            else 
            Success:=False;
         end if;

      end GetElem;

      procedure UpdateElem(DB: in out Database; K: in Key; E: in Elem; Success: out Boolean) is
      Found: Integer:=-1;
      begin
         for I in 0 .. DB.Size - 1 loop
         if Condition(K, DB.Elements(I)) then
            Found := I;
            exit;
         end if;
      end loop;

      if Found /= -1 then
         DB.Elements(Found) := E;
         Success := True;
      else
         Success := False;
      end if;

      end UpdateElem;

      procedure DeleteElem( DB: in out Database; K: in Key; Success: out Boolean) is
      Found: Integer := -1;
      begin
          for I in 0 .. DB.Size - 1 loop
         if Condition(K, DB.Elements(I)) then
            Found := I;
            exit;
         end if;
      end loop;

      if Found /= -1 then
         -- Shift elements down to fill the gap
         for J in Found .. DB.Size - 2 loop
            DB.Elements(J) := DB.Elements(J + 1);
         end loop;
         DB.Size := DB.Size - 1;
         Success := True;
      else
         Success := False;  -- Element not found
      end if;
      end DeleteElem;


end Database_Pkg;