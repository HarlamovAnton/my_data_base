unit unitPR11;

interface
procedure vivod_date_s;
procedure vvod_date;
procedure vivod_date;
type d_b_b=record // data_base_battery
     n_b:string[20]; // name_battery
     c_b:integer; // capacity_battery
     p_b:integer; // price_battery
     //3-� �������
     case t_maker:(usa,china,russian) of
       usa:(Gorod:(NY,W,L_A));
       china:(Company:(Norton,Noname,Apple));
       russian:(Kolvosot:integer);
     end;
var i2,n:integer;
    a:array[1..10]of d_b_b;
implementation


//�஢�ઠ ��ப� �� �訡�� .�᫨ true � � ��� ��ப� ����.
function proverka(s:string):boolean;
  var i:integer;
  begin
    proverka:=true;
    if s<>'' then
      begin
        for i:=1 to length(s) do
        begin
          if not(s[i] in ['0'..'9'])then proverka:=false;
        end;
      end
    else proverka:=false;
  end;

//�஢�ઠ �᫠ �� �������� �� 1 �� 10.True � n = �� 1 �� 10
function ot_do(n:integer):boolean;
  begin
    if (n<1)or(n>10)then ot_do:=false
    else ot_do:=true;
  end;

//�㭪�� �஢�ન ��ਭ����� ��६����� s,� ���ன �࠭���� ��࠭� �ந�����⥫�
function proverka_c(s:string):boolean;
  begin
    case s of
      'usa':proverka_c:=true;
      'china':proverka_c:=true;
      'russian':proverka_c:=true;
    else proverka_c:=false;
    end;
  end;

//Vvod_dannix
procedure vvod_date;
var i:integer;
    s:string;
    b:boolean;
begin
  repeat
    b:=false;
    writeln('������ ������⢮ �������஢');readln(s);
    if proverka(s)=true then
    begin
      val(s,n);
      if ot_do(n)=true then b:=true;
    end;
  until b=true;
  for i2:=1 to n do
  begin
    repeat
      writeln('������ ���� ��������');readln(a[i2].n_b);
    until (a[i2].n_b<>'') ;
    repeat
      writeln('������ ������� �������஢(���)');readln(s);
    until proverka(s)=true;
    val(s,a[i2].c_b);
    repeat
      writeln('������ 業� ��������');readln(s);
    until proverka(s)=true;
    val(s,a[i2].p_b);
    repeat
      writeln('������ ��࠭� �ந�����⥫�(usa,china,russian)');readln(s);
    until proverka_c(s)=true;
    repeat
      b:=true;
      case s of
        'usa':begin
                writeln('������ ��த(NY,W,L_S)');
                a[i2].t_maker:=usa;
                readln(a[i2].gorod);
              end;
        'china':begin
                  writeln('������ ��������(Norton,Noname,Apple)');
                  a[i2].t_maker:=china;
                  readln(a[i2].Company);
                end;
        'russian':begin
                    writeln('������ ������⢮ ࠡ����');
                    a[i2].t_maker:=russian;
                    readln(a[i2].Kolvosot);
                  end;
      else b:=false;
      end;
    until b=true ;
  end;
  //for i:=1 to n do vivod(a[i]);
  //readln;
end;

//vivod dannix
procedure vivod_date;
begin
  for i2:=1 to n do
  begin
    writeln('��ઠ �������� ',a[i2].n_b);
    writeln('��筠� ������� ��������(� ���) ',a[i2].c_b);
    writeln('���� �������� ',a[i2].p_b);
    writeln('��࠭� �ந�����⥫� ',a[i2].t_maker);
    case a[i2].t_maker of
       usa:writeln(a[i2].Gorod);
       china:writeln(a[i2].Company);
       russian:writeln(a[i2].Kolvosot);
    end;
  end;readln;
end;

//vivod dannix s ogranichenoem
procedure vivod_date_s;
begin
  for i2:=1 to n do
  begin
    if a[i2].c_b<1000 then
    begin
      writeln('��ઠ �������� ',a[i2].n_b);
      writeln('��筠� ������� ��������(� ���) ',a[i2].c_b);
      writeln('���� �������� ',a[i2].p_b);
      writeln('��࠭� �ந�����⥫� ',a[i2].t_maker);
      case a[i2].t_maker of
        usa:writeln(a[i2].Gorod);
        china:writeln(a[i2].Company);
        russian:writeln(a[i2].Kolvosot);
      end;
    end;
  end;readln;
end;

end.
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

implementation

end.

