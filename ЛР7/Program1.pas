// 1. Дана строка. Сохранить в ней только первые вхождения символов, удалив все остальные.
Var
  res:set of char;
  s:string;
  i,n:integer;
  f:text;
Begin
  assign(f,'file1.txt'); reset(f);
  read(f,s);
  close(f);
  n:=length(s);
  for i:=1 to n do
  begin
    res:=res+s[i];
  end;
End.