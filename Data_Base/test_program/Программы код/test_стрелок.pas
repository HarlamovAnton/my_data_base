program test_keyboad;
uses crt;
var c:char;
    b:boolean;
begin
  b:=true;
  repeat
    c:=readkey;
    if c=#0 then
    begin
      c:=readkey;
      write(ord(c));
    end
    else b:=false;
  until b=false;
  readln;
end.