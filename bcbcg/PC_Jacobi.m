function [A] = PC_Jacobi(A)
% Jacobi precoditioner
	[nrow,ncol] = size(A);
	diagA = diag(A);
	assert (nrow==ncol, 'this function need a square matrix as input');

	for ind=1:nrow
		assert (diaA(ind)~=0, 'this function cannot handle zero value element');
		diaRoot = sqrt(diaA(ind));
		A(ind,:) = A(ind,:) ./ diaRoot;
		A(:,ind) = A(:,ind) ./ diaRoot;
	end

end