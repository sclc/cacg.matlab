function [ y, lambda, it_num ] = power_iteration_1 ( n, a, y, it_max, tol )

%*****************************************************************************80
%
%% POWER_METHOD applies the power method for a real eigenvalue.
%
%  Discussion:
%
%    For a given NxN matrix A and an N vector Y, the power method produces
%    a series of estimates for LAMBDA, the largest eigenvalue, and Y,
%    the eigenvector corresponding to LAMBDA.
%
%    The iteration repeats the following steps
%
%      AY     = A * Y
%      LAMBDA = || AY ||
%      Y      = AY / LAMBDA
%
%    If the matrix A has a single real eigenvalue of maximum modulus,
%    then this iteration will generally produce a good estimate for that
%    eigenvalue and its corresponding eigenvector.
%
%    If there are multiple distinct eigenvalues of the same modulus,
%    perhaps two values of opposite sign, or complex eigenvalues, then
%    the situation is more complicated.
%
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real Y(N,1), the current estimate for the eigenvector.
%
%    Input, integer IT_MAX, the maximum number of iterations to take.
%    1 <= IT_MAX.
%
%    Input, real TOL, an error tolerance.
%
%    Output, real Y(N,1), the updated estimate for the eigenvector.
%
%    Output, real LAMBDA, the estimate for the eigenvalue.
%
%    Output, integer IT_NUM, the number of iterations taken.
%
  debug = 1;

  if ( debug )
    fprintf ( 1, '\n' );
    fprintf ( 1, '     IT      Lambda          Delta-Lambda    Delta-Y\n' );
    fprintf ( 1, '\n' );
  end
%
%  Force Y to be a column vector.
%
  y = y ( : );
  lambda = 0;
%
%  Force Y to be a vector of unit norm.
%
  y = y / norm ( y );

  it_num = 0;

  y_old = y;

  ay = a * y;
  lambda = y' * ay;
  y = ay / norm ( ay );
%  if ( lambda < 0.0 )
%    y = - y;
%  end

  val_dif = 0.0;

  cos_y1y2 = y' * y_old;
  sin_y1y2 = sqrt ( ( 1.0 - cos_y1y2 ) * ( 1.0 + cos_y1y2 ) );

  if ( debug )
    fprintf ( 1, '  %5d  %14e  %14e  %14e\n', it_num, lambda, val_dif, sin_y1y2 );
  end 

  for it_num = 1 : it_max

    lambda_old = lambda;
    y_old = y;

    ay = a * y;
    % use inner product to calculate lambda
    lambda = y' * ay;
    y = ay / norm ( ay );
%    if ( lambda < 0.0 )
%      y = - y;
%    end

    val_dif = abs ( lambda - lambda_old );

    sin_y1y2 = 0;
    cos_y1y2 = y' * y_old;
    sin_y1y2 = sqrt ( ( 1.0 - cos_y1y2 ) * ( 1.0 + cos_y1y2 ) );

    if ( debug )
      fprintf ( 1, '  %5d  %14e  %14e  %14e\n', it_num, lambda, val_dif, sin_y1y2 );
    end

    if ( abs(val_dif/lambda) <= tol )
      break
    end 

  end

 % consider lambda has already converged, so corresonding eigen-value should be 
 % 	 the ration of ay and lambda
  y = ay / lambda;

  return
end
