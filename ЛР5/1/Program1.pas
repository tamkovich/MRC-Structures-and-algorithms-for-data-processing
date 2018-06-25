// 1. Используя стек, напечатать содержимое текстового файла, 
// выписывая литеры каж-дой его строки в обратном порядке.
Type
  uk=^dspis;
  dspis=record
    inf :integer;
    next: uk;
  end;
Var
  f:textfile;
  stek,x:uk;
Begin
  assignfile(f,'input.txt'); reset(f);
  stek:=nil;
  while not eof(f) do 
  begin  
    new(x);
    read(f,x^.inf);
    x^.next:=stek;
    stek:=x;
  end;  
  closefile(f);
  while stek<>nil do
  begin
    write(stek^.inf,' ');
    stek:=stek^.next;
  end;
End.