unit text_for_sub_menu;
interface
procedure text_fsm(j:integer);

implementation
uses crt;
procedure text_fsm(j:integer);
var t_fsm:array[1..3] of string;
  {
  ��楤�� �।�����祭� ��� �뢮�� ⥪�� �� ���ᨢ� ��ப t_fsm
  }
  procedure v_t_fsm(var t_fsm:array of string);
  var i:integer;
  begin
    for i:=1 to 3 do
    begin
      gotoxy(21,j+i+1);
      write(t_fsm[i-1]);
    end;
  end;
begin
  textcolor(white);
  //write('podklyuchen module text_for_sub_menu');
  case j of
  1,2:begin
        t_fsm[1]:='���᮫�� ०��';
        t_fsm[2]:='���ࠪ⨢�� ०��';
      end;
  3,4:begin
        t_fsm[1]:='���⨯��� 䠩�';
        t_fsm[2]:='������� .xml';
        t_fsm[3]:='����⮢�';
      end;
  5:begin
      t_fsm[1]:='����� ࠧࠡ��稪�';
      t_fsm[2]:='���� 䮭�';
      t_fsm[3]:='���� ⥪��';
    end;
  6:begin
      t_fsm[1]:='��ૠ��� ��⮭';
    end;
  7:begin
      t_fsm[1]:='  �� ';
      t_fsm[2]:='  ��� ';
    end;
  end;
  v_t_fsm(t_fsm);

end;

end.
