unit write_file;
interface
procedure wbestypefile;
procedure wxmlfile;
procedure wtextfile;
implementation
uses crt;

procedure wbestypefile;
begin
  clrscr;
  write('Ya zapisivayu dannie v bestype file');
  readln;
  clrscr;
end;

procedure wxmlfile;
begin
  clrscr;
  write('Ya zapisivayu dannie v xml file');
  readln;
  clrscr;
end;

procedure wtextfile;
begin
  clrscr;
  write('Ya zapisivayu dannie v text file');
  readln;
  clrscr;
end;

end.

