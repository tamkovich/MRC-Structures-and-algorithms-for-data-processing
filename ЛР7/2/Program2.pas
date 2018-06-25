// В городе имеется n медицинских учреждений, которые производят закупку медицинской техники. 
// Имеется шесть фирм, которые осуществляют продажу соответствующего оборудования: «БЕЛМЕДСНАБ», 
// «Медтехника Восток Плюс», «БелИнтерн», «Висма-Планар», «Инкомед», «Ратон-МедТех». 
// Ответить на следующие вопросы:
//  1) в каких фирмах закупка производилась каждым из учреждений?
//  2) в каких фирмах закупка производилась хотя бы одним из учреждений?
//  3) в каких фирмах ни одно из учреждений не закупало медтехнику?
Type
  firm_type = set of string;
  hop = set of integer;
Var
  firms:array[1..6] of firm_type;
  ychr:array of firm_type;
  i,j,n:integer;
  f:text;
  s:string;
  b:boolean;
Begin
  firms[1]:=['БЕЛМЕДСНАБ']; 
  firms[2]:=['Медтехника Восток Плюс'];
  firms[3]:=['БелИнтерн'];
  firms[4]:=['Висма-Планар'];
  firms[5]:=['Инкомед'];
  firms[6]:=['Ратон-МедТех'];
  assign(f,'file2.txt'); reset(f);
  readln(f,n);
  readln(f,j);
  setlength(ychr,n);
  for i:=1 to n do
  begin
    readln(f,s);
    while not (s in '1..9') do
    begin
      ychr[i-1]:=ychr[i-1]+[s];
      readln(f,s);
    end;
  end;
  writeln('каждым:');
  for i:=1 to 6 do
  begin
    b:=True;
    for j:=0 to n-1 do
      if length(firms[i]+ychr[j])>0 then
        break;
    writeln('   ',firms[i]);
  end;
  close(f);
End.