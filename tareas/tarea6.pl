%Saúl Enrique Labra Cruz A01020725
%Tarea 6 - Binary Search Trees

%print tree on console
print_tree(T) :-
	print_tree_proc(T, 0, center).
print_tree_proc(nil, _, _).
print_tree_proc(node(R, LT, RT), Depth, Side) :- %if node came from right side of parent
	Side == right,
	Depth1 is Depth + 1,
	print_tree_proc(RT, Depth1, right),
	MultiDepth is Depth * 5,
	tab(MultiDepth),
	write(/-),
	write(R),
	nl,
	print_tree_proc(LT, Depth1, left).

print_tree_proc(node(R, LT, RT), Depth, Side) :- %if node came from left side of parent
	Side == left,
	Depth1 is Depth + 1,
	print_tree_proc(RT, Depth1, right),
	MultiDepth is Depth * 5,
	tab(MultiDepth),
	write(\-),
	write(R),
	nl,
	print_tree_proc(LT, Depth1, left).

print_tree_proc(node(R, LT, RT), Depth, Side) :- %if node is the first node
	Side == center,
	Depth1 is Depth + 1,
	print_tree_proc(RT, Depth1, right),
	MultiDepth is Depth * 5,
	tab(MultiDepth),
	write(--),
	write(R),
	nl,
	print_tree_proc(LT, Depth1, left).

%Get tree height
tree_height(T, H) :- %call function with counter = 0
	tree_height_proc(T, H1, 0),
	H = H1.
tree_height_proc(nil, H, C) :- %when function reaches a leaf height of the path is assigned 
	H = C.
tree_height_proc(node(_, LT, RT), H, C) :- % parent discirminates which of the children paths is larger
	C1 is C + 1,
	tree_height_proc(LT, H1, C1),
	tree_height_proc(RT, H2, C1),
	max_num(H1, H2, H).

%Get max number from two elements
max_num(A, B, X) :-
	A >= B,
	X = A.
max_num(A, B, X) :-
	B >= A,
	X = B.

%Get if tree branches are symmetric (checks its structure)
symmetric_tree(node(_,LT,RT)) :- %call for mirror tree with tree left and right branches
	mirror_tree(LT,RT).

%Get if two trees are mirror trees(checks its structure)
mirror_tree(nil, nil). %If both values are nil they followed the same path
mirror_tree(node(_, LT, RT), node(_, RLT, RRT)) :- %All paths must match (inorder right and inorder left)
	mirror_tree(LT, RRT),
	mirror_tree(RT, RLT).

%List leaves
list_leaves(node(X, nil, nil), [X]). %Reached a leaf returns list with the value 
list_leaves(node(_, LT, RT), L) :- %append all leaves
	list_leaves(LT, L2),
	list_leaves(RT, L3),
	append(L2, L3, L).



