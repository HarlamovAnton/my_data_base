unit vibor;
interface
type db
     data_base= record
       name_app: string;
       size_memory: integer;
       price: integer;
       rating:integer;
       producer: string;
       email:string;
     end;

procedure vibor_deistvii(j,i:integer);
implementation
uses crt,vvod_menu,vivod_menu,write_file,read_file,setting,general_menu;
var n:integer;
    data_base_imperation:array[1..7] of data_base;
    data_product_imperation:array[1..7] of data_product;
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
  if j<>6 then
  begin
    case j of
      1:begin
          case i of
            1:imperation_vvod(data_base_imperation,data_product_imperation,n);
          end;
        end;
      2:begin
          case i of
            1:vivod_imperation(data_base_imperation);
          end;
        end;
      3:begin
          case i of
            1:wbestypefile;
            2:wxmlfile;
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

