$a=Read-Host "Write your fav fruit:"

switch($a)
{
    "apple" {"a value:"+$a}
    "orange" {"a value:"+$a}
    "mango"  {"a value:"+$a}
    default     {"a value is unknown:"+$a}
}