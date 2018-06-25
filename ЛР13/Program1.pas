// Дана последовательность чисел. 
// Построить бинарное дерево, содержащее эти числа.

// Подготовил: Тамкович Денис, группа 62492
uses crt;
Type 
  TreeType=^zapic;
  Zapic = record
    inf: integer;
    Left, Right: TreeType;
  End;

Var 
  len: integer;

Procedure Create_Tree(tree:TreeType; n:integer);
Var
  New_tree:TreeType;
Begin
  if n<=len then
  begin
    {переход на левый узел}
    New(tree^.left);
    New_tree:=tree^.left;
    New_tree^.inf:=random(10);
    Create_Tree(New_tree, n+1);
    {переход на правый узел}
    New(tree^.right);
    New_tree:=tree^.right;
    New_tree^.inf:=random(10);
    Create_Tree(New_tree, n+1);
  end;
End;

Procedure View_tree(tree:TreeType; x, n:integer);
begin
  gotoxy(x,2*n);
  write(tree^.inf);
  if n<=len then
  begin
    //переход на левый узел
    View_tree(tree^.left,x-(20 div n),n+1);
    //переход на првый узел
    View_tree(tree^.right,x+(20 div n),n+1);
  end;
end;

Var
  tree,root_tree: TreeType;
Begin
  randomize;  
  clrscr;
  read(len);
  //Создаётся и заполняется числовым значением корневой элемент дерева
  new(tree);
  tree^.inf:=random(10);
  //запоминается адрес первого корневого элемента
  root_tree:=tree;
  //создаётся дерево
  Create_Tree(tree,1);
  //повторный проход дерева
  View_Tree(root_tree,40,1);
End.
