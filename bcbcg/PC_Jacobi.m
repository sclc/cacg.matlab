function [A] = PC_Jacobi(A)
% Jacobi precoditioner
	[nrow,ncol] = size(A);
	diagA = diag(A);
	assert (nrow==ncol, 'this function need a square matrix as input');

	for ind=1:nrow
		assert (diagA(ind)~=0, 'this function cannot handle zero value element');
		diagRoot = sqrt(diagA(ind));
		A(ind,:) = A(ind,:) ./ diagRoot;
		A(:,ind) = A(:,ind) ./ diagRoot;
	end

end