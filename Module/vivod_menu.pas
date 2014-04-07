unit vivod_menu;

interface

uses vibor,crt;

procedure vivod_imperation(data_base_imperation:array of data_base);

implementation





{****f* vivod_menu/vivod_imperation
*  ARGUMENTS
*    data_base_imperation massive type data_base
*  PURPOSE
*    Vivod tablici iz massiva
*  RESULT
*    Table s dannimi
******}
procedure vivod_imperation(data_base_imperation:array of data_base);
var i:integer;
    c:char;
    mas_vvod: array[1..10] of string;
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
  header;
  text_in_header(mas_vvod);
  table_one;
  board;
  writeTEXT(data_base_imperation);
  repeat
      c:=readkey;
  until c=#27;
end;

end.

