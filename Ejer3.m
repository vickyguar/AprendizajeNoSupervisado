%Utilizando el dataset de datos clínicos de pacientes (provisto en clase), seleccione
%únicamente las variables MAP, Edad y Peso, realice un gráfico 3D de los datos y observe
%la disposición espacial de los mismos.
% a. Si se desea ajustar un plano a los puntos, ¿es correcto realizarlo mediante el 
%    procedimiento de cuadrados mínimos? ¿Por qué?
% b. ¿Qué estrategia se le ocurre para obtener el plano que mejor ajuste a los datos,
%    utilizando lo aprendido?

function Ejer3(MAP, Edad, Peso)
plot3(MAP, Edad, Peso, 'o')
xlabel('MAP')
ylabel('Edad')
zlabel('Peso')

end
