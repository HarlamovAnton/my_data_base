unit vibor;
interface
procedure vibor_deistvii(j,i:integer);
implementation
uses crt;
procedure vibor_deistvii(j,i:integer);
begin
  clrscr;
  writeln(j);
  writeln(i);
  case i of
    1:begin
        writeln('Alla');
      end;
    2:begin
        writeln('Laal');
      end;
  end;
  readln;
end;

end.

