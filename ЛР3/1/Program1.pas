// 1. Дан файл, в котором через пробел записаны натуральные числа. 
// Вывести на экран суммы цифр каждого числа.
Var
  f:textfile;
  n,i,sum,x:integer;
Begin
  assignfile(f,'input.txt'); reset(f);
  read(f,n);
  for i:=1 to n do
  begin
    sum:=0;
    read(f,x);
    write(x,' : ');
    while x<>0 do
    begin
      sum:=sum+x mod 10;
      x:=x div 10;
    end;
    write(sum);
    writeln;
  end;
  closefile(f);
end.