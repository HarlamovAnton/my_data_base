unit vvod_menu;

interface

uses crt, vibor;

procedure imperation_vvod(var data_base_imperation: array of data_base;var data_product_imperation:array of data_product;var n:integer);

implementation

uses general_menu;

procedure data_product(var data_base_imperation: array of data_base;var data_product_imperation:array of data_product;var n:integer);
var c:char;
  {
  procedure create;
    procedure header;
    procedure text_in_head;
    procedure table_two;
    procedure border;
  begin
    header;
    text_in_head;
    table_two;
    border;
  end;
  }
  {
  function vibor():char;
  begin

  end;
  }
begin
  clrscr;
  {create;}
  repeat
    c:=readkey{vibor};
  until (c=#9) or (c=#27);
  if c = #9 then imperation_vvod(data_base_imperation,data_product_imperation,n);
end;

{****f* vvod_menu/select_cell
*  ARGUMENTS
*    Ne imeetsya
*  PURPOSE
*    Vibor yacheiki tablici i vvod v nix dannix
*  RESULT
*    Nazataiya knopka
******}
function select_cell(var data_base_imperation: array of data_base;var data_product_imperation:array of data_product):char;
const
  x:integer=2;
  y:integer=5;
  i:integer=1;
  j:integer=1;
  s:string='';
var
    c:char;
    ground,z,k:integer;
begin
    gotoxy(x, y);
    repeat

      c:=readkey;

      if c = #0 then
      begin
        c:=readkey;
        case c of
          #72:
          begin
            if y <> 5 then
            begin
              y:=y-3;i:=i-1;
              gotoxy(x,y);
            end;
          end;
          #75:
          begin
            if x <> 2 then
            begin
              x:=x-15;j:=j-1;
              gotoxy(x,y);
            end;
          end;
          #77:
          begin
            if x <>62 then
            begin
              x:=x+15;j:=j+1;
              gotoxy(x,y);
            end;
          end;
          #80:
          begin
            if y <> 23 then
            begin
              y:=y+3;i:=i+1;
              gotoxy(x,y);
            end;
          end;
        end;
      end
      else
      begin

        case j of
        1:begin
            s:=data_base_imperation[i].name_app;
            ground:=13;
          end;
        2:begin
            str(data_base_imperation[i].size_memory,s);
            ground:=15;
          end;
        3:begin
            str(data_base_imperation[i].price,s);
            ground:=15;
          end;
        4:begin
            str(data_base_imperation[i].rating,s);
            ground:=14;
          end;
        5:begin
            s:=data_base_imperation[i].producer;
            ground:=17;
          end;
        end;

        if length(s)>=ground then
        begin
          gotoxy(x,y);
          for z:=ground-2 downto 0  do write(s[length(s)-z]);
        end
        else gotoxy(x+length(s),y);


        case c of
          '0'..'9':begin
                     s:=s+c;
                     write(c);
                   end;
      'A'..'z',' ':begin
                     if not( j in [2..4] ) then
                     begin
                       s:=s+c;
                       write(c);
                     end;
                   end;
        end;

        if j in [2..4] then val(s,k);
        with data_base_imperation[i] do
        begin
          case j of
            1:name_app:=s;
            2:size_memory:=k;
            3:price:=k;
            4:rating:=k;
            5:producer:=s;
          end;
        end;

      end;
  until (c = #27 )or(c =#9);
  select_cell:=c;
  textbackground(black);
end;

{****f* vvod_menu/imperation_vvod
*  ARGUMENTS
*    Data_Base_imperation massiv type data_base hranit vvedennie polizovatelem dannie
*  PURPOSE
*    Function otvechaet za pocledovatelinoe vipolnenie operacii
*  RESULT
*    Vivod tablici , vivod shapki i tak dalee
******}
procedure imperation_vvod(var data_base_imperation: array of data_base;var data_product_imperation:array of data_product;var n:integer);
var
  mas_vvod: array[1..10] of string;
  c:char;
  {****f* vvod_menu/header
  *  ARGUMENTS
  *    Ne imeutcya
  *  PURPOSE
  *    Procedure for vivod head table
  *  RESULT
  *    Head Table
  ******}
  procedure header;
  var i: integer;
  begin
    gotoxy(1, 1);
    Write(#218);//верх левый
    gotoxy(80, 1);
    Write(#191);//верх правый
    gotoxy(1, 3);
    Write(#192);//низ левый
    gotoxy(80, 3);
    Write(#217);//низ правый
    //Ширина шапки
    for i := 2 to 79 do
    begin
      gotoxy(i, 1);
      Write(#196);
      gotoxy(i, 3);
      Write(#196);
    end;
    //Высота шапки
    for i := 2 to 2 do
    begin
      gotoxy(1, i);
      Write(#179);
      gotoxy(80, i);
      Write(#179);
    end;
  end;

  {****f* vvod_menu/text_in_header
  *  ARGUMENTS
  *    MAS_VVOD soderzit text,kotorii vivoditsya v head table
  *  PURPOSE
  *    Text v Head Table
  *  RESULT
  *    Text Head Table
  ******}
  procedure text_in_header(mas_vvod: array of string);
  var i: integer;
  begin
    gotoxy(2, 2);
    for i := 1 to 6 do Write(mas_vvod[i]);
  end;

  {****f* vvod_menu/table_one
  *  ARGUMENTS
  *    Ne imeutsya
  *  PURPOSE
  *    Vivod Table
  *  RESULT
  *    Table
  ******}
  procedure table_one;
  var i, j: integer;
  begin
    for i := 3 to 24 do
    begin
      gotoxy(1, i);
      if i = 3 then Write(#195)
      else Write(#179);
      gotoxy(80, i);
      if i = 3 then Write(#180)
      else Write(#179);
    end;

    for i := 2 to 8 do
      for j := 1 to 80 do
      begin
        gotoxy(j, i * 3);
        case j of
          1: Write(#195);
          80: Write(#180);
          else Write(#196);
        end;
      end;
  end;

  {****f* vvod_menu/board
  *  ARGUMENTS
  *    Ne imeutsya
  *  PURPOSE
  *    Granicha
  *  RESULT
  *    True ili false
  ******}
  procedure board;
  var i, j: integer;
  begin
    for i := 1 to 4 do
    begin
      gotoxy(15 * i, 1);Write(#194);
      gotoxy(15 * i, 2);Write(#179);
      gotoxy(15 * i, 3);Write(#193);
    end;
    j := 3;
    repeat
      for i := 1 to 4 do
      begin
        gotoxy(15 * i, j);Write(#197);
        gotoxy(15 * i, j + 1);Write(#179);
        gotoxy(15 * i, j + 2);Write(#179);
        gotoxy(15 * i, j + 3);Write(#197);
      end;
      j := j + 3;
    until j >= 24;
    gotoxy(1,24);write(#192);
    gotoxy(15,24);write(#193);
    gotoxy(30,24);write(#193);
    gotoxy(45,24);write(#193);
    gotoxy(60,24);write(#193);
    gotoxy(80,24);write(#217);
  end;


  procedure writeTEXT(data_base_imperation: array of data_base);
  var i,j:integer;
      x,y,z:integer;
      s:string;

    function for_kursor(i:integer):integer;
    begin
      case i of
        1:for_kursor:=5*i;
        2:for_kursor:=5*i-2;
        3:for_kursor:=5*i-4;
        4:for_kursor:=5*i-6;
        5:for_kursor:=5*i-8;
        6:for_kursor:=5*i-10;
        7:for_kursor:=5*i-12;
      end;
    end;

    procedure write_data(border:integer;s:string);
    var z:integer;
    begin
      if (length(s)<>0)and(length(s)>border) then
        for z:=border-2 downto 0  do write(s[length(s)-z])
      else write(s);
    end;

  begin
    for i:=1 to 7 do
    begin
      s:=data_base_imperation[i].name_app;
      gotoxy(2,for_kursor(i));write_data(13,s);
      if data_base_imperation[i].size_memory<>0 then
      begin
        str(data_base_imperation[i].size_memory,s);
        gotoxy(16,for_kursor(i));write_data(15,s);
      end;
      if data_base_imperation[i].price<>0 then
      begin
        str(data_base_imperation[i].price,s);
        gotoxy(31,for_kursor(i));write_data(15,s);
      end;
      if data_base_imperation[i].rating<>0 then
      begin
        str(data_base_imperation[i].rating,s);
        gotoxy(46,for_kursor(i));write_data(14,s);
      end;
      s:=data_base_imperation[i].producer;
      gotoxy(62,for_kursor(i));write_data(17,s);
    end;
  end;

begin
  clrscr;
  textbackground(black);textcolor(white);
  mas_vvod[2] := '     Имя    ';
  mas_vvod[3] := '      Размер    ';
  mas_vvod[4] := '      Цена      ';
  mas_vvod[5] := '    Рейтинг        ';
  mas_vvod[6] := 'Разработчик';
  header;//Шапка графика
  text_in_header(mas_vvod);//Текст в шапка
  table_one;//Разделители строк в таблице
  board;//Разделители столбцов в таблице
  if n=7 then  writeTEXT(data_base_imperation);
  repeat
    c:=select_cell(data_base_imperation,data_product_imperation);
  until  (c=#27)or(c=#9);
  n:=7;
  if c=#9 then data_product(data_base_imperation,data_product_imperation,n);
  textbackground(colorback);textcolor(colortext);
end;
end.
