unit text_for_sub_menu;

interface

function text_fsm(kop: integer): integer;

implementation

uses crt,general_menu;



{
Функция предназначена для
1.Вывод дополнительного меню
2.Выбор нужного элемента(для выполнения действий)
}
function text_fsm(kop: integer): integer;
var
  t_fsm: array[1..3] of string;
  x, y: integer;
  c: char;
  l, p: integer;
  f: integer;
  {
Процедура предназначена для вывода текста из массива строк t_fsm
}
procedure v_t_fsm(var t_fsm: array of string);
var
  i: integer;
begin
  for i := 1 to 3 do
  begin
    gotoxy(21, kop + i + 2);
    if i = 1 then
    begin
      textbackground(colortext+2);
      Write(' ', #16, t_fsm[0]{,#17});
      textbackground(colorback);
    end
    else Write(' ', t_fsm[i - 1], ' ');
  end;
end;

begin
  textcolor(colortext);
  case kop of
    1:
    begin
      f := 2;
      t_fsm[1] := 'В маssив';
      t_fsm[2] := 'В sпиsок';
    end;
    2:
    begin
      f := 2;
      t_fsm[1] := 'Из маssива';
      t_fsm[2] := 'Из sпиsка';
    end;
    3, 4:
    begin
      f := 3;
      t_fsm[1] := 'Бестиповый файл';
      t_fsm[2] := 'Табличный .xml';
      t_fsm[3] := 'Текстовый';
    end;
    5:
    begin
      f := 3;
      t_fsm[1] := 'Цвет текста';
      t_fsm[2] := 'Цвет фона';
      t_fsm[3] := 'Цвет рамки';
    end;
    6:
    begin
      f := 2;
      t_fsm[1] := '  Да ';
      t_fsm[2] := '  Нет ';
    end;
  end;
  v_t_fsm(t_fsm);
  x:=21;
  y:=3+kop;
  l:=3+kop;
  p:=2+kop+f;
  kop:=1;
  repeat
    gotoxy(x, y);
    c := readkey;
    if c = #0 then
    begin
      c := readkey;
      case Ord(c) of
        72:
        begin
          if y <> l then
          begin
            textbackground(colorback);
            Write(' ', t_fsm[kop], ' ');
            y := y - 1;
            kop := kop - 1;
            gotoxy(x, y);
            textbackground(colortext+2);
            Write(' ', #16, t_fsm[kop]{,#17});
          end;
        end;
        80:
        begin
          if y <> p then
          begin
            textbackground(colorback);
            Write(' ', t_fsm[kop], ' ');
            y := y + 1;
            kop := kop + 1;
            gotoxy(x, y);
            textbackground(colortext+2);
            Write(' ', #16, t_fsm[kop]{,#17});
          end;
        end;
      end;
    end;
  until (c = #75) or (c = #13);
  textbackground(colorback);
  if c = #13 then text_fsm := kop
  else text_fsm := 0;
end;

end.
