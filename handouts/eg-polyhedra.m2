-- 28 Feb 2019, Math 7670 Introduction to Toric Varieties
-- Mike Stillman

-- Let's compute some with polyhedra in M2:
restart
needsPackage "Polyhedra"
-- Some canned polyhedra:
P = cyclicPolytope(3,5)
  vertices P
  halfspaces P
  facets P
  isCompact P
  isFullDimensional P
  fVector P
  Sigma = normalFan P
  rays Sigma
  dim Sigma
  isComplete Sigma
  isSimplicial Sigma
  faces(0,Sigma)
  faces(1,Sigma)
  faces(2,Sigma)
  Sigma2 = faceFan P
  
needsPackage "NormalToricVarieties"  
  X = normalToricVariety Sigma
  dim X
  isSmooth X
  isSimplicial X
  rays X
  max X

needsPackage "ReflexivePolytopesDB"
  str  = getKreuzerSkarke(5, Limit=>1)
  tope = first parseKS str
  A = matrixFromString tope#1
  P = convexHull A
  vertices P
  fVector P
  isReflexive P
  isFullDimensional P
  isSimplicial P  

  -- make a polyhedron from inequalities:
  (A',b) = halfspaces P
  P1 = polyhedronFromHData(A', b)
  P1 == P

  -- polar
  P' = polar P
  vertices P'
  fVector P'
  isCompact P'

  -- face fan and normal fan
  Sigma = normalFan P
  Sigma2 = faceFan polar P
  Sigma == Sigma2
  fVector Sigma
  fVector P
  fVector polar P

  -- a 3D example
  topes = parseKS getKreuzerSkarkeDim3();
  #topes
  topes#100
  P = convexHull matrixFromString(last oo)
  fVector P
  vertices P
  Sigma = normalFan P
  dim Sigma
  rays Sigma
  faces(0,Sigma)
  faces(1,Sigma)
  faces(2,Sigma)
  faces(3,Sigma)
  faceFan P
    
