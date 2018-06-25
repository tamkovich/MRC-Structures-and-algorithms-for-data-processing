// 2. Создать файл X, компонентами которого являются элемента массива M. 
// Переписать из файла X в файл Y все компоненты, которые стоят на четных местах. 
// Прочитать файл Y.
Var
  f:textfile;
  n,i:integer;
  m:array of real;
Begin
  assignfile(f,'x.txt'); reset(f);
  read(f,n);
  setlength(m,n);
  for i:=0 to n-1 do
    read(f,m[i]);
  closefile(f);
  assignfile(f,'y.txt'); rewrite(f);
  i:=0;
  While i<=n-1 do 
  begin
    write(f,m[i],' ');
    i:=i+2;
  end;
  closefile(f);
End.