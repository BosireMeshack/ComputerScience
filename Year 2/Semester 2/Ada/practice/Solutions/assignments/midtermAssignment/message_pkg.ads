with Ada.Strings.Unbounded, Ada.Text_IO;
use Ada.Strings.Unbounded, Ada.Text_IO;
with User_pkg;
use User_pkg;

package Message_Pkg is
   type Message is private;
   procedure Create_Message(M: out Message; ID:Integer; Text: String; Timestamp: String; User_Sent: User_pkg.User; User_Received:User_pkg.User);
   function getID(M:Message) return Integer;
   function getText(M:Message) return String;
   function gettimeStamp(M:Message) return String;
   function getSender(M:Message) return User_pkg.User;
   function getReceiver(M:Message) return User_pkg.User;
   function To_JSON(M :Message) return String;


private

   type Message is record
   ID: Integer;
   Text: Unbounded_String;
   Timestamp: Unbounded_String;
   User_Sent: User_pkg.User;
   User_Received: User_pkg.User;
   end record;






end Message_Pkg;