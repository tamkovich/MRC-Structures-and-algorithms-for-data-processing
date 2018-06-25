Const MAX_VERT = 100;
 
Var LstS    : Array[1..MAX_VERT,1..MAX_VERT] of integer;
Var Chk     : Array[1..MAX_VERT] of integer;
Var CurrN   : integer;
Var finp    : Text;
Var i,j,l,k : integer;
Var Stri,s,tmp : String;
 
Function isBound(i,j : integer) : Boolean;
Var k : integer;
Begin
     for k:=1 to CurrN Do
         if LstS[i,k]=j Then Begin
            isBound:=True;
            exit;
         End;
     For k:=1 to CurrN Do
         if LstS[j,k]=i Then Begin
            isBound:=True;
            exit;
         End;
     isBound:=False;
End;
 
Procedure DFS(n : integer);
Var i : integer;
Begin
 
     Chk[n]:=1;
 
     for i:=1 to  CurrN Do
         if (Chk[i]=0) And (isBound(i,n)) Then Begin
            writeln(n,' - ',i);
            DFS(i);
         end;
         
End;
 
Begin
 
    for i:=1 to MAX_VERT Do Begin
        Chk[i]:=0;
        for j:=1 to MAX_VERT Do
            Lsts[i,j]:=0;
    end;
 
    assign(finp,'graph.txt');
    reset(finp);
 
    readln(finp,CurrN);
    
    for i:=1 to CurrN Do Begin
        readln(finp,Stri);
        Stri:=Stri+',';
        l:=length(Stri);
        tmp:='';
        k:=1;
        for j:=1 to l Do Begin
            s:=Stri[j];
            if s <> ' ' then
               if s = ',' then Begin
                  if tmp <> '' then Begin
                     Lsts[i,k]:=strToint(tmp);
                     tmp:='';
                     k:=k+1;
                  End;
                End
               Else
                  tmp:=tmp+s;
        End;
    End;
    
    Close(finp);
    
    DFS(1);
 
    writeln;
 
End.
