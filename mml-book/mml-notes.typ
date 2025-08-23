// *************************** Plugins & Blocks Start *************************** //

#import "@preview/codly:1.0.0": *
#show: codly-init.with()

#codly(
  fill: rgb("#FDF5E5"),
  languages: (python: (name: "py", color: rgb("#e8da58"))),
  zebra-fill: none,
)


#let coro(body) = {
  text(rgb("#AD715A"))[Corollary #body]
  v(-0.3em)
}

#let def(body) = {
  text(rgb("#7B7DBD"))[Definition (#body)]
  v(-0.3em)
}

#let remark(body) = {
  text(rgb("#EF82B5"))[Remark #body]
  v(-0.3em)
}

#let definition(title, body) = {
  block(width: 100%, fill: none, stroke: (thickness: 1.5pt, paint: rgb("#2C3E50")), radius: 4pt, inset: 0pt, [
    #block(
      fill: rgb("#34495E"),
      radius: (top-left: 4pt, top-right: 4pt, bottom-left: 0pt, bottom-right: 0pt),
      inset: (x: 14pt, y: 9pt),
      width: 100%,
      [#text(weight: "bold", size: 10pt, fill: white)[Definition] #h(0.3em) #text(
          weight: "bold",
          size: 10pt,
          fill: rgb(
            "#BDC3C7",
          ),
        )[#title]],
    )
    #block(
      inset: (x: 10pt, y: 9pt),
      width: 100%,
      body,
    )
  ])
}

// #import "@preview/algo:0.3.3": algo, i, d, comment, code
// #show sym.triangle.l: it => box()[#it #h(.1cm)]

// *************************** Plugins & Blocks End *************************** //

// *************************** Variables Start *************************** //

#let title = [Math for ML Notes]
#let author = [#link("https://www.github.com/ahmedYasserM")[Ahmed Yasser]]
#let date = [#datetime.today().display("[month repr:long] [year]")]
#let font = "New Computer Modern"
#let normalFontSize = 12pt
#let baseLink = ""

// *************************** Variables End *************************** //

// *************************** Configs Start *************************** //

#show raw: set text(font: "JetBrainsMono NFP")
#show raw: it => box(text(fill: rgb("#538EBB"), it))
// #show math.equation: it => text(fill: rgb("#538EBB"), it)
#set math.mat(delim: "[", column-gap: 1em)
#set math.vec(delim: "[")
#show heading: set block(below: 1em)
#set list(marker: text(fill: red, size: 1.3em)[•], indent: 1em)



// *************************** Configs End *************************** //


// *************************** Formatting Start *************************** //

#set page(paper: "a4", margin: (x: 1.7cm, y: 1.8cm), header: [], numbering: "1")

#set text(font: font, size: normalFontSize)
#show strong: set text(stroke: 0.1pt)

#set par(justify: true)

// *************************** Formatting End *************************** //

// *************************** Title Page Start *************************** //


#align(center + horizon)[
  #par(leading: 0.7cm)[
    #text(size: 40pt)[*#title*] \
    #text(size: 20pt)[*#author*] \
    #text(size: 17pt)[*#date*]
  ]
]

#pagebreak()

// *************************** Title Page End *************************** //

// *************************** Table of Contents Start *************************** //

// #outline(target: heading.where(level: 1))

// #pagebreak()

// *************************** Table of Contents End *************************** //


= Chapter 2

=== 2.6.2 Rank

#def("Rank")

The number of *linearly independent* columns of a matrix $bold(A) in RR^(m times n)$ equals the number of *linearly independent* rows of $bold(A)$ and is called the *rank* of $bold(A)$, and is denoted by $"rk"(bold(A))$

#remark("(Matrix Rank Properties)")

- *Rank equality*: For any matrix $bold(A)$, the column rank equals the row rank: $"rk"(bold(A)) = "rk"(bold(A^tack.b))$

- *Column space (image/range)*: The columns of $bold(A) ∈ ℝ^(m×n)$ span a subspace $U ⊆ ℝ^m$ with $dim(U) = "rk"(bold(A))$. A basis for $U$ can be found using Gaussian elimination to identify pivot columns.

- *Row space*: The rows of $bold(A) ∈ ℝ^(m×n)$ span a subspace $W ⊆ ℝ^n$ with $dim(W) = "rk"(bold(A))$. A basis for $W$ can be found by applying Gaussian elimination to $bold(A^tack.b)$.

- *Invertibility condition*: For square matrices $bold(A) ∈ ℝ^(n×n)$, $bold(A)$ is regular (invertible) if and only if $"rk"(bold(A)) = n$.

- *Linear system solvability*: For $bold(A) ∈ ℝ^(m×n)$ and $bold(b) ∈ ℝ^m$, the system $bold(A) bold(x) = bold(b)$ can be solved if and only if $"rk"(bold(A)) = "rk"(bold(A|bold(b)))$, where $bold(A|bold(b))$ is the augmented matrix.

- *Null space (kernel)*: For $bold(A) ∈ ℝ^(m×n)$, the solution space of $bold(A) bold(x) = bold(0)$ has dimension #box($n - "rk"(bold(A))$). This subspace is called the kernel or null space.

- *Full rank*: A matrix $bold(A) ∈ ℝ^(m×n)$ has full rank when $"rk"(bold(A)) = min(m, n)$, meaning its rank equals the maximum possible rank for its dimensions.

- *Rank deficient*: A matrix that does not have full rank is called rank deficient.


== 2.7 Linear Mappings

#def("Linear Mapping")
For vector spaces $V$ and $W$, a mapping $Phi: V -> W$ is called a *linear mapping (or linear transformation/vector space homomorphism)* if

