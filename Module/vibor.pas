unit vibor;
interface

//Типы массивов
type
    data_product=record
      producer:string;
      email:string;
    end;
    data_base= record
       name_app: string;
       size_memory: integer;
       price: integer;
       rating:integer;
       producer:integer;
       support:data_product;
    end;

//Процедуры
procedure vibor_deistvii(j,i:integer);

implementation
uses crt,vvod_menu,vivod_menu,write_file,read_file,setting,general_menu;
var n:integer;
    data_base_imperation:array[1..7] of data_base;

function zapolnenie(var data_base_imperation:array of data_base):boolean;
var i :integer;
begin
  for i:=1 to 7 do
  begin
    data_base_imperation[i].name_app:='';
    data_base_imperation[i].price:=0;
    data_base_imperation[i].producer:=0;
    data_base_imperation[i].size_memory:=0;
    data_base_imperation[i].rating:=0;
    data_base_imperation[i].support.producer:='';
    data_base_imperation[i].support.email:='';
  end;
end;

{****f* vibor/vibor_deistvii
*  ARGUMENTS
*    This is procedure :
*    j(integer)-number main menu
*    i(integer)-number sub menu
*  PURPOSE
*    This if procedure dlya vibora deistvii
*  RESULT
*    Zapusk sootvetstvyuchei podprogrammi
******}
procedure vibor_deistvii(j,i:integer);
begin
  //zapolnenie(data_base_imperation);
  if j<>6 then
  begin
    case j of
      1:begin
          case i of
            1:imperation_vvod(data_base_imperation,n);
          end;
        end;
      2:begin
          case i of
            1:vivod_imperation(data_base_imperation);
          end;
        end;
      3:begin
          case i of
            1:wbestypefile(data_base_imperation);
            2:wxmlfile(data_base_imperation);
            3:wtextfile(data_base_imperation);
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
            1:choice_textcolor(colortext,colorback,colorramka);
            2:choice_backgroundcolor(colortext,colorback,colorramka);
            3:choice_ramkacolor(colortext,colorback,colorramka);
          end;
        end;
    end;
    clrscr;
  end;
end;

end.

