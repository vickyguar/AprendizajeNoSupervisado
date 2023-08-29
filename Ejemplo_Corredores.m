% Cargar datos
Cargar_Corredores
% Construir matriz de datos (X)
X = [km4 km8 km12 km16];
N = size(X,1);
% Centrar X restando la media
Xz = X - repmat(mean(X), N, 1);
% Calcular matriz de covarianza (S)
S = Xz'*Xz / N;
% Calcular autovalores (D) y autovectores (V) de S
[V, D] = eig(S);
% Calcular vector de autovalores normalizados (L) y varianzas acumuladas
% (Lacum)
L = flipud(diag(D)/sum(diag(D)));
Lacum = cumsum(L);
% Graficar L y Lacum
figure
plot(1:length(L), L, 'o-', 1:length(L), Lacum, 'o-')
title('Autovalores y variabilidad acumulada');
xlabel('Número de autovalor');
ylabel('Autovalor normalizado / Variabilidad acumulada');

% Proyectar X sobre la matriz de autovectores (componentes principales). El
% resultado (Y) son los datos X expresados en las nuevas variables.
Y = X*V;
% Graficar los datos expresados en las dos primeras componentes
% principales. Recordar: MATLAB devuelve los autovalores y autovectores de
% menor a mayor. Por lo tanto, el orden de las componentes es: 4, 3, 2, 1.
figure
plot(Y(:,4), Y(:,3), 'o')
title('Primeras dos componentes principales')
xlabel('Y1 (primera componente principal)');
ylabel('Y2 (segunda componente principal)');
text(Y(:,4), Y(:,3), {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',...
    '11', '12'},'VerticalAlignment','bottom','HorizontalAlignment','right')

% Graficar varianzas de las variables originales y de las componentes
% principales. La función 'flipud' invierte el orden de los valores, por lo
% que la primera componente es la de mayor varianza y la última la de
% menor.
% La variabilidad total (suma de las varianzas de las variables) se
% conserva al realizar PCA. Es decir, la variabilidad total de X es la
% misma que la de Y. Se invita a verificarlo haciendo la cuenta.
figure
bar(1:4, flipud([var(X)' var(Y)']));
title('Varianzas');
xlabel('Número de variable');
ylabel('Varianza');
legend('Originales', 'PCA');