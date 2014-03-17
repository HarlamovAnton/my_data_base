program project1;

uses
  crt;

var
  i: integer;
  c: char;
  theend: boolean;
begin
  clrscr;
  gotoxy(1, 1);  //первая рамка
  Write(#201);
  gotoxy(9, 1);
  Write(#187);
  gotoxy(1, 5);
  Write(#200);
  gotoxy(9, 5);
  Write(#188);
  theend := False;
  for i := 2 to 8 do
  begin
    gotoxy(i, 1);
    Write(#205);
  end;
  for i := 2 to 4 do
  begin
    gotoxy(1, i);
    Write(#186);
  end;
  for i := 2 to 4 do
  begin
    gotoxy(9, i);
    Write(#186);
  end;
  for i := 2 to 8 do
  begin
    gotoxy(i, 5);
    Write(#205);
  end;
  gotoxy(11, 1); //вторая рамка
  Write(#201);
  gotoxy(19, 1);
  Write(#187);
  gotoxy(11, 5);
  Write(#200);
  gotoxy(19, 5);
  Write(#188);

  for i := 12 to 18 do
  begin
    gotoxy(i, 1);
    Write(#205);
  end;
  for i := 2 to 4 do
  begin
    gotoxy(11, i);
    Write(#186);
  end;
  for i := 2 to 4 do
  begin
    gotoxy(19, i);
    Write(#186);
  end;
  for i := 12 to 18 do
  begin
    gotoxy(i, 5);
    Write(#205);
  end;

  repeat
    c := readkey;
    gotoxy(4, 3);
    case Ord(c) of
      0:begin
          c := readkey;
          case Ord(c) of
            59:write('F1 ');
            60:write('F2 ');
            61:write('F3 ');
            62:write('F4 ');
            63:write('F5 ');
            64:write('F6 ');
            65:write('F7 ');
            66:write('F8 ');
            67:write('F9 ');
            68:write('F10 ');
            133:write('F11');
            134:write('F12');
            72: Write(' ',#30, ' ');
            75: Write(' ',#17, ' ');
            77: Write(' ',#16, ' ');
            80: Write(' ',#31, ' ');
          end;
        end;
      9:write('TAB');
      8:write('BCS');
      13:write('ENT');
      27:write('ESC');
      else Write(c,'  ');
    end;
    gotoxy(14, 3);
    Write(Ord(c), '  ');
  until theend = True;
end.
