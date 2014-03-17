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
  //Консоль ввод
  for i:=1 to n do
  begin
    gotoxy(1,1);
    write(#190);
    write('Имя приложения: ');
    writeln(data_base_one_console[i].name_app);
    write('Занимаемая память: ');
    writeln(data_base_one_console[i].size_memory);
    write('Цена: ');
    writeln(data_base_one_console[i].price);
    write('Разработчик: ');
    writeln(data_base_one_console[i].producer);
    write('Рейтинг: ');
    writeln(data_base_one_console[i].rating);
  end;
  readln;
end;

end.

