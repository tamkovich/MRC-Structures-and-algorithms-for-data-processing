program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;
Type
  MasType = array of integer;
Var
  a:MasType;
  i,j,temp,nom,n:integer;
procedure InsertSort(Var mas: MasType);
begin
  for i:=1 to n-1 do
  begin
    nom:=i+1;
    temp:=mas[nom];
    for j:=i+1 downto 2 do
    begin
      if (temp<mas[j-1]) then
      begin
        mas[j]:=mas[j-1];
        nom:=j-1;
      end;
    end;
    mas[nom]:=temp;
  end;
end;

begin
  randomize;
  readln(n);
  setlength(a,n);
  for i:=1 to n do
  Begin
    a[i]:=random(30)+1;
    write(a[i],' ');
  end;
  InsertSort(a);
  writeln;
  write('Sort dynamic massive: ');
  for i:=1 to n do
    write(a[i], ' '); {вывод массива}
  readln;
  readln;
end.
