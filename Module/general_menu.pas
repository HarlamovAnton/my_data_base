unit general_menu;

interface

const end_m=6;{Кол-во строк в главном меню}
var colortext,colorback,colorramka:integer;
procedure v_menu;

implementation
uses crt,ramka_for_menu,text_for_sub_menu,vibor;
{****f* general_menu/v_menu
*  ARGUMENTS
*    This is procedure ne imeet argumentov
*  PURPOSE
*    This if procedure for main menu
*  RESULT
*    Vivod menu
******}
//TODO 25 строк
procedure v_menu;
const end_m=6;{Кол-во строк в главном меню}
      msfm:array[1..end_m] of string = ('Ввод данных','Вывод данных','Запись','Чтение','Настройки','Выход');
      exit_1:boolean=false;
      exit_g:boolean=true;
      x:integer =3;
      y:integer =2;
      g_m:integer =1;
var
    c:char;
    i:integer;

  procedure v_text_fgm;
  var i:integer;
  begin
    for i:=1 to end_m do
    begin
      gotoxy(x-1,i+1);
      if i=g_m then
      begin
        textbackground(colortext+2);
        write(' ',#16,msfm[g_m]);
        textbackground(colorback);
      end
      else write(' ',msfm[i],' ');
    end;
  end;

begin
  clrscr;
  colortext:=15;
  colorback:=8;
  colorramka:=12;
  repeat
    textbackground(colorback);textcolor(colortext);clrscr;
    gotoxy(1,1);
    ramka_menu(0,0,end_m+2,17,colorramka);
    v_text_fgm;
    repeat
      gotoxy(x-1,y);
      c:=readkey;
      if c=#0 then
      begin
        c:=readkey;
        case Ord(c) of
          72:begin
               if y <> 2 then
               begin
                 //TODO эти три строки отличаются от следующих трех строк шаюлонным отличием: +-
                 textbackground(colorback);write(' ',msfm[g_m],' ');
                 y:=y-1;g_m:=g_m-1;gotoxy(x,y);
                 textbackground(colortext+2);write(#16,msfm[g_m]{,#17});
               end;
             end;
          80:begin
               if y<>end_m+1 then
               begin
                 textbackground(colorback);write(' ',msfm[g_m],' ');
                 y:=y+1;g_m:=g_m+1;gotoxy(x,y);
                 textbackground(colortext+2);write(#16,msfm[g_m]{,#17});
               end;
             end;
        end;
      end;
    until c=#77;
    repeat
      textbackground(colorback);textcolor(colortext);
      clrscr;
      ramka_menu(0,0,end_m+2,17,colorramka);
      v_text_fgm;
      line(g_m,colorramka);
      ramka_two_menu(g_m,colorramka);
      i:=text_fsm(g_m);
      clrscr;
      if i<>0 then vibor_deistvii(g_m,i)
      else exit_1:=true;
    until (exit_1=true)or(g_m=6);

  until (g_m=6)and(i=1);
end;

end.
