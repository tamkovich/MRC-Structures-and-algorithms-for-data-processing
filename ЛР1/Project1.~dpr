program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;
Var
  a:array[1..1000]of integer;
  i,n,k,l,r:integer;

begin
  randomize;
  readln(n);
  read(l,r);
  for i:=1 to n do
  begin
    a[i]:=random(r-l+1)+l;
    write(a[i],' ');
  end;
  writeln;
  readln(k);
  i:=1;
  a[n+1]:=k;
  while a[i]<>k do
  begin
    i:=i+1;
  end;
  if i>n then
    writeln('Ellement ne naiden')
         else
    writeln('Ellement nahoditsia na positii = ',i);
  for i:=1 to n do
    writeln(a[i]);
  readln;
  readln;
end.
