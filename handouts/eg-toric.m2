needsPackage "NormalToricVarieties"

-- generate some basic toric varieties:

-- general method: give a list of rays, and a list of maximal cone indices:
X = normalToricVariety(
    {{1,0}, {0,1}, {-1,7}, {0,-1}},
    {{0,1}, {1,2}, {2,3}, {0,3}}
    )
  isSmooth X
  isProjective X
  dim X
  rays X
  max X
  
  -- some of what it can do:
  picardGroup X
  classGroup X
  HH^0(X, OO_X(1,1))

-- some canned methods of creating toric varieties
X = toricProjectiveSpace 3
  rays X
  transpose matrix rays X
  max X
  isSmooth X  
  isSimplicial X
  isProjective X

PP = toricProjectiveSpace
PP 1 ** PP 1
help(symbol**, NormalToricVariety, NormalToricVariety)

X = hirzebruchSurface 2
  rays X
  transpose matrix rays X
  max X
  isSmooth X  
  isSimplicial X
  isProjective X

X = weightedProjectiveSpace {3,5,7}
  dim X
  transpose matrix rays X
  isSmooth X
  isSimplicial X
  max X

  D = fan X
  isPolytopal D
  P = polytope D
  vertices P

  Y = makeSmooth X
  transpose matrix rays Y
  max Y
  isSmooth Y

help smoothFanoToricVariety
X = smoothFanoToricVariety(3, 0)

  dim X
  isSmooth X  
  isFano X
  isSimplicial X
  isProjective X

  transpose matrix rays X
  max X

  D = fan X
  rays D
  maxCones D

X = smoothFanoToricVariety(5, 10)
  transpose matrix rays X
  max X
  isSmooth X
  orbits(X, 0) -- max cones
  orbits(X, 3) -- edges
  orbits(X, 4) -- rays
  orbits(X, 5)
  orbits(X, 0) == max X
  fVector fan X
  for i from 0 to 5 list # orbits(X, 5-i)
