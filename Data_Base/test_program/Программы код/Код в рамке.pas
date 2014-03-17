program char1;
uses crt;
var
  i:integer;
  c:char;
begin
    clrscr;
    gotoxy(1,1);  //первая рамка
    write(#201);
    gotoxy(8,1);
    write(#187);
    gotoxy(1,5);
    write(#200);
    gotoxy(8,5);
    write(#188);

    for i:= 2 to 7 do
    begin
      gotoxy(i,1);
      write(#205);
    end;
    for i:= 2 to 4 do
    begin
      gotoxy(1,i);
      write(#186);
    end;
    for i:= 2 to 4 do
    begin
      gotoxy(8,i);
      write(#186);
    end;
    for i:= 2 to 7 do
    begin
      gotoxy(i,5);
      write(#205);
    end;
    gotoxy(11,1); //вторая рамка
    write(#201);
    gotoxy(18,1);
    write(#187);
    gotoxy(11,5);
    write(#200);
    gotoxy(18,5);
    write(#188);

    for i:= 12 to 17 do
    begin
      gotoxy(i,1);
      write(#205);
    end;
    for i:= 2 to 4 do
    begin
      gotoxy(11,i);
      write(#186);
    end;
    for i:= 2 to 4 do
    begin
      gotoxy(18,i);
      write(#186);
    end;
    for i:= 12 to 17 do
    begin
      gotoxy(i,5);
      write(#205);
    end;
    repeat
      gotoxy(14,3);
      write('   ');
      gotoxy(14,3);
      c:=readkey;
      if c=#0 then
      begin
        case ord(c) of
          72:write(#30);//up
          75:write(#16);//right
          77:write(#17);//left
          80:write(#31);//down
        end;
      end
      else write(ord(c));
      gotoxy(4,3);
      write(c);
    until c=#13;
end.  
