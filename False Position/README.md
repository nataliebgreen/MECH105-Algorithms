falsePosition finds the root of a function using false position method
Inputs:
   func - the function being evaluated
   xl - the lower guess
   xu - the upper guess
   es - the desired relative error (should default to 0.0001%)
   maxit - the maximum number of iterations to use (should default to 200)
Outputs
   root - the estimated root location
   fx - the function evaluated at the root location
   ea - the approximate relative error (%)
   iter - how many iterations were performed
