unit general_menu;

interface

const end_m=6;{���-�� ��ப � ������� ����}
var colortext,colorback,colorramka:integer;
procedure v_menu;

implementation

uses crt,ramka_for_menu,text_for_sub_menu,vibor;

procedure about_for_me;
begin
  textbackground(red);
  textcolor(white);
  writeln('/*');
  writeln('@Harlamov Anton P-202');
  writeln('Begin : 10.02.2014');
  writeln('Version : 0.1 ');
  writeln('*/');
  textbackground(black);
end;

procedure v_menu;
const end_m=6;{���-�� ��ப � ������� ����}
var msfm:array[1..end_m] of string;
    x,y:integer;
    c:char;
    i,g_m:integer;
    exit_g:boolean;
    exit_1:boolean;
begin
  exit_1:=false;
  exit_g:=true;
  msfm[1]:='���� ������';
  msfm[2]:='�뢮� ������';
  msfm[3]:='������';
  msfm[4]:='�⥭��';
  msfm[5]:='����ன��';
  msfm[end_m]:='��室';
  x:=3;y:=2;g_m:=1;
  repeat
    textbackground(black);textcolor(white);gotoxy(1,1);//clrscr;
    ramka_menu(0,0,end_m+2,17,5);
    for i:=1 to end_m do
    begin
      gotoxy(x-1,i+1);
      if i=g_m then
      begin
        textbackground(red);write(' ',#16,msfm[g_m]{,#17});textbackground(black);
      end
      else write(' ',msfm[i],' ');
    end;
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
                 textbackground(black);write(' ',msfm[g_m],' ');
                 y:=y-1;g_m:=g_m-1;gotoxy(x,y);
                 textbackground(12);write(#16,msfm[g_m]{,#17});
               end;
             end;
          80:begin
               if y<>end_m+1 then
               begin
                 textbackground(black);write(' ',msfm[g_m],' ');
                 y:=y+1;g_m:=g_m+1;gotoxy(x,y);
                 textbackground(12);write(#16,msfm[g_m]{,#17});
               end;
             end;
        end;
      end;
    until c=#77;
    textbackground(black);
    repeat
      textbackground(black);textcolor(white);clrscr;
      ramka_menu(0,0,end_m+2,17,5);
      for i:=1 to end_m do
      begin
        gotoxy(x-1,i+1);
        if i=g_m then
        begin
          textbackground(red);write(' ',#16,msfm[g_m]{,#17});textbackground(black);
        end
        else write(' ',msfm[i],' ');
      end;
      line(g_m,5);
      ramka_two_menu(g_m,5);
      i:=text_fsm(g_m);
      clrscr;
      if i<>0 then vibor_deistvii(g_m,i)
      else exit_1:=true;
    until (exit_1=true)or(g_m=6);
  until (g_m=6)and(i=1);
end;

end.
