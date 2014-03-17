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
  write('Ya zagruzhau dannie v bestype file');
end;

procedure rxmlfile;
begin
  clrscr;
  write('Ya zagruzhau dannie v xml file');
end;

procedure rtextfile;
begin
  clrscr;
  write('Ya zagruzhau dannie v text file');
end;

end.

