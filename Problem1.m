function [probabilidad]= Problem1(n)
%Problem1
%Estimación para la probabilidad de que un neutrón sobrepase una pared de
% anchura igual a 5. Ejemplo de la sección 13.3 Libro de Cheney
%
%Entrada
%n : la cantidad de neutrones que están siendo lanzados contra la pared.
%
%Salida
%probabilidad : es la probabilidad estimada de que un neutrón sobrepase la pared.
%
%
%Declaración de la función:
%probabilidad = Problem1(n)
%
%Ejemplo 1
%Estimar la probabilidad que un neutrón sobrepase la pared con una muestra de 
%1000 neutrones.
%>>probabilidad = Problem1(1000)
%probabilidad =  0.017000
%
%Ejemplo 2
%Estimar la probabilidad que un neutrón sobrepase la pared con una muestra de
%10000 neutrones.
%>>probabilidad = Problem1(10000)
%probabilidad =  0.017200
%
%Autores:
%Mario Salvador Rivera Calero
%Jonathan Vladimir Ramírez Juárez
%06/06/2016

favorables = 0; %Esta variable contendrá los casos favorables, es decir, cuando
% el neutrón sobrepasa la pared.
for k = 1:n
	x = 1; %Es la distancia que se desplaza el neutron en el primer golpe.
	for j =2:8
		theta = rand*2*pi; %Ángulo aleatorio entre 0 y 2pi que asignará la dirección del neutrón.
		x = x + cos(theta);%Sumamos la distancia del desplazamiento en x que realiza el neutrón.
	endfor
	if x >= 5 %Verificamos si el neutrón ha sobrepasado la pared.
		favorables = favorables + 1; %En este caso, sumamos un evento favorable
	end	
endfor
probabilidad = favorables/n; %Casos favorables entre casos posibles.

%EndOfFuntion

%!test
%! n = 1000;
%! probabilidad = Problem1(n);
%! probabilidad
%
