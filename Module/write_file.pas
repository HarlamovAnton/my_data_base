unit write_file;
interface
procedure wbestypefile;
procedure wxmlfile;
procedure wtextfile;
implementation
uses crt;

{****f* write_file/wbestypefile
*  ARGUMENTS
*    ne immeutsaya
*  PURPOSE
*    Zapis v bestype file
*  RESULT
*    File s data
******}
procedure wbestypefile;
begin
  clrscr;
  write('Ya zapisivayu dannie v bestype file');
  readln;
  clrscr;
end;

{****f* write_file/wxmlfile
*  ARGUMENTS
*    ne immeutsaya
*  PURPOSE
*    Zapis v xml file
*  RESULT
*    File s data
******}
procedure wxmlfile;
begin
  clrscr;
  write('Ya zapisivayu dannie v xml file');
  readln;
  clrscr;
end;

{****f* write_file/wtextfile
*  ARGUMENTS
*    ne immeutsaya
*  PURPOSE
*    Zapis v txt file
*  RESULT
*    File s data
******}
procedure wtextfile;
begin
  clrscr;
  write('Ya zapisivayu dannie v text file');
  readln;
  clrscr;
end;

end.

