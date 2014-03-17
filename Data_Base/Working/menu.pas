unit menu;

interface
uses unitPR11,crt;
procedure menushka;

implementation
{
вЁ/ ЇЁбм Ё вЄбвўле д ў
}
procedure writefile(var a:array of d_b_b);
var f:text;
begin
  assign(f,'bdashka.csv');{$I-}
  rewrite(f);
  for i2:=1 to n do
  begin
    writeln(f,' аЄ   ЄЄггпва  ',a[i2].n_b);
    writeln(f,'з п Єбвм  ЄЄггпва (ў з) ',a[i2].c_b);
    writeln(f,'   ЄЄггпва  ',a[i2].p_b);
    writeln(f,'ва   ЇаЁў¤Ёвм ',a[i2].t_maker);
    case a[i2].t_maker of
       usa:writeln(a[i2].Gorod);
       china:writeln(a[i2].Company);
       russian:writeln(a[i2].Kolvosot);
    end;
  end;close(f); {$I+}
end;
procedure readfile(var a:array of d_b_b);
var f:text;
begin
  assign(f,'bdashka.txt');{$I-}
  rewrite(f);
  for i2:=1 to n do
  begin
    readln(f,a[i2].n_b);
    readln(f,a[i2].c_b);
    readln(f,a[i2].p_b);
    readln(f,a[i2].t_maker);
    case a[i2].t_maker of
       usa:writeln(a[i2].Gorod);
       china:writeln(a[i2].Company);
       russian:writeln(a[i2].Kolvosot);
    end;
  end;close(f);{$I+}
end;
{
вЁ/ ЇЁбм Ё Їмў вмбЄЁе д ў
}
procedure one(var a:array of d_b_b);
var f:file of d_b_b;
    i:integer;
begin
  assign(f,'data_base_battery.base');
  {$I-}
  rewrite(f);
  for i:=1 to i2 do write(f,a[i]);
  close(f);
  {$I+}
end;
procedure two(var a:array of d_b_b);
var f:file of d_b_b;
    i:integer;
begin
  assign(f,'data_base_battery.base');
  {$I-}
  reset(f);
  for i:=1 to i2 do read(f,a[i]);
  close(f);
  {$I+}
end;

procedure menushka;
var menu_s_mas:array[1..11]of string;
    i:integer;
    x,y:integer;//for kursor
    c:char;
    proend:boolean;
begin
  proend:=false;
  menu_s_mas[1]:=' ЇЁбм ў д ';
  menu_s_mas[2]:='вЁ Ё д  ';
  menu_s_mas[3]:='ў¤ ¤ ле б Є ўЁ вгал';
  menu_s_mas[4]:='лў¤ ¤ ле   нЄа ';
  menu_s_mas[5]:='лў¤ ¤ ле   нЄа  б а ЁзЁпЁ';
  menu_s_mas[6]:='авЁаўЄ ';
  menu_s_mas[7]:=' ЇЁбм ў д (TEXT)';
  menu_s_mas[8]:='вЁ Ё д  (TEXT)';
  menu_s_mas[9]:=' ЇЁбм ў д (NoType)';
  menu_s_mas[10]:='вЁ Ё д  (NoType)';
  menu_s_mas[11]:='ле¤';
  repeat
    clrscr;
    for i:=1 to 11 do
    begin
      if i=1 then
      begin
        textbackground(red);
        writeln(menu_s_mas[i]);
        textbackground(black);
      end
      else writeln(menu_s_mas[i]);
    end;
    i:=1;y:=1;x:=1;
    repeat
      gotoxy(x,y);
      c:=readkey;
      if c=#0 then
      begin
        c:=readkey;
        case ord(c) of
          72:begin
               if y<>1 then
               begin
                 textbackground(black);write(menu_s_mas[i]);
                 i:=i-1;y:=y-1;gotoxy(x,y);
                 textbackground(red);write( menu_s_mas[i]);
               end;
             end;
          80:begin
               if y<>11 then
               begin
                 textbackground(black);write(menu_s_mas[i]);
                 i:=i+1;y:=y+1;gotoxy(x,y);
                 textbackground(red);write(menu_s_mas[i]);
               end;
             end;
        end;
      end;
    until ord(c)=13;
    textbackground(black);
    clrscr;
    case i of
    1:begin
        writeln(' ЇЁб ');
        one(a);
      end;
    2:begin
        writeln('аз');
        two(a);
      end;
    3:begin
        vvod_date;
        writeln('¤');
        delay(1000);
      end;
    4:begin
        vivod_date;
        writeln('лў');
        delay(1000);
      end;
    5:begin
        vivod_date_s;
      end;
    6:begin
        writeln('в');
        delay(1000);
      end;
    7:begin
        writefile(a);
        writeln(' ЇЁб ');
        delay(1000);
      end;
    8:begin
        readfile(a);
        writeln('аз');
        delay(1000);
      end;
    9:begin

        writeln(' ЇЁб ');
        delay(1000);
      end;
    10:begin
        writeln('аз');
        delay(1000);
      end;
    11:begin
        writeln('бўЁ¤ Ёп');
        delay(1000);
        proend:=true;
      end;
    end;
  until proend=true;
end;

end.

