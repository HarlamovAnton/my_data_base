unit vvod_menu;

interface

uses crt, vibor;

function imperation_vvod(var data_base_imperation: array of data_base): integer;

implementation

{
�㭪�� �஢�ન ��ப���� ��६�����.
�������� �� �� ᨬ���� ��ࠬ�.
� �� �ਢ�ᨫ� �� �᫮ ��������� �� 1..10
s-� �� �஢��塞(������ ���� ����)
� �� ������ ��室��� �� �।��� g
}
function p_diap(s: string; g: integer): boolean;
var
  i, j: integer;
begin
  p_diap := True;
  j := 0;
  i := 0;
  for i := 1 to length(s) do
    if not (s[i] in ['0'..'9']) then
      p_diap := False;
  if p_diap = True then
    val(s, j);
  if (j <= 0) or (j > g) then
    p_diap := False;
end;

{
�㭪�� �஢�ન ⥪�⮢�� ��६����� S �� � ,�� ���� ����� �� �㪢�
��� ��� � ��ப� �� �����
}
function p_name(s: string): boolean;
begin
  if s <> '' then
  begin
    if not (s[1] in ['A'..'z', '0'..'9', '�'..'�', '.', ' ', ',']) then
      p_name := False
    else
      p_name := True;
  end;
end;

{
�㭪�� ��� ����� ⥪�� ���짮��⥫�� � ࠬ��
1.PBX and PBY - �� ��砫�� ���न����
2.PEX and PEY - �� ������ ���न����
}
function readdate(pbx, pby, pex, pey: integer): string;
var
  c: char;//������ ������
  s: string;//�������� �����
  i, chet: integer;//���稪
begin
  gotoxy(pbx, pby);
  for i := pbx to pex do
    Write(' ');
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
  {
  clrscr;
  write(s);
  readln;
  }
  readdate := s;
end;

{
��楤�� ��� �뢮�� 蠯��
}
procedure header;
var
  i: integer;
begin
  gotoxy(1, 1);
  Write(#218);//���� ����
  gotoxy(80, 1);
  Write(#191);//���� �ࠢ�

  gotoxy(1, 3);
  Write(#192);//��� ����
  gotoxy(80, 3);
  Write(#217);//��� �ࠢ�


  //��ਭ� 蠯��
  for i := 2 to 79 do
  begin
    gotoxy(i, 1);
    Write(#196);
    gotoxy(i, 3);
    Write(#196);
  end;

  //���� 蠯��
  for i := 2 to 2 do
  begin
    gotoxy(1, i);
    Write(#179);
    gotoxy(80, i);
    Write(#179);
  end;

end;

{
����� � 蠯�� ⠡����
}
procedure text_in_header(mas_vvod: array of string);
var
  i: integer;
begin
  gotoxy(2, 2);
  for i := 1 to 6 do Write(mas_vvod[i]);
end;

{
�뢮� ⠡����
}
procedure table_one;
var
  i, j: integer;
begin

  for i := 3 to 24 do
  begin
    gotoxy(1, i);
    if i = 3 then
      Write(#195)
    else
      Write(#179);
    gotoxy(80, i);
    if i = 3 then
      Write(#180)
    else
      Write(#179);
  end;

  for i := 2 to 8 do
  begin
    for j := 1 to 80 do
    begin
      gotoxy(j, i * 3);
      case j of
        1: Write(#195);
        80: Write(#180);
        else
          Write(#196);
      end;
    end;
  end;

end;

{
�࠭��� � ⠡���
}
procedure board;
var
  i, j: integer;
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

{
�롮� �祩��
}
function select_cell():char;
var
  x, y, i: integer;
  c: char;
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
  if c<>#13 then select_cell:=c
  {else
  begin
    case x of

    end;
  end;}
  until c=#27;
end;

{
�㭪��
���᮫쭮�� �����
1.�������� n ���� ���ᨢ� ⨯� data_base ����묨
2.�஢���� ����� �� ���४⭮���
}
function imperation_vvod(var data_base_imperation: array of data_base): integer;
var
  i, j, g: integer;
  s: string;
  mas_vvod: array[1..10] of string;
  c:char;
begin

  clrscr;
  mas_vvod[2] := '     ���    ';
  mas_vvod[3] := '      ������    ';
  mas_vvod[4] := '      ����      ';
  mas_vvod[5] := '    ���⨭�        ';
  mas_vvod[6] := '���ࠡ��稪';

  header;
  text_in_header(mas_vvod);//�����
  table_one;
  board;
  repeat
    c:=select_cell;
  until  c=#27;
  imperation_vvod := 10;
end;


end.
