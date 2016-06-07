function [volumen]= Problem4(n)
%Problem4.m
%Valor esperado del volumen de un tetraedro formado por cuatro puntos tomados
%aleatoriamente dentro del tetraedro los cuales son (0,0,0), (0,1,0), (0,0,1)
% y (1,0,0)
%
%Entrada
%n : numero de puntos para ver si estan dentro del tetraedro.
%
%Salida
%volumen_estimado : casos favorables entre casos posibles.
%
%
%Declaración de la función:
%volumen_estimado = Problem4(n)
%
%Ejemplo 1
%Calcular el volumen esperado utilizando una muestra de 100 puntos
%>>volumen = Problem4(1000)
%volumen = 0.16000
%
%Autores:
%Mario Salvador Rivera Calero
%Jonathan Vladimir Ramírez Juárez
%06/06/2016cases = 0;
favorables = 0; %Contador de casos donde el punto esta dentro del tetraedro
for k = 1:n
	x = rand;
	y = rand;
	z = rand;
	if x+y+z<=1 %Verificamos que los puntos esten dentro del tetraedro
		favorables = favorables +1; %Sumamos uno al contador si sucede esto.
	end
endfor
volumen = favorables/n; %Casos favorables entre casos posibles.

%EndOfFuntion

%!test
%! n = 1000;
%! volumen = Problem4(n);
%! volumen
%

