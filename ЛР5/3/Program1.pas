// 3. С использованием стека вычислить арифметическое выражение, 
// предварительно преобразовав его в постфиксную форму записи.

Type 
 uk=^fs;
 fs=Record //описание стека для первой части программы
  inf:Char;
  next: uk;
 End;
 uk2=^ps;
 ps=Record //описание стека для второй части программы 
  inf:Real;
  next: uk2;
 End;
 
Var 
 s:String;
 num,sym:uk;
 f1:textfile;
 i:integer;

Begin
  assignfile(f1,'input.txt'); reset(f1);
  read(f1,s);
  num:=nil;
  sym:=nil;
  for i:=1 to length(s) do
  begin
    new(x);
    if is_znak(s[i])then
    case
  end;
  closefile(f1);
end.