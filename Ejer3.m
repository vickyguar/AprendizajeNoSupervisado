%Utilizando el dataset de datos cl�nicos de pacientes (provisto en clase), seleccione
%�nicamente las variables MAP, Edad y Peso, realice un gr�fico 3D de los datos y observe
%la disposici�n espacial de los mismos.
% a. Si se desea ajustar un plano a los puntos, �es correcto realizarlo mediante el 
%    procedimiento de cuadrados m�nimos? �Por qu�?
% b. �Qu� estrategia se le ocurre para obtener el plano que mejor ajuste a los datos,
%    utilizando lo aprendido?

function Ejer3(MAP, Edad, Peso)
plot3(MAP, Edad, Peso, 'o')
xlabel('MAP')
ylabel('Edad')
zlabel('Peso')

end
