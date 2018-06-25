// 2. Определить в двунаправленном списке количество элементов, 
// у которых соседи справа и слева отрицательны.
Type
  uk=^dspis;
  dspis=record
    inf :integer;
    prev: uk;
    next: uk;
  end;
Var
  x,n,i,index: integer;
  first,list: uk;
  t1,t2:boolean;
Procedure Print;
Var 
  Vsp: Uk;
Begin
  Vsp:=First;
  While Vsp<>nil Do
  Begin
    write(Vsp^.inf,' ');
    Vsp:=Vsp^.next;
  end;
  WriteLn;
end;
Procedure Print2;
Var 
  Vsp: Uk;
Begin
  Vsp:=First^.next;
  While Vsp^.next<>nil Do
  Begin
    if(Vsp^.prev^.inf<0)and(Vsp^.next^.inf<0)then
      write(Vsp^.inf,' ');
    Vsp:=Vsp^.next;
  end;
  WriteLn;
end;
Begin
  write('Введите количество элементов списка: '); 
  read(n);
	new(First);
	First^.prev:=nil;
	First^.next:=nil;  
	writeln('Случайные элементы списка: '); 
	First^.Inf:=random(20)-10; // случайный 1-ый 
  list:=First;
  for i:=2 to n do
  begin
    New(list^.next);
    list^.next^.prev:=list;
    list:=list^.next;
    list^.next:=nil; 
    list^.inf:=random(20)-10; // случайный i-ый
  end;
  print;
  writeln;
  print2;
  
End.