program one;
uses crt;
var s:string;
    c:char;b:boolean;
begin
 b:=true;
  repeat
    write('Строку ');
    read(s);
    writeln(length(s));
  until b=false;
end.