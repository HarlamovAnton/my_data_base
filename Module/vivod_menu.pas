unit vivod_menu;

interface

uses vibor,crt;

procedure vivod_console(var n:integer;data_base_one_console:array of data_base_one);

implementation

procedure vivod_console(var n:integer;data_base_one_console:array of data_base_one);
var i:integer;
begin
  clrscr;
  //write('Ya tut');
  //write(n);
  //���᮫� ����
  for i:=1 to n do
  begin
    gotoxy(1,1);
    write(#190);
    write('��� �ਫ������: ');
    writeln(data_base_one_console[i].name_app);
    write('���������� ������: ');
    writeln(data_base_one_console[i].size_memory);
    write('����: ');
    writeln(data_base_one_console[i].price);
    write('���ࠡ��稪: ');
    writeln(data_base_one_console[i].producer);
    write('���⨭�: ');
    writeln(data_base_one_console[i].rating);
  end;
  readln;
end;

end.

