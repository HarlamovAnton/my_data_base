unit read_file;
interface
procedure rbestypefile;
procedure rxmlfile;
procedure rtextfile;
implementation
uses crt;

procedure rbestypefile;
begin
  clrscr;
  write('Ya zagruzil dannie v bestype file');
  readln;
  clrscr;
end;

procedure rxmlfile;
begin
  clrscr;
  write('Ya zagruzil dannie v xml file');
  readln;
  clrscr;
end;

procedure rtextfile;
begin
  clrscr;
  write('Ya zagruzil dannie v text file');
  readln;
  clrscr;
end;

end.

