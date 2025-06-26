with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure check_positive is
   Num: Integer;
begin 
   Put ("Enter an integer: ");
   Get (Num);
   if Num > 0 then
      Put (Num);
      Put (" Is Positive");
      --Put_Line(" is Positive");
   else
      Put (" Is not Positive");
   end if;
end check_positive;