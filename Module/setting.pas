unit setting;

interface

procedure choice_textcolor(var colortext, colorback, colorramka: integer);

procedure choice_backgroundcolor(var colortext, colorback, colorramka: integer);

procedure choice_ramkacolor(var colortext, colorback, colorramka: integer);

implementation

uses crt, vvod_menu;

{
Процедура "ramka" рисует рамку
xd,yd-начальные координаты
header-заголовок меню(string)
}
procedure ramka(xd, yd: integer; header: string);
var i: integer;
begin
  gotoxy(xd, yd);
  for i := 1 to 13 do write(#205);
  for i := 1 to 14 do
  begin
    gotoxy(xd, yd + i);
    Write(#186);
    gotoxy(xd + 12, yd + i);
    Write(#186);
  end;
  gotoxy(xd, yd + 14);
  for i := 1 to 13 do write(#205);
  gotoxy(xd+1, yd + 1);
  write(header);
end;

{
Процедура вывода примера цветов
}
procedure zipol;
var i:integer;
begin
  for i:=1 to 12 do
  begin
    gotoxy(35,2+i);
    textbackground(i);
    write('        ');
  end;
  textbackground(black);
end;
{
Процедура выбора цвета текста
}
procedure choice_textcolor(var colortext, colorback, colorramka: integer);
var
  s: string;
  n, y, x: integer;
  c: char;
begin
  textbackground(colorback);textcolor(colorramka);
  ramka(32, 1, 'Цвет текста');
  n := 1;
  x := 33;
  y := 3;
  zipol;
  gotoxy(x, y);
  textcolor(white);
  textbackground(colorback);
  Write('->');
  repeat
    c := readkey;
    case Ord(c) of
      72:
      begin
        if y <> 3 then
        begin
          gotoxy(x, y);
          Write('  ');
          y := y - 1;n:=n-1;
          gotoxy(x, y);
          Write('->');
        end;
      end;
      80:
      begin
        if y <> 14 then
        begin
          gotoxy(x, y);
          Write('  ');
          y := y + 1;n:=n+1;
          gotoxy(x, y);
          Write('->');
        end;
      end;
    end;
  until c = #13;
  if (n<>colorback)and(n<>colorramka)then colortext:=n;
  textcolor(colortext);
end;

{
Процедура выбора цвета фона
}
procedure choice_backgroundcolor(var colortext, colorback, colorramka: integer);
var
  s: string;
  n, y, x: integer;
  c: char;
begin
  textbackground(colorback);textcolor(colorramka);
  ramka(32, 1, ' Цвет фона');
  n := 1;
  x := 33;
  y := 3;
  zipol;
  gotoxy(x, y);
  textcolor(white);
  textbackground(colorback);
  Write('->');
  repeat
    c := readkey;
    case Ord(c) of
      72:
      begin
        if y <> 3 then
        begin
          gotoxy(x, y);
          Write('  ');
          y := y - 1;n:=n-1;
          gotoxy(x, y);
          Write('->');
        end;
      end;
      80:
      begin
        if y <> 14 then
        begin
          gotoxy(x, y);
          Write('  ');
          y := y + 1;n:=n+1;
          gotoxy(x, y);
          Write('->');
        end;
      end;
    end;
  until c = #13;
  if (n<>colortext)and(n<>colorramka)then colorback:=n;
  textcolor(colortext);
end;

{
Процедура выбора цвета рамки
}
procedure choice_ramkacolor(var colortext, colorback, colorramka: integer);
var
  s: string;
  n, y, x: integer;
  c: char;
begin
  textbackground(colorback);textcolor(colorramka);
  ramka(32, 1, 'Цвет рамки');
  n := 1;
  x := 33;
  y := 3;
  zipol;
  gotoxy(x, y);
  textcolor(white);
  textbackground(colorback);
  Write('->');
  repeat
    c := readkey;
    case Ord(c) of
      72:
      begin
        if y <> 3 then
        begin
          gotoxy(x, y);
          Write('  ');
          y := y - 1;n:=n-1;
          gotoxy(x, y);
          Write('->');
        end;
      end;
      80:
      begin
        if y <> 14 then
        begin
          gotoxy(x, y);
          Write('  ');
          y := y + 1;n:=n+1;
          gotoxy(x, y);
          Write('->');
        end;
      end;
    end;
  until c = #13;
  if (n<>colorback)and(n<>colortext)then colorramka:=n;
  textcolor(colortext);
end;

end.
