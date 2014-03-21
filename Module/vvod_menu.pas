unit vvod_menu;

interface

uses crt, vibor;

function imperation_vvod(var data_base_imperation: array of data_base): integer;

implementation
uses general_menu;

{****f* vvod_menu/p_diap
*  ARGUMENTS
*    s-proveryaetca na cifri(string)
*    g-predeli(integer)
*  PURPOSE
*    Function proverky strokovoi peremennoi
*    Yavlyautcya li strokovaya peremennaya ciframi
*  RESULT
*    True esli vse cifri inache False
******}
function p_diap(s: string; g: integer): boolean;
var
  i, j: integer;
begin
  p_diap := True;
  j := 0;
  i := 0;
  for i := 1 to length(s) do
    if not (s[i] in ['0'..'9']) then p_diap := False;
  if p_diap = True then val(s, j);
  if (j <= 0) or (j > g) then p_diap := False;
end;

{****f* vvod_menu/p_name
*  ARGUMENTS
*    S-strokovya peremennaya (string)
*  PURPOSE
*    Proverka na to chto first element bukva ili cifri ili stroka ne pusta
*  RESULT
*    True ili false
******}
function p_name(s: string): boolean;
begin
  if s <> '' then
    if not (s[1] in ['A'..'z', '0'..'9', 'А'..'я', '.', ' ', ',']) then p_name := False
    else p_name := True;
end;

{****f* vvod_menu/readdate
*  ARGUMENTS
*    1.PBX and PBY - begin koordinati
*    2.PEX and PEY - end koordinati
*  PURPOSE
*    Function for vvod text v ramky
*  RESULT
*    Cho vvel polzovateli s klavi
******}
function readdate(pbx, pby, pex: integer): string;
var
  c: char;//нажатая клавиша
  s: string;//введенные данные
  i, chet: integer;//счетчик
begin
  gotoxy(pbx, pby);
  for i := pbx to pex do Write(' ');
  i := -1;
  s := '';
  repeat
    if pbx + i = pex - 1 then i := 0
    else Inc(i);
    gotoxy(pbx + i, pby);
    c := readkey;
    if c in['A'..'z','0'..'9'] then
    begin
      Write(c);
      s := s + c;
    end;
  until c = #13;
  readdate := s;
end;

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
*    Proverka na to chto first element bukva ili cifri ili stroka ne pusta
*  RESULT
*    True ili false
******}
procedure board;
var i, j: integer;
begin
  for i := 1 to 4 do
  begin
    gotoxy(15 * i, 1);
    Write(#194);
    gotoxy(15 * i, 2);
    Write(#179);
    gotoxy(15 * i, 3);
    Write(#193);
  end;
  j := 3;
  repeat
    for i := 1 to 4 do
    begin
      gotoxy(15 * i, j);
      Write(#197);
      gotoxy(15 * i, j + 1);
      Write(#179);
      gotoxy(15 * i, j + 2);
      Write(#179);
      gotoxy(15 * i, j + 3);
      Write(#197);
    end;
    j := j + 3;
  until j >= 24;
end;

{****f* vvod_menu/select_cell
*  ARGUMENTS
*    Ne imeetsya
*  PURPOSE
*    Vibor yacheiki tablici
*  RESULT
*    Nazataiya knopka
******}
procedure select_cell;
var x,y,i:integer;
    c:char;
begin
  repeat
    x := 2;
    y := 5;
    textbackground(12);
    gotoxy(x, y);
    Write(' ');
    repeat
      c := readkey;
      if c = #0 then
      begin
        c := readkey;
        case c of
          #72:
          begin
            if y <> 5 then
            begin
              textbackground(black);gotoxy(x,y);Write(' ');
              y:=y-3;
              textbackground(12);gotoxy(x,y);Write(' ');
            end;
          end;
        #75:
        begin
          if x <> 2 then
          begin
            textbackground(black);gotoxy(x,y);Write(' ');
            x:=x-15;
            textbackground(12);gotoxy(x,y);Write(' ');
          end;
        end;
        #77:
        begin
          if x <>62 then
          begin
            textbackground(black);gotoxy(x,y);Write(' ');
            x:=x+15;
            textbackground(12);gotoxy(x,y);Write(' ');
          end;
        end;
        #80:
        begin
          if y <> 23 then
          begin
            textbackground(black);gotoxy(x,y);Write(' ');
            y:=y+3;
            textbackground(12);gotoxy(x,y);Write(' ');
          end;
        end;
      end;
    end;
  until (c = #27)or(c=#13);
  //if c<>#13 then select_cell:=c
  {else
  begin
    case x of

    end;
  end;}
  until c=#27;
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
function imperation_vvod(var data_base_imperation: array of data_base): integer;
var
  i, j, g: integer;
  mas_vvod: array[1..10] of string;
  c:char;
begin

  clrscr;
  textbackground(black);textcolor(white);
  mas_vvod[2] := '     Имя    ';
  mas_vvod[3] := '      Размер    ';
  mas_vvod[4] := '      Цена      ';
  mas_vvod[5] := '    Рейтинг        ';
  mas_vvod[6] := 'Разработчик';

  header;
  text_in_header(mas_vvod);//Шапка
  table_one;
  board;
  repeat
    //c:=select_cell;
  until  c=#27;
  imperation_vvod := 10;
  textbackground(colorback);textcolor(colortext);

end;

end.
