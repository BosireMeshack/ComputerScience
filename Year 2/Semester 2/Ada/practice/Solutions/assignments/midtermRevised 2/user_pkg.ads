with Ada.Text_IO; with Ada.Strings.Unbounded;
use Ada.Text_IO; use Ada.Strings.Unbounded;

package User_pkg is
 --Use formal parameters
   type User is private;

   procedure Create_User(U: out User; Email: String; Name: String; Surname: String; Age: Natural);
   function getEmail(U:User) return String;
   function getName(U:User) return String;
   function getSurname(U:User) return String;
   function getAge(U:User) return Natural;
   function To_JSON(U :User) return String;

private
   type User is record
   Email: Unbounded_String;
   Name: Unbounded_String;
   Surname: Unbounded_String;
   Age: Natural;

   end record;
end User_pkg;