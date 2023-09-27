% Central Limit theorem for uniform distribution

%size of random variables
sample_size = 1000;

%number of random variables
n = 2;

%range of random variables
range= [-1,1]; 

%generate N random numbers in the interval (a,b) with the formula r = a + (b-a).*rand(N,1).
X = range(1) + (range(2) - range(1)).*rand(n,sample_size); % matlab starts with 1
X_axis = range(1) :1: range(2);

%mean = (b+a)/2 
mean = (range(2) + range(1))/2;

%variance = (b-a)^2/12
var = (range(2) - range(1))^2 /12;

%population mean and axis and variance
n_x_axis = n .* X_axis;
n_mean = n * mean;
n_var = n * var;

% sum of X1, X2, X3 .... Xn
X_sum = cumsum(X);

fig = figure;
histogram(X_sum)


%Increasing n
n =10;
X = range(1) + (range(2) - range(1)).*rand(n,sample_size);
X_sum = cumsum(X);

fig = figure;
histogram(X_sum)

%Increasing n
n =50;
X = range(1) + (range(2) - range(1)).*rand(n,sample_size);
X_sum = cumsum(X);

fig = figure;
histogram(X_sum)



