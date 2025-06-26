with Ada.Strings.Unbounded, Ada.Text_IO;
use Ada.Strings.Unbounded, Ada.Text_IO;
with User_pkg;

package body Message_Pkg is

   procedure Create_Message( M : out Message;ID : Integer;Text : String; Timestamp : String;User_Sent : User_pkg.User;User_Received : User_pkg.User) is
   begin
      M.ID := ID;
      M.Text  := To_Unbounded_String(Text);
      M.Timestamp := To_Unbounded_String(Timestamp);
      M.User_Sent:= User_Sent;
      M.User_Received := User_Received;
   end Create_Message;

   function getID(M: Message) return Integer is
   begin
      return M.ID;
   end getID;

   function getText(M: Message) return String is
   begin
      
      return To_String(M.Text);
   end getText;

   function gettimeStamp(M: Message) return String is
   begin
      
      return To_String(M.Timestamp);
   end getTimestamp;

   function getSender(M: Message) return User_pkg.User is
   begin
      return M.User_Sent;
   end getSender;

   function getReceiver(M: Message) return User_pkg.User is
   begin
      return M.User_Received;
   end getReceiver;

   function To_JSON(M: Message) return String is
   begin
     
      return "{" &
             """ID"": " & Integer'Image(M.ID) & ", " &
             """Text"": """ & To_String(M.Text) & """, " &
             """Timestamp"": """ & To_String(M.Timestamp) & """, " &
             """User_Sent"": { " &
                """Email"": """ & getEmail(M.User_Sent) & """, " &
                """Name"": """ & getName(M.User_Sent) & """, " &
                """Surname"": """ & getSurname(M.User_Sent) & """ }, " &
             """User_Received"": { " &
                """Email"": """ & getEmail(M.User_Received) & """, " &
                """Name"": """ & getName(M.User_Received) & """, " &
                """Surname"": """ & getSurname(M.User_Received) & """ }" &
             "}";
   end To_JSON;

end Message_Pkg;
