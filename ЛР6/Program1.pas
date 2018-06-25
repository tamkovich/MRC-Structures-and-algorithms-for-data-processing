// Вариант 1. За один просмотр файла действительных чисел напечатать элементы файла в следующем порядке: 
// сначала – все числа, меньшие а, затем – все числа из отрезка [а, b],
// и наконец – все остальные числа, сохраняя исходный порядок в каждой из этих трех групп чи-сел. Числа а и b задает пользователь.

// Подготивил: Тамкович Д.И.,гр.62492
Type
  uk = ^ocered;
  ocered = record
       inf: real;
       Next: uk;
  End;
Var
  x,a,b:Real;
  Bin,After,Ein,EAfter:uk;
  f:text;
Procedure Putin(Var BO,EO:uk; c:real);
Var
  u:uk;
Begin
  new(u);
  u^.inf:= c;
  u^.Next:=nil;
  if BO=nil then
    BO:=u
                else
    EO^.next:=u;
  EO:=u;
End;
Procedure Print(u:uk);
begin
  while u<>nil do
  begin
    write(u^.inf,' ');
    u:=u^.next;
  end;
end;
Begin
  Bin:=Nil; After:=Nil;
  Ein:=Nil; Eafter:=Nil;
  writeln('Введите промежуток:');
  readln(a,b);
  assign(f,'input.txt'); reset(f);
  writeln('Преобразованный набор:'); 
  write('[ ');
  while not eoln(f) do
  begin
    read(f,x);
    if x<a then
      write(x,' ')
           else
    if x<=b then
      Putin(Bin,Ein, x)
            else
      Putin(After, EAfter, x)
  end;
  write(']');
  close(f);
  write('[ ');
  Print(Bin);
  write(']');
  write('[ ');
  Print(After);
  write(']');
End.