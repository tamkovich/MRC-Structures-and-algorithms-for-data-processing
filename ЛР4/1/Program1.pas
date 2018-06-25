// 1. Составить программу, которая на основе заданного списка формирует два других, 
// помещая в первый из них положительные, а во второй — отрицательные элементы 
// исходного списка. Выполнить задание по варианту:
// Вариант 1. Подсчитать сумму элементов исходного списка.
Type
  uk=^dspis;
  dspis=record
    inf :integer;
    next: uk;
  end;
Var
  x,n,i,sum: integer;
  u,less,more: uk;
  f:textfile;
Begin
  assignfile(f,'input.txt'); reset(f);
  read(f,n);
  sum:=0;
  for i:=1 to n do
  begin
    new(u);
    u^.Next:=nil;
    read(f,u^.Inf);
    sum:=sum+u^.Inf;
    if u^.inf<0 then
    begin
      new(less);
      less^.Next:=nil;
      less^.inf:=u^.inf;
    end
                else
    begin
      new(more);
      more^.Next:=nil;
      more^.inf:=u^.inf;
    end
  end;
  write(sum);
  closefile(f); 
End.