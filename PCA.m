function a = PCA(x)

% Setup
[~, n] = size(x); % filas | columnas

Xmed = zeros(size(x))
for i = 1:n
    Xmed(:,i) = mean(x(:,i));
end

Xz = x - Xmed;
Sigma = Xz'*Xz; % matriz de covarianza

[V, A] = eig(Sigma); % hay que normalizarlo flip ud y flip rl

a = sort(diag(A), 'descend'); % autovalores
a = a./sum(a); 
v = fliplr(V); % autovectores

b = sqrt(a)

stem(a)
hold on
%stem(var(x)./sum(var(x)))

acum(1) = a(1);
for i = 2:n
    acum(i) = acum(i-1) + a(i);
end

plot(acum)

end