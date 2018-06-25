Type 
 pt_1=^el_1;
 el_1=Record
    data:Char;
    next:pt_1;
 End;
 pt_2=^el_2;
 el_2=Record
    data:Real;
    next:pt_2;
 End;
Var 
 s:String;
 f:Boolean;
 rez_1:String;
 rez_2:Real;
Procedure WriteStack_1(Var u:pt_1; dig:Char);
Var x: pt_1;
 Begin
 New(x);
 x^.data:=dig;
 x^.next:=u;
 u:=x; 
End;
Function Free_1(u:pt_1):Boolean;
Begin
 If u=Nil Then Free_1:=False
 Else
 Free_1:= True; 
End;
Procedure ReadStack_1(Var u:pt_1; Var dig:Char);
Var x: pt_1;
 Begin
 dig:=u^.Data;
 x:=u;
 u:=u^.Next;
 Dispose(x);
 End;
Function Priority(c: Char): Byte;
 Var R:Byte;
 Begin
 R := 0;
 Case c of
 '+', '-': R:= 1;
 '*', '/': R:= 2;
 end;
 Priority:=R;
 End;
Procedure Convert_expression(a:String;Var z:String);
Var 
 head:pt_1;
 i:Integer;
 w:Char;
 Begin
 head:=Nil;
 z:='';
 i:=1;
 While i<=Length(a) Do 
Begin 
Case a[i] of 
'0'..'9': z:=z+a[i];
 '(': WriteStack_1(head,a[i]);
 ')': Begin
ReadStack_1(head,w); 
While w<>'(' Do
 Begin z:=z+w; 
ReadStack_1(head,w);
 End;
 End;
 '+','-','*','/':
 Begin
 If not Free_1(head) Then WriteStack_1(head,a[i])
 else 
begin 
w:=head^.data;
 While Free_1(head)and(Priority(head^.data)>= Priority(a[i])) do 
Begin
 ReadStack_1(head,w);
z:=z+w;
 End;
 WriteStack_1(head,a[i]) ;
end; 
end;
 End;
 Inc(i);
 End; 
 While Free_1(head) Do 
 Begin
  ReadStack_1(head,w);
  z:=z+w;
 End;
End;
Procedure WriteStack_2(Var u:pt_2; dig:Real); 
Var x: pt_2; 
Begin
New(x); x^.data:=dig;
x^.next:=u;
 u:=x; 
End;
Procedure ReadStack_2(Var u:pt_2; Var dig:Real);
Var x: pt_2;
 Begin
 dig:=u^.Data; 
x:=u;
 u:=u^.Next;
 Dispose(x); 
End;
Function Free_2(u:pt_2):Boolean; 
Begin 
If u=Nil Then Free_2:=False 
Else
Free_2:= True; 
End;
procedure Operation(x:char; fm,sm:real; Var turn:real);
begin
  case x of
    '+': turn:=fm+sm;
    '-': turn:=fm-sm;
    '*': turn:=fm*sm;
    '/': turn:=fm/sm;
  end;
end;
Procedure Convert_calculate(a:String;Var pp:Boolean;Var z:Real);
Var head: pt_2;
i,k: Integer;
r,w: Real;
Begin 
head:=Nil;
 pp:=True;
 i:=1; 
While (i<=Length(a)) And pp Do 
Begin
 If a[i]<>' ' Then Begin
If Not(a[i] In ['+','-','*','/']) 
Then Begin 
Val(a[i],r,k); 
If k=0 Then WriteStack_2(head,r) Else pp:=False; 
End 
Else Begin
 If Free_2(head) Then ReadStack_2(head,r) Else pp:=False;
 If Free_2(head) Then ReadStack_2(head,w) Else pp:=False;
 If pp Then Begin 
Operation(a[i],r,w,r);
 WriteStack_2(head,r); 
End; 
End; 
End;
Inc(i);
 End;
 If Free_2(head) Then ReadStack_2(head,z) Else pp:=False; 
End;
Var
  f1:textfile;
  zzzz:string;
Begin
  assignfile(f1,'input.txt'); reset(f1);
  read(f1,s);
  zzzz:='';
  Convert_expression(s,rez_1);
  writeln(rez_1);
  closefile(f1);
  Convert_calculate(rez_1,f,rez_2);
  writeln(rez_2);
end.
