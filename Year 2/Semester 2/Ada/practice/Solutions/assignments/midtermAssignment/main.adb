--Name: Meshack Nyagwencha Bosire
--Neptun Code: IVF370

with Ada.Calendar, Ada.Calendar.Formatting, Ada.Text_IO, Ada.Strings.Fixed;
use Ada.Calendar, Ada.Calendar.Formatting, Ada.Text_IO, Ada.Strings.Fixed;

-----------------------------------
--Add any other imports needed here:

-----------------------------------
--with Message;
with User_Pkg;
with Message_Pkg;
with Controller_Pkg;

use User_Pkg;
use Message_Pkg;

procedure Main is
   
   --------------------------------
   --Implement all needed declarations, packages and/or functions, procedures here:

   --subtype Email_String is String(1 .. 25);


   function User_Condition(K : String; U : User_Pkg.User) return Boolean is
   begin
      return User_Pkg.getEmail(U) = K;
   end User_Condition;

   function User_JSON(U : User_Pkg.User) return String is
   begin
      return "{" &
         """Email"": """ & User_Pkg.getEmail(U) & """, " &
         """Name"": """ & User_Pkg.getName(U) & """, " &
         """Surname"": """ & User_Pkg.getSurname(U) & """}";
   end User_JSON;

  
   function Message_Condition(K : Integer; M : Message_Pkg.Message) return Boolean is
   begin
      return Message_Pkg.getID(M) = K;
   end Message_Condition;

   function Message_JSON(M : Message_Pkg.Message) return String is
   begin
      return Message_Pkg.To_JSON(M);
   end Message_JSON;

  
   package User_Controller is new Controller_Pkg(Elem => User_Pkg.User, Key=> String, Condition => User_Condition,JSON => User_JSON);
   package Message_Controller is new Controller_Pkg(Elem => Message_Pkg.Message, Key=> Integer, Condition => Message_Condition,JSON => Message_JSON);

   U_Cntrl : User_Controller.Controller(10);
   M_Cntrl : Message_Controller.Controller(10);



   -------------------------------
   --DO NOT MODIFY ANYTHING BELOW THIS LINE!
   
   type User_Arr is array(Natural range <>) of User;
   type Message_Arr is array(Natural range <>) of Message;
   
   U_Arr: User_Arr(1..10);
   M_Arr: Message_Arr(1..10);

   U11: User;
   M11: Message;
begin	   

   for I in U_Arr'Range loop
      Create_User(U_Arr(I), "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com", "name" & I'Image, "surname" & I'Image, I + 10);
   end loop;
   
   for I in M_Arr'Range loop
      Create_Message(M_Arr(I), I, "some text " & Trim(I'Image, Ada.Strings.Left), Image(Clock), U_Arr(I), U_Arr( ((I+5) mod U_Arr'Length) + 1 ));
   end loop;
   
   for I in U_Arr'Range loop
      User_Controller.Create(U_Cntrl, U_Arr(I));
   end loop;
   New_Line;
   
   for I in M_Arr'Range loop
      Message_Controller.Create(M_Cntrl, M_Arr(I));
   end loop;   
   New_Line;

   Message_Controller.Create(M_Cntrl, M_Arr(1));
   New_Line;
   
   for I in U_Arr'Range loop
      User_Controller.Read(U_Cntrl, "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com");
   end loop;
   New_Line;
   
   for I in M_Arr'Range loop
      Message_Controller.Read(M_Cntrl, I);
   end loop;
   New_Line;
   
   User_Controller.Read(U_Cntrl, "user11@email.com");
   New_Line;
   
   Create_User(U11, "user10@email.com", "name11", "surname11", 20);
   User_Controller.Update(U_Cntrl, "user10@email.com", U11);
   New_Line;
   
   Create_Message(M11, 10, "Lorem Ipsum", Image(Clock), U_Arr(1), U_Arr(2));
   Message_Controller.Update(M_Cntrl, 10, M11);
   New_Line;
   
   for I in U_Arr'Range loop
      User_Controller.Read(U_Cntrl, "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com");
   end loop;
   New_Line;
   
   for I in M_Arr'Range loop
      Message_Controller.Read(M_Cntrl, I);
   end loop;
   New_Line;
   
   
   User_Controller.Update(U_Cntrl, "user11@email.com", U_Arr(1));
   New_Line;
   
   Message_Controller.Update(M_Cntrl, 11, M_Arr(1));
   New_Line;
   
   User_Controller.Delete(U_Cntrl, "user10@email.com");
   New_Line;
   
   Message_Controller.Delete(M_Cntrl, 10);
   New_Line;
   
   for I in U_Arr'Range loop
      User_Controller.Read(U_Cntrl, "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com");
   end loop;
   New_Line;
   
   for I in M_Arr'Range loop
      Message_Controller.Read(M_Cntrl, I);
   end loop;
   New_Line;
   
   User_Controller.Delete(U_Cntrl, "user10@email.com");
   New_Line;
   
   Message_Controller.Delete(M_Cntrl, 10);
   New_Line;
   
end Main;