$
  Phi(bold(x) + bold(y)) & = Phi(bold(x)) + Phi(bold(y)) \
     Phi(lambda bold(x)) & = lambda Phi(bold(x))
$

$forall bold(x), bold(y) in V$ and $lambda in RR$


#remark("")
Consider a mapping $Phi: cal(V) -> cal(W)$, where $cal(V)$ and $cal(W)$ can be arbitrary sets. Then $Phi$ is called:

- *Injective (one-to-one)* if $forall bold(x), bold(y) in cal(V): Phi(bold(x)) = Phi(bold(y)) ==> bold(x) = bold(y)$ i.e. there is no two different elements in $cal(V)$ that map to the same element in $cal(W)$.
- *Surjective (onto)* if $Phi(cal(V)) = cal(W)$ i.e. every element in $cal(W)$ can be reached from $cal(V)$ using $Phi$.
- *Bijective* if $Phi$ is both *injective* and *surjective*.

#remark("")
A bijective mapping $Phi: cal(V) -> cal(W)$ is reversible: there exists a mapping $Psi: cal(W) -> cal(V)$ such that #box($Psi compose Phi(x) = x$) and #box($Phi compose Psi(y) = y$). This mapping $Psi$ is the *inverse* of $Phi$, denoted $Phi^(-1)$.

#remark("Special cases of linear mappings between vector spaces ")
- *Isomorphism*: $Phi: V -> W$ linear and bijective (maps between different spaces, reversible)
- *Endomorphism*: $Phi: V -> V$ linear (maps a space to itself)
- *Automorphism*: $Phi: V -> V$ linear and bijective (maps a space to itself, reversible)
- *Identity mapping*: $"id"_V: V -> V$, $x |-> x$ (leaves every vector unchanged)


#remark("")
Finite dimensional vector spaces $V$ and $W$ are *isomorphic* _if and only if_ $dim(V) = dim(W)$

#remark("")
Consider vector spaces $V, W, X$. Then:
- If $Phi: V -> W$ and $Psi: W -> X$ are *linear* then $Psi compose Phi: V -> X$ is *linear*.
- If $Phi: V -> W$ is an *isomorphism* then $Phi^(-1): W -> V$ is an *isomorphism*.
- If $Phi: V -> W$ and $Psi: V -> W$ are *linear* then $Phi + Psi: V -> W$ and $lambda Phi: V -> W, lambda in RR$ are *linear*.

=== 2.7.1 Matrix Representation of Linear Mappings

#remark("(Notaion)")

- $B = {b_1, dots, b_n}$ is an *unordered* basis
- $B = (b_1, dots, b_n)$ is an *ordered* basis
- $bold(B) = mat(b_1, dots, b_n)$ is a *matrix* whose columns are the vectors $b_1, dots, b_n$

#def("Coordinates")

Consider a vector space $V$ and an *ordered* basis $B = (b_1, dots, b_n)$ of $V$. For any vector $x in V$ we obtain a *unique* representaion (linear combination)

$
  bold(x) = alpha_1 b_1 + dots + alpha_n b_n
$

of $x$ with respect to $B$. Then $alpha_1, dots, alpha_n$ are the _coordinates_ of $x$ with respect to $B$, and the vector

$
  bold(alpha) = vec(alpha_1, dots.v, alpha_n) in RR^n
$

is the _coordinate vector_/_coordinate representaion_ of $x$ with respect to the ordered basis $B$.

#remark("")

A basis effectively defines a coordinate system and any basis of the vector space defines a valid coordinate system. The coordinates of a vector may be different between different basis.

#remark("")

For an _n-_dimensional vector space $V$ and an ordered basis $B$ of $V$, the mapping  #box($Phi: RR^n -> V, Phi(e_i) = b_i, " " i = 1, dots, n,$) is *linear* and *bijective* (since $V$ and $RR^n$ are of the same dimension), where $(bold(e_i), dots, bold(e_n))$ is the *standard basis* of $RR^n$.

#def("Transformation Matrix")

Consider vector spaces $V$ and $W$ with corresponding *ordered* bases $B = (bold(b_1), dots, bold(b_n))$ and #box($C = (bold(c_1), dots, bold(c_m))$). Also condier a *linear mapping* $Phi: V -> W$. For $j in {i, dots, n}$

$
  Phi(bold(b_j)) = alpha_(1j) bold(c_1) + alpha_(2j) bold(c_2) + dots + alpha_(m j) bold(c_j) = sum_(i = 1)^m alpha_(i j) bold(c_i)
$

is the unique representaion (linear combination) of $Phi(bold(b_j))$ with respect to the $C$. Then we call the $m times n$ matrix $bold(A)_Phi$, whose elements are given by

$
  A_Phi(i, j) = alpha_(i j),
$

The _transformation matrix_ of $Phi$ with respect to the ordered bases $B$ of $V$ and $C$ of $W$.

#remark("")
From the definition of the transformation matrix we can see that the coordinates of $Phi(bold(b_j))$ with respct to the ordered basis $C$ of $W$ are the _j-_th column of $bold(A)_Phi$

#coro("")

Consider _finite dimensional_ vector spaces $V, W$ with ordered basis $B, C$ and a linear mapping #box($Phi: V -> W$) with transformation matrix $bold(A)_Phi$. If $hat(bold(x))$ is the *coordinate vector* of $bold(x)in V$ with respect to $B$ and $hat(bold(y))$ is the *coordinate vector* of $bold(y) = Phi(bold(x)) in W$ with respect to $C$, then

$
  hat(bold(y)) = bold(A)_Phi hat(bold(x)).
$

This means that the transformation matrix can be used to map coordinates with respect to an ordered basis in $V$ to coordinates with respect to an ordered basis in $W$.

=== 2.7.2 Basis Change
