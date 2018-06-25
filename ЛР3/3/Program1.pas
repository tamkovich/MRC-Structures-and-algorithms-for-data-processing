// 3. Создать типизированый файл (в соответствии с вариантом), 
// и заполнить информацией, не менее 5 записей указанного типа. 
// Файл сохранить с именем Input.txt. 
// Применить сортировку файла по любому полю. 
// Результат поместить в файл с именем Output.txt. 
Type
  all_team = record
    country: string[10];
    name: string[10];
    fam: string[10];
    rate: integer;
  end;
Var
  f: file of all_team;
  f1:textfile;
  n,i,nom,temp,j:integer;
  team: array [1..1000] of all_team;
  a:array of integer;
begin
  assignfile(f1,'inf.txt'); reset(f1);
  readln(f1,n);
  setlength(a,n+1);

  for i:=1 to n do
    with team[i] do
    begin
      readln(f1,country);
      readln(f1,name);
      readln(f1,fam);
      readln(f1,rate);
      a[i]:=i;
    end;  
  closefile(f1);
  
  assignfile(f,'input.dat'); rewrite(f);
  for i:=1 to n do
  begin
    write(f,team[i]);
  end;
  closefile(f);
  
  assignfile(f1,'output.txt'); rewrite(f1);
  for i:=1 to n-1 do 
  begin
    nom:=i+1;
    temp:=a[nom];
    for j:=i+1 downto 2 do 
    begin
      if (team[temp].rate<team[a[j-1]].rate) then 
      begin
        a[j]:=a[j-1];
        nom:=j-1;
      end; 
    end;
    a[nom]:=temp;
  end;

  for i:=1 to n do
    with team[a[i]] do
    begin
      writeln(f1,country);
      writeln(f1,name);
      writeln(f1,fam);
      writeln(f1,rate);
    end;
  closefile(f1);
End.