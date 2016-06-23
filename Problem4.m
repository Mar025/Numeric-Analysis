function [volumen_estimado]= Problem4(n)
%Problem4.m
%Valor esperado del volumen de un tetraedro formado por cuatro puntos tomados
%aleatoriamente dentro del tetraedro los cuales son (0,0,0), (0,1,0), (0,0,1)
% y (1,0,0)
%
%Entrada
%n : tamaño de la muestra de los tetraedro.
%
%Salida
%volumen_estimado : media de los volumenes de los tetraedros.
%
%
%Declaración de la función:
%volumen_estimado = Problem4(n)
%
%Ejemplo 1
%Calcular el volumen esperado utilizando una muestra de 100 tetraedros
%>>volumen = Problem4(100)
%volumen =  0.0029508
%
%Autores:
%Mario Salvador Rivera Calero
%Jonathan Vladimir Ramírez Juárez
%06/06/2016

volumenes = zeros(1,n); %Vector que contendrá los volumenes de cada tetraedro
for j = 1:n;
	matriz = ones(4,4); %Matriz para guardar las coordenadas del tetraedro y calcular su volumen
	k = 0; %Contador para los puntos que guardaremos en la matriz
	while k<4 %Necesitamos obtener 4 puntos
		x = rand;
		y = rand;
		z = rand;
		if x+y+z<=1 %Verificamos que el punto esté dentro del tetraedro
			vector = [x y z]; %Punto que está en el tetraedro
			matriz(k+1,1:3) = vector; %Agregamos el punto a la matriz
			k = k+1; %Sumamos 1 al contador de los puntos
		end
	end
	volumen = (1/6)*abs(det(matriz)); %Calculamos el volumen del j-esimo tetraedro
	volumenes(j) = volumen; %Guardamos el volumen en el vector que contendra todos los volumenes
endfor
volumen_estimado = sum(volumenes)/n; %Es la media de los volumenes.

%EndOfFuntion

%!test
%! n = 1000;
%! volumen = Problem4(n);
%! volumen
%
