/*
Implementations of binary search trees
21/10/2019
*/

%Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
%Invalid tree
%test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).

test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).

is_tree(nil).
is_tree(node(_,LT, RT)) :-
	is_tree(LT), 
	is_tree(RT).

% Predicate to determine if an expresion is a valid tree. 
%Base case:
tree_element(X, node(R, ,)):-
	X = R.
tree_element(X, node(R, _, RT)):-
	X > R, 
	tree_element(X, RT).
tree_element(X, node(R, LT, _)):-
	X < R, 
	tree_element(X, LT).

tree_insert(X, nil, node(X, nul, nil)).

tree_insert(X, node(R, LT, RT), node(R, NLT, RT)):-
		X<R, 
		tree_insert(X, LT, NLT).

tree_insert(X, node(R, LT, RT), node(R, LT, NRT)):-
		X>R, 
		tree_insert(X, RT, NRT).
tree_insert(X, node(R, LT, RT), node(R, LT, RT)):-
		X=R.



tree_delete(_,nil,nil).
tree_delete(X, node(R,LT, RT), node(R, NLT, RT)) :-
	X<R,
	tree_delete(X, LT, NLT).
tree_delete(X, node(R,LT, RT), node(R, LT, NRT)) :-
	X>R,
	tree_delete(X, LT, NRT).
tree_delete(X, node(X, nil, nil), nil).
tree_delete(X, node(X,LT, nil), LT).
tree_delete(X, node(X,nil, RT), RT).
tree_delete(X, node(X,LT, RT),node(Min, LT,NRT)):-
	tree_min(RT, Min), 
	tree_delete(Min, RT, NRT).

tree_min(nil,nil).
tree_min(node(R, nil, _), R).
tree_min(node(R, LT, RT),Min):-
	tree_min(LT,Min).

%Convert a tree into an ordered list
tree_inorder(nil,[]).
tree_inorder(node(R, LT, RT), L) :-
	tree_inorder(LT, LL),
	tree_inorder(RT, RL),
	append(LL, [R|RL], L).

%Print a nicely formatted tree
print_tree(nil, 0, _).
print_tree(Tree, Depth, Char).

%Get tree height
tree_height(T, H) :-
	tree_height_proc(T, H1, 0),
	H = H1.
tree_height_proc(nil, H, C) :-
	H = C.
tree_height_proc(node(R, LT, RT), H, C) :-
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

%print tree on console
print_tree(T) :-
	print_tree_proc(T, 0, center).
print_tree_proc(nil, _, _).
print_tree_proc(node(R, LT, RT), Depth, Side) :-
	Side == right,
	Depth1 is Depth + 1,
	print_tree_proc(RT, Depth1, right),
	MultiDepth is Depth * 5,
	tab(MultiDepth),
	write(/-),
	write(R),
	nl,
	print_tree_proc(LT, Depth1, left).

print_tree_proc(node(R, LT, RT), Depth, Side) :-
	Side == left,
	Depth1 is Depth + 1,
	print_tree_proc(RT, Depth1, right),
	MultiDepth is Depth * 5,
	tab(MultiDepth),
	write(\-),
	write(R),
	nl,
	print_tree_proc(LT, Depth1, left).

print_tree_proc(node(R, LT, RT), Depth, Side) :-
	Side == center,
	Depth1 is Depth + 1,
	print_tree_proc(RT, Depth1, right),
	MultiDepth is Depth * 5,
	tab(MultiDepth),
	write(--),
	write(R),
	nl,
	print_tree_proc(LT, Depth1, left).

%Get if two trees are mirror trees (checks for values)
mirror_tree_values(T1, T2) :-
    tree_inorder_right(T1, RL),
    tree_inorder_left(T2, LL),
    RL = LL.

%Convert a tree into an ordered list (inorder right)
tree_inorder_right(nil, []).
tree_inorder_right(node(R, LT, RT), L) :-
    tree_inorder_right(RT, LL),
    tree_inorder_right(LT, RL),
    append(LL, [R|RL], L).

%Convert a tree into an ordered list (inorder left)
tree_inorder_left(nil, []).
tree_inorder_left(node(R, LT, RT), L) :-
    tree_inorder_left(LT, LL),
    tree_inorder_left(RT, RL),
    append(LL, [R|RL], L).	