
with Ada.Text_IO;
with math;

use Ada.Text_IO;
use math;
procedure Main is

begin
   --  Insert code here.
   Put_Line(Positive'Image(gcd(10,20)));
   Put_Line(Natural'Image(adddigits(234)));
   Put_Line(Boolean'Image(check9(81)));
   perfect;
   Put_Line(Float'Image(sinx(60.0)));
   Put_Line(Boolean'Image(ispalindrome(12321)));
   Put_Line(Positive'Image(nthpower(2,4)));
end Main;
