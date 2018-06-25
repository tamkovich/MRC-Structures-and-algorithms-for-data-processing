program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

// 1. Разработать процедуры ввода графа в виде матрицы инцидентности, матрицы смежности и списка смежности.
//2. Для заданного графа определить: 
//Вариант 1: смежность вершин v и w; веса ребра, заданного  (v, w); перечислить ребра, инцидентные вершине v.

Type
  luk = ^list;
  list = record
    inf:integer;
    Next:luk;
  end;
  
  TSpisInc = array[1..10]of luk;
  TMatrSmez = array[1..10,1..10]of byte;
  TMatrInci = array[1..10,1..10]of byte;
  
Var
  n,m:integer;
  
// ввод
Procedure VvodInci(filename:string; Var mas:TMatrInci);
Var
  f:textfile;
  i,j:integer;
Begin
  assignfile(f,filename); reset(f);
  read(f,n,m);
  For i:=1 to N do
    For j:=1 to M do
      read(f,mas[i,j]);
  closefile(f);
End;

// вывод
Procedure VivodInci(mas:TMatrInci);
Var
  i,j:integer;
begin
  For i:=1 to N do
  begin
    For j:=1 to M do
    begin
      write(mas[i,j]:2);
    end;
    writeln;
  end;
end;
  
// ввод МАТРИЦЫ СМЕЖНОСТИ
Procedure VvodSmez(Var mas:TMatrSmez; filename:string);
Var
  f:textfile;
  i,j:integer;
Begin
  assignfile(f,filename); reset(f);
  read(f,n);
  For i:=1 to N do
    For j:=1 to N do
      read(f,mas[i,j]);
  closefile(f);
End;

// вывод МАТРИЦЫ СМЕЖНОСТИ
Procedure VivodSmez(mas:TMatrSmez);
Var
  i,j:integer;
begin
  For i:=1 to N do
  begin
    For j:=1 to N do
    begin
      write(mas[i,j]:2);
    end;
    writeln;
  end;
end;

// добавление элементов в список (Список Инциденций)
Procedure AddItemToList(Var AList: luk; num:integer);
Var
  u:luk;
Begin
  new(u);
  u^.inf:=num;
  u^.Next:=AList;
  AList:=u;
End;

// ввод Список Инциденций
Procedure VvodSpisInc(Var list:TSpisInc; filename:string);
Var
  f:textfile;
  i,j,x:integer;
Begin
  assignfile(f,filename); reset(f);
  readln(f,n);
  For i:=1 to n do
  begin
    read(f,j);
    list[j]:=Nil;
    while not EoLn(f)do
    begin
      read(f,x);
      AddItemToList(list[j],x);
    end;
    readln(f);
  end;
  closefile(f);
End;

// рекурсивны вывод
Procedure viviod_reverse_steck(u:luk);
Begin
  if u^.Next<>Nil then
    viviod_reverse_steck(u^.Next);
  write('->',u^.inf);
End;

// вывод
Procedure VivodSpisInc(list:TSpisInc);
Var
  i:integer;
Begin
  For i:=1 to n do
  begin
    write('[',i,']');
    if list[i]<>Nil then
      viviod_reverse_steck(list[i]);
    writeln;
  end;
End;

Procedure prov(mas:TMatrSmez; mas2:TMatrInci; x,y:integer);
Var
  i,j:integer;
Begin
  if mas[x,y]=1 then
  begin
    writeln(x,' soedinena s ',y);
    writeln(mas[x,y],' - ves rebra');
  end
  else
    writeln(x,' ne soedinena s ',y);

  for j:=1 to m do
    if mas2[x,j]=1 then
      for i:=1 to n do
        if (x<>i)and(mas2[i,j]=1)then
          writeln(x,' soed s : ',i);
End;

Var
  l:TSpisInc;
  a:TMatrSmez;
  b:TMatrInci;
  
Begin
  VvodSmez(a,'MSIn.txt');
  VivodSmez(a);

  VvodInci('MIIn.txt',b);
  VivodInci(b);

  prov(a,b,3,5);
    
  VvodSpisInc(l,'SIIn.txt');
  VivodSpisInc(l);

  readln;
  readln; 
End.
