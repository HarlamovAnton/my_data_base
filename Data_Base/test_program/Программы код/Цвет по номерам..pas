program one;
uses crt;
var i:integer;
begin
  for i:=1 to 15 do
  begin
    textcolor(i);
    writeln(i,'  -_-');
  end;
  readln;
end.