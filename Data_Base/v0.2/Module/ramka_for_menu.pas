unit ramka_for_menu;
interface
procedure ramka_menu(x1,y1,x2,y2,c:integer);
procedure line(var j:integer;c:integer);
procedure ramka_two_menu(j:integer;c:integer);
implementation
uses crt,text_for_sub_menu;
const zero=0;
{
��楤��
�뢮� �����
j-����� ��ப�
c-����� 梥�
}
procedure line(var j:integer;c:integer);
begin
  textcolor(c);
  gotoxy(17,j+1);write(#220);write(#220);write(#220);
  textcolor(white);
end;
{
��楤��
�1-��砫쭠� �窠
�1-����筠� �窠
�2-����� ���孥� � ������ �����
�2-���� ����� � �ࠢ�� �����
�-梥�
}
procedure ramka_menu(x1,y1,x2,y2,c:integer);
var i:integer;
begin
  textcolor(c);
  gotoxy(x1,y1);
  for i:=1 to y2-1 do write(#220);{������ �����}
  for i:=2 to x2  do {�����}
  begin
    gotoxy(x1+1,i);write(#221);
  end;
  for i:=1 to (y2 div 2) do {�ࠢ�� �����}
  begin
    gotoxy(y2,i);write(#221);
  end;
  for i:=2 to y2-1 do {����� �����}
  begin
    gotoxy(i,x2);write(#220);
  end;
  gotoxy(y2,x1+1);write(#187);{}
  gotoxy(y2,x2);write(#188);{}
  gotoxy(x1+1,x2);write(#200);{}
  gotoxy(x1+1,x1+1);write(#201);{}
  textcolor(white);
end;
{
��楤�� ��� �뢮� ⥪�� ��� �������⥫�� ����
j-����� �������� ����� ���ᨢ�
}
procedure zzz(j:integer);
begin
  gotoxy(20,j);
  case j of
  1:write('#����________________=');
  2:write('#�뢮�_______________=');
  3:write('#������__________=');
  4:write('#�⥭��__________=');
  5:write('#����ன��_________=');
  6:write('#��室_=');
  end;
end;
{
��楤��
�뢮� �����쭨⥫쭮� ࠬ��
}
procedure ramka_two_menu(j:integer;c:integer);
var i:integer;
    dl,vs:integer;{dl - �ਭ�. vs-����}
begin
  zzz(j);textcolor(c);
  case j of
    1,2:begin{���� ������}{�뢮� ������}
        dl:=24;vs:=4;
        end;
    3,4:begin{������}{�⥭��}
        dl:=20;vs:=5;
        end;
    5:begin{����ன��}
        dl:=22;vs:=5;
      end;
    6:begin{��室}
        dl:=10;vs:=4;
      end;
  end;
  {���� line}
  for i:=1 to dl do
  begin
    gotoxy(19+i,j+1);write(#220);
  end;
  {�ࠢ�� line}
  for i:=1 to vs do
  begin
    gotoxy(19+dl,j+i+1);write(#186);
  end;
  {�����  line}
  for i:=1 to vs do
  begin
    gotoxy(20,j+i+1);write(#186);
  end;
  gotoxy(20,j+vs+2);write(#200);
  {��� line}
  for i:=1 to dl-2 do
  begin
    gotoxy(20+i,j+vs+2);write(#209);
  end;
  write(#188);
end;

end.

