unit general_menu;
interface
const end_m=7;{���-�� ��ப � ������� ����}
procedure v_menu;
implementation
uses crt,ramka_for_menu,text_for_sub_menu,element_videleniya;
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
//const end_m=7;{���-�� ��ப � ������� ����}
var msfm:array[1..end_m] of string;
    x,y:integer;
    c:char;
    i,j:integer;
begin
  msfm[1]:='���� ������';
  msfm[2]:='�뢮� ������';
  msfm[3]:='������';
  msfm[4]:='�⥭��';
  msfm[5]:='����ன��';
  msfm[6]:='���ࠡ��稪';
  msfm[7]:='��室';
  x:=3;y:=2;j:=1;
  repeat
    textbackground(black);textcolor(white);clrscr;
    ramka_menu(0,0,end_m+2,17,5);
    for i:=1 to end_m do
    begin
      gotoxy(x-1,i+1);
      if i=j then
      begin
        textbackground(red);write(' ',#16,msfm[j]{,#17});textbackground(black);
      end
      else write(' ',msfm[i],' ');
    end;
    {
    ��楤��
    }

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
                 textbackground(black);write(' ',msfm[j],' ');
                 y:=y-1;j:=j-1;gotoxy(x,y);
                 textbackground(12);write(#16,msfm[j]{,#17});
               end;
             end;
          80:begin
               if y<>end_m+1 then
               begin
                 textbackground(black);write(' ',msfm[j],' ');
                 y:=y+1;j:=j+1;gotoxy(x,y);
                 textbackground(12);write(#16,msfm[j]{,#17});
               end;
             end;
        end;
      end;
    until c=#77;

    textbackground(black);
    repeat
      line(j,5);
      ramka_two_menu(j,5);
      text_fsm(j);
      c:=readkey;
      if c=#0 then c:=readkey;
    until c=#75;
  until (i=end_m)and(c=#13);
end;

end.