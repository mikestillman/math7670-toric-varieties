-- Math 7670 handout 1, source code.
-- See example 1.2.15 in Cox-Little-Schenck.
restart
e = entries (id_(ZZ^4))
A = transpose matrix flatten (
  for i from 0 to 3 list 
    for j from 0 to 3 list 
      if i ==j then continue else 2*e#i+e#j
  )

needsPackage "FourierMotzkin"
(B, Bh) = fourierMotzkin A
(A', A'h) = fourierMotzkin B
-- note: A' is equal to A: meaning all the columns of A are irredundant (as A' has this property)
-- The columns of B are the rays of (dualCone C).
(transpose B) * A -- all entries are <= 0.


needsPackage "Polyhedra"
C = coneFromVData A
rays C
halfspaces C
(halfspaces C) * (rays C) -- hmmm, opposite of our definition!
rays dualCone C -- transpose of (halfspaces C), also not matching our def!
-- OUR def of dualCone is the negative of this!!
dualRays = - rays dualCone C
dualHalf = - halfspaces C

matrix{hilbertBasis C}
matrix{hilbertBasis dualCone C}

faces(1,C)
faces(2,C)
