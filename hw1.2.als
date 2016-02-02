module binarytree

one sig BinaryTree {	root: lone Node }
abstract sig Node {	left, right: lone Node }

pred Acyclic(t: BinaryTree) {
	all n: t.root.*(left + right) { // union of sets of nodes at right and left branches
		n !in n.^(left + right)	// n not in left or right subtrees
		no n.(left) & n.(right) // n does not point to itself (leaf has no branches)
		lone n.~(left + right) // n has one parent node unless root
	}
}


-- 2.a Connectivity
fact DisconnectedNodesHaveSelfLoops {
	// the left and right fields of a node that is not in the
	// tree point to the node itself
	all n:Node, t:BinaryTree | n not in t.root.*(left + right) <=> 
		n.right = n and n.left = n 
}

-- 2.b Isomorphism
run Acyclic
/*
Considering only the part of the instance reachable from the binary tree atom:

---INSTANCE 1 ---
integers={}
univ={BinaryTree$0, Node$0, Node$1}
Int={}
seq/Int={}
String={}
none={}
this/BinaryTree={BinaryTree$0}
this/BinaryTree<:root={BinaryTree$0->Node$1}
this/Node={Node$0, Node$1}
this/Node<:left={Node$1->Node$0}
this/Node<:right={}
skolem $Acyclic_t={BinaryTree$0}

---INSTANCE 2---
integers={}
univ={BinaryTree$0, Node$0, Node$1, Node$2}
Int={}
seq/Int={}
String={}
none={}
this/BinaryTree={BinaryTree$0}
this/BinaryTree<:root={BinaryTree$0->Node$2}
this/Node={Node$0, Node$1, Node$2}
this/Node<:left={Node$1->Node$1, Node$2->Node$0}
this/Node<:right={Node$1->Node$1}
skolem $Acyclic_t={BinaryTree$0}


*/
