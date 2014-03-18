
unit vibor;

interface

type
    data_base_one = record
    name_app: string[20];
    size_memory: integer;
    price: integer;
    producer: string;
    rating:1..100;
  end;

procedure vibor_deistvii(j,i:integer);

implementation

uses crt,vvod_menu,vivod_menu;

var data_base_one_console: array[1..10] of data_base_one;
    n:integer;
    data_base_one_imperation:array[1..10] of data_base_one;



{
Процедура выбора действия
j-номер главного меню
i-номер действия дополнительного меню
//обе переменные целочисленные
}
procedure vibor_deistvii(j,i:integer);
begin
  clrscr;
  if j<>6 then
  begin
  writeln(j);
  writeln(i);
  case j of
    1:begin
        case i of
          1:n:=konsol_vvod(data_base_one_console);
          2:n:=imperation_vvod(data_base_one_imperation);
        end;
      end;
    2:begin
        case i of
          1:vivod_console(n,data_base_one_console);
          2:;
        end;
      end;
    3:begin
        case i of
          1:;
          2:;
        end;
      end;
    4:begin
        case i of
          1:;
          2:;
        end;
      end;
    5:begin
        case i of
          1:;
          2:;
        end;
      end;
  end;
  readln;
end;
end;

end.

