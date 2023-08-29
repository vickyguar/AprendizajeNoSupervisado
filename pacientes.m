% Utilizando el dataset de datos cl�nicos de pacientes (provisto en clase), realice un PCA 
% utilizando la matriz de covarianza y luego utilizando la matriz de correlaci�n.
% a. �Qu� diferencias observa entre los resultados? �A qu� se deben?
% b. �Cu�l le parece m�s apropiado utilizar en este problema? �Por qu�?
% c. Observe los coeficientes de combinaci�n lineal de las primeras 2 componentes 
% principales y trate de explicar qu� informaci�n representa cada una.

function a = pacientes(x)

% Setup
[~, n] = size(x); % filas | columnas

Xmed = zeros(size(x))
for i = 1:n
    Xmed(:,i) = mean(x(:,i));
end

[V, A] = eig(corrcoef(x)); % hay que normalizarlo flip ud y flip rl

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