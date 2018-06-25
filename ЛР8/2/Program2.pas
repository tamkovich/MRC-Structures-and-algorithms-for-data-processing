Type
  TMatrInci =array[1..10,1..10]of byte;

  luk = ^TList;
  TList = record
    inf: integer;
    Next: luk;
  end;
  uk = ^spisok;
  spisok = record
    x, y: integer;
    Next: uk;
  end;

Var
  n,m:integer;

// ввод
Procedure Vvod(filename:string; Var mas:TMatrInci);
Var
  f:textfile;
  i,j:integer;
Begin
  assignfile(f,filename); reset(f);
  readln(f,n,m);
  For i:=1 to N do
    For j:=1 to M do
      read(f,mas[i,j]);
  closefile(f);
End;

// вывод
Procedure Vivod(mas:TMatrInci);
Var
  i,j:integer;
begin
  For i:=1 to N do
  begin
    For j:=1 to M do
      write(mas[i,j]:2);
    writeln;
  end;
end;

// проверить на связанность. Обход в ширину
Procedure Check_if_sviazan(mas:TMatrInci);
Var
  visited:array[1..10]of boolean;
  q:array[1..10]of integer;
  x,pis,pil:integer;
  i,j:integer;
Begin
  for i:=1 to N do
  begin
    q[i]:=0;
    visited[i]:=True;
  end;
  pis:=1;
  pil:=1;
  x:=1;
  visited[x]:=False; // Дальше посетим превую вершину
  q[pil]:=x;         // Её мы запомнили в очереди посещенных вершин
  While pis<=pil do  // Находится ли в очереди ещё вершины для проверки ?
  begin
    for j:=1 to M do
      if mas[x,j]=1 then
        for i:=1 to N do
          if(mas[i,j]=1)and(x<>i)and visited[i] then // Исследована ли вершина ранее ?
          begin
            inc(pil);
            q[pil]:=i;         // Сдвинем индекс новых вершин в очереди на один
            visited[i]:=False; // Каждую посещенную вершину мы тоже обозначаем в массиве visited
            break;
          end;
    inc(pis);  // А дальше переходим к следующей посещенной вершине
    x:=q[pis];
  end;
  for i:=1 to n do
    if visited[i] then
    begin
      writeln('ne sviazan :-( sorry');
      exit;
    end;
  writeln('sviazan! ;-) uhhuhuhu');
End;

Var
  a:TMatrInci ;

begin
  vvod('input2.txt',a);
  writeln('Matrica A:');
  vivod(a);
  
  write('Graph A - ');
  Check_if_sviazan(a);
End.