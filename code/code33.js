importPackage(Packages.org.apache.commons.math.linear);
//preparing matrix and data
matA = [[ 2, 3, -2 ], [ -1, 7, 6 ], [ 4, -3, -5 ]];
vecB = [ 1, -2, 1 ]
//LU decomposition
coefficients = new Array2DRowRealMatrix(matA, false);
solver = new LUDecompositionImpl(coefficients).getSolver();
ans = solver.solve(vecB);
for (i in ans) IJ.log(ans[i]);