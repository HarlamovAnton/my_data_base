unit ramka_for_menu;

interface

procedure ramka_menu(x1,y1,x2,y2,c:integer);

procedure line(var j:integer;c:integer);

procedure ramka_two_menu(j:integer;c:integer);

implementation

uses crt,general_menu;

{
Процедура
Вывод линии
j-номер строки
c-номер цвета
}
{****f* ramka_for_menu/line
*  ARGUMENTS
*    j-nomer stroki
*    c-nomer color
*  PURPOSE
*    vivod linii na stroky N i cveta C
*  RESULT
*    line
******}
procedure line(var j:integer;c:integer);
begin
  textcolor(c);
  gotoxy(17,j+1);write(#220);write(#220);write(#220);
  textcolor(colortext);
end;

{****f* ramka_for_menu/ramka_menu
*  ARGUMENTS
*    x1-begin koordinate
*    y1-begin koordinate
*    x2-end koordinate
*    y2-end koordinate
*    c-cvet ramki
*  PURPOSE
*    Ramka
*  RESULT
*    Ramka cvetya C
******}
procedure ramka_menu(x1,y1,x2,y2,c:integer);
var i:integer;
begin
  textcolor(c);
  gotoxy(x1,y1);
  for i:=1 to y2-1 do write(#220);{Верхняя линия}
  for i:=2 to x2  do {Левая}
  begin
    gotoxy(x1+1,i);write(#221);
  end;
  for i:=1 to (y2 div 2) do {Правая линия}
  begin
    gotoxy(y2,i);write(#221);
  end;
  for i:=2 to y2-1 do {Левая линия}
  begin
    gotoxy(i,x2);write(#220);
  end;
  gotoxy(y2,x1+1);write(#187);{}
  gotoxy(y2,x2);write(#188);{}
  gotoxy(x1+1,x2);write(#200);{}
  gotoxy(x1+1,x1+1);write(#201);{}
  textcolor(colortext);
end;

{****f* ramka_for_menu/zzz
*  ARGUMENTS
*    j-nomer lementa massiva
*  PURPOSE
*    vivod text nad sub menu
*  RESULT
*    text nad menu
******}
procedure zzz(j:integer);
begin
  textcolor(colortext);
  gotoxy(20,j);
  case j of
  1:write('##Ввод##');
  2:write('##Вывод##');
  3:write('##Запись##');
  4:write('##Чтение##');
  5:write('##Настройки##');
  6:write('##Выход##');
  end;
end;

{****f* ramka_for_menu/ramka_two_menu
*  ARGUMENTS
*    j-nomer vibranogo v general menu menyu
*    c-color sub ramka
*  PURPOSE
*    Ramka
*  RESULT
*    Ramka dlya two menu
******}
procedure ramka_two_menu(j:integer;c:integer);
var i:integer;
    dl,vs:integer;{dl - ширина. vs-высота}
begin
  zzz(j);textcolor(c);
  case j of
    1,2:begin{Ввод данных}{Вывод данных}
        dl:=15;vs:=4;
        end;
    3,4:begin{Запись}{Чтение}
        dl:=20;vs:=5;
        end;
    5:begin{Настройки}
        dl:=16;vs:=5;
      end;
    6:begin{Выход}
        dl:=10;vs:=4;
      end;
  end;
  {Верх line}
  for i:=1 to dl do
  begin
    gotoxy(19+i,j+1);write(#220);
  end;
  {Правая line}
  for i:=1 to vs do
  begin
    gotoxy(19+dl,j+i+1);write(#185);
  end;
  {Левая  line}
  for i:=1 to vs do
  begin
    gotoxy(20,j+i+1);write(#204);
  end;
  gotoxy(20,j+vs+2);write(#200);
  {Низ line}
  for i:=1 to dl-2 do
  begin
    gotoxy(20+i,j+vs+2);write(#207);
  end;
  write(#188);
end;

end.

