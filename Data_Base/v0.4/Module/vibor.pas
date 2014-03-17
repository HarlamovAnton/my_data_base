unit vibor;
interface
type data_base= record
       name_app: string[20];
       size_memory: integer;
       price: integer;
       producer: string;
       rating:1..100;
     end;

procedure vibor_deistvii(j,i:integer);
implementation
uses crt,vvod_menu,vivod_menu,write_file,read_file,setting,general_menu;
var n:integer;
    data_base_imperation:array[1..10] of data_base;
{
Процедура выбора действия
j-номер главного меню
i-номер действия дополнительного меню
//обе переменные целочисленные
}
procedure vibor_deistvii(j,i:integer);
begin
  if j<>6 then
  begin
    writeln(j);
    writeln(i);
    case j of
      1:begin
          case i of
            1:n:=imperation_vvod(data_base_imperation);
          end;
        end;
      2:begin
          case i of
            1:vivod_imperation(n,data_base_imperation);
          end;
        end;
      3:begin
          case i of
            1:wbestypefile;
            2:wxmlfile;
            3:wtextfile;
          end;
        end;
      4:begin
          case i of
            1:rbestypefile;
            2:rxmlfile;
            3:rtextfile;
          end;
        end;
      5:begin
          case i of
            1:choice_textcolor(colortext);
            2:choice_backgroundcolor(colorback);
            3:choice_ramkacolor(colorramka);
          end;
        end;
    end;
  end;
end;

end.

