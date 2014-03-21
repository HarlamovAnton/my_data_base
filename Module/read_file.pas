unit read_file;
interface
procedure rbestypefile;
procedure rxmlfile;
procedure rtextfile;
implementation
uses crt;

{****f* read_file/rbestypefile
*  ARGUMENTS
*    ne immeutsaya
*  PURPOSE
*    Chtenie v bestype file
*  RESULT
*    File s data
******}
procedure rbestypefile;
begin
  clrscr;
  write('Ya zagruzil dannie v bestype file');
  readln;
  clrscr;
end;

{****f* read_file/rxmlfile
*  ARGUMENTS
*    ne immeutsaya
*  PURPOSE
*    Chtenie v bestype file
*  RESULT
*    File s data
******}
procedure rxmlfile;
begin
  clrscr;
  write('Ya zagruzil dannie v xml file');
  readln;
  clrscr;
end;

{****f* read_file/rtextfile
*  ARGUMENTS
*    ne immeutsaya
*  PURPOSE
*    Chtenie v bestype file
*  RESULT
*    File s data
******}
procedure rtextfile;
begin
  clrscr;
  write('Ya zagruzil dannie v text file');
  readln;
  clrscr;
end;

end.

