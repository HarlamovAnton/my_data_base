unit write_file;
interface
uses vibor;
//Write for bez type
procedure wbestypefile(data_base_imperation:array of data_base);
//Write for xml
procedure wxmlfile(data_base_imperation:array of data_base);
//Write for text file
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
procedure wbestypefile(data_base_imperation:array of data_base);
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
procedure wxmlfile(data_base_imperation:array of data_base);
var f:text;
    s:string;
    i:integer;
begin
  clrscr;
  {$I-}
  assign(f,'abs.xml');
  rewrite(f);
  //for i:=1 to 7 do
  //begin
    i:=1;
    str(i,s);
    s:='<Prilozhenies id="'+s+'">';
    writeln(f,s);

    s:=data_base_imperation[i].name_app;
    s:='  <Name>'+s+'</Name>';
    writeln(f,s);

    str(data_base_imperation[i].size_memory,s);
    s:='  <SizeMemory>'+s+'</SizeMemory>';
    writeln(f,s);

    str(data_base_imperation[i].price,s);
    s:='  <Price>'+s+'</Price>';
    writeln(f,s);

    str(data_base_imperation[i].rating,s);
    s:='  <Rating>'+s+'</Rating>';
    writeln(f,s);

    str(data_base_imperation[i].producer,s);
    s:='  <NumberProducer>'+s+'</NumberProducer>';
    writeln(f,s);

    s:=data_base_imperation[i].support.email;
    s:='  <EmailProducer>'+s+'</EmailProducer>';
    writeln(f,s);

    s:=data_base_imperation[i].support.producer;
    s:='  <NameProducer>'+s+'</NameProducer>';
    writeln(f,s);

    s:='</Prilozhenies>';
    writeln(f,s);
  //end;
  close(f);
  {$I+}
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
    i:integer;
begin
  clrscr;
  {$I-}
  assign(f,'abs.txt');
  rewrite(f);
  //for i:=1 to 7 do
  //begin
    i:=1;
    str(i,s);
    s:='Prilozhenie id = '+s;
    writeln(f,s);

    s:=data_base_imperation[i].name_app;
    writeln(f,s);

    str(data_base_imperation[i].size_memory,s);
    writeln(f,s);

    str(data_base_imperation[i].price,s);
    writeln(f,s);

    str(data_base_imperation[i].rating,s);
    writeln(f,s);

    str(data_base_imperation[i].producer,s);
    writeln(f,s);

    s:=data_base_imperation[1].support.email;
    writeln(f,s);

    s:=data_base_imperation[1].support.producer;
    writeln(f,s);
  //end;
  close(f);

  write('Ya zapisivayu dannie v text file');

  readln;

  clrscr;
  {$I+}

end;

end.

