unit vvod_menu;

interface

uses crt, vibor;

function konsol_vvod(var data_base_one_console: array of data_base_one): integer;
function imperation_vvod(var data_base_one_imperation: array of data_base_one): integer;

implementation

{
Процедура для вывода шапкиу
}
procedure header(n: integer);
var i: integer;
begin
  if n = 1 then
  begin
    gotoxy(1, 2);
    Write(#204);//верх правый
    gotoxy(80, 2);
    Write(#185);//верх левый

    gotoxy(1, 5);
    Write(#200);//низ правый
    gotoxy(80, 5);
    Write(#188);//низ левый


    //Ширина шапки
    for i := 2 to 79 do
    begin
      gotoxy(i, 2);
      Write(#205);
      gotoxy(i, 5);
      Write(#205);
    end;

    //Высота шапки
    for i := 3 to 4 do
    begin
      gotoxy(1, i);
      Write(#186);
      gotoxy(80, i);
      Write(#186);
    end;


  end;

end;


{


}


{
Функция проверки строковой переменной.
Являются ли все символы цифрами.
И не привысило ли число диапозона от 1..10
}
function p_diap(s: string; g: integer): boolean;
var f_p_diap_i: integer;
begin
  p_diap := True;
  for f_p_diap_i := 1 to length(s) do
    if not (s[f_p_diap_i] in ['0'..'9']) then p_diap := False;
  if p_diap = True then val(s, f_p_diap_i);
  if (f_p_diap_i <= 0) or (f_p_diap_i > g) then p_diap := False;
end;


{
Функция проверки текстовой переменной S на то ,что первый элемент это буква
или цифра и строка не пустая
}
function p_name(s: string): boolean;
begin
  if s <> '' then
  begin
    if not (s[1] in ['A'..'z', '0'..'9', 'А'..'я','.',' ',',']) then p_name := False
    else p_name := True;
  end;
end;


{
Функция
консольного ввода
1.Заполняет n мерный массива типа data_base_one данными
2.Проверяет данные на корректность
}
function konsol_vvod(var data_base_one_console: array of data_base_one): integer;
var
  i, g: integer;
  s: string;
begin

  repeat
    clrscr;
    Write('Введите кол-во элементов: ');
    readln(s);
  until p_diap(s, 10) = True;
  val(s, g);

  for i := 1 to g do
  begin
    clrscr;
    writeln('Заполните элемент номер: ',i,' / ',g);
    repeat
      Write('Введите имя приложения: ');
      readln(s);
    until (p_name(s) = True) and (length(s) > 0) and (length(s) < 21);
    data_base_one_console[i].name_app := s;

    repeat
      Write('Введите размер приложения: ');
      readln(s);
    until (p_diap(s, 32512) = True);
    val(s, data_base_one_console[i].size_memory);

    repeat
      Write('Введите цену приложения: ');
      readln(s);
    until (p_diap(s, 32000) = True);
    val(s, data_base_one_console[i].price);

    repeat
      Write('Введите имя разработчика: ');
      readln(s);
    until (p_name(s) = True);
    data_base_one_console[i].producer := s;

    repeat
      Write('Введите рейтинг приложения: ');
      readln(s);
    until (p_diap(s, 100) = True);

  end;
  konsol_vvod := g;
end;



function imperation_vvod(var data_base_one_imperation: array of data_base_one): integer;
begin
  clrscr;
  header(1);
  readln;
end;


end.
