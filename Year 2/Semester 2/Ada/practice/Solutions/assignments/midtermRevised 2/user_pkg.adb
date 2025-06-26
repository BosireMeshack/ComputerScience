with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Text_IO;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body User_pkg is 
-- Create User Constructor Implementation
procedure Create_User(U: out User; Email: String; Name: String; Surname: String; Age: Natural ) is
begin
   
   U.Email := To_Unbounded_String(Email);
   U.Name := To_Unbounded_String(Name);
   U.Surname := To_Unbounded_String(Surname);
   U.Age := Age; 

end Create_User;

function getEmail(U:User) return String is
begin
   return To_String(U.Email);
end getEmail;
function getName(U:User) return String is
begin
   return To_String(U.Name);
end getName;
function getSurname(U:User) return String is
begin
   return To_String(U.Surname);
end getSurname;
function getAge(U:User) return Natural is
begin
   return U.Age;
end getAge;
function To_JSON(U:User) return String is
 begin
      return "{" &
             """email"": """ & To_String(U.Email) & """, " &
             """name"": """ & To_String(U.Name) & """, " &
             """surname"": """ & To_String(U.Surname) & """, " &
             """age"": " & Natural'Image(U.Age) &
             "}";
   end To_JSON;
end User_pkg;