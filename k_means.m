function C = k_means(k, x, centroide, l) % x = [a, b]

% Setup
N = length(x(:,1)); % el ", 1 " esta asumiendo que es la primera dimension

% Grafico inicialmente los datos
plot(x(:,1), x(:,2), 'o')

if nargin < 3
    
    l = 1;
    
    % Inicialización de los centroides, usando método de Forgy
    r = randi([1, N + 1], 1, k);

    % Inicializo c
    centroide = zeros(k, length(x(1,:)));
    for i = 1:k
        centroide(i) = x(r(i));
    end
end

% Inicializo un vector
C = zeros(N, 1);

for f = 1 : N
    for j = 1 : k
        
        % Distancia del centroide al punto
        d = abs(x(f) - centroide(j));
        
        if(j == 1 || d_min > d)
            d_min = d;
            C(f) = j;
        end 
    end
end

for i = 1:k
    centroide(i,1) = sum(x(C == i, 1))/length(x(C == i, 2));
    centroide(i,2) = sum(x(C == i, 2))/length(x(C == i, 2));
end

if l < 200
    l = l + 1;
    C = k_means(k, x, centroide, l);
end

figure(2)
colors = {'k','b','r','g','y',[.5 .6 .7],[.8 .2 .6]}; % Cell array of colros.
for i = 1: k
    plot(x(C == i ,1), x(C == i,2), 'o','color',colors{i})
    hold on
end

end