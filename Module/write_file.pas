unit write_file;
interface
uses vibor;
procedure wbestypefile;
procedure wxmlfile;
procedure wtextfile(data_base_imperation:array of data_base);
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
procedure wtextfile(data_base_imperation:array of data_base);
var f:text;
    s:string;
begin
  clrscr;
  {$I-}
  assign(f,'abs.txt');
  rewrite(f);
  s:=data_base_imperation[1].name_app;
  writeln(f,s);

  str(data_base_imperation[1].size_memory,s);
  writeln(f,s);

  str(data_base_imperation[1].price,s);
  writeln(f,s);

  str(data_base_imperation[1].rating,s);
  writeln(f,s);

  s:=data_base_imperation[1].producer;
  writeln(f,s);

  close(f);
  write('Ya zapisivayu dannie v text file');
  readln;
  {$I+}
  clrscr;
end;

end.

