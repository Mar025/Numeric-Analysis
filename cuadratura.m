%Método de la cuadratura adaptativa basada en la regla de simpson

function [p N] = cuadratura(fun,a1,b1,TOL)

%Entrada:
%fun: Es una función a la cual se desea calcular su integral.
%a1 y b2: Son los extremos del intervalo donde deseamos integrar la función fun. 
%TOL: Es la tolerancia que deseamos tener en la aproximación de la integral.

%Salida:
%la función devuelve un vector [p N]; donde p es la aproximación a la integral y N es 
%la cantidad de veces que se evaluó la función para tener el valor p de la integral de fun.
%
%Ejemplo:
%Deseamos conocer el valor de la integral de sin(x) en el intervalo [0,pi] 
%con tolerancia 10^(-8).
%>>[p N] = cuadratura(@(x)(sin(x)),0,pi,10^(-8))
%>>p =  2.0000
%>>N =  129
%Donde 2 es el valor de la integral de sin(x) en el intervalo [0,pi] y se necesito evaluar 129 veces
%la funcion.
%Autores:
%Mario Salvador Rivera Calero
%Jonathan Vladimir Ramírez Juárez
%06/06/2016
APP = 0; %Aproximación para la integral

N = 3; %Cuantas iteraciones debemos hacer para tener la tolerancia deseada.

i = 1;

TOL(i) = 10*TOL;

a(i) =  a1;

h(i) = (b1-a1)/2;

FA(i) = feval(fun,a1);

FC(i) = feval(fun,a1 + h(i));

FB(i) = feval(fun,b1);

S(i) = h(i)*(FA(i)+4*FC(i)+FB(i))/3;

L(i) = 1;

while i>0 
	FD = feval(fun,a(i) + h(i)/2);
	FE = feval(fun,a(i) + 3*h(i)/2);
	S1 = h(i)*(FA(i)+4*FD +FC(i))/6;
	
	S2 = h(i)*(FC(i)+4*FE +FB(i))/6;
	v1 = a(i);
	v2 = FA(i);
	v3 = FC(i);
	v4 = FB(i);
	v5 = h(i);
	v6 = TOL(i);
	v7 = S(i);
	v8 = L(i);
	
	i = i-1;
	if abs(S1+S2-v7)<v6
		APP = APP +(S1+S2);
	else
		i=i+1; %Datos para el subintervalo derecho
		a(i) = v1 + v5;
		FA(i) = v3;
		FC(i) = FE;
		FB(i) = v4;
		h(i) = v5/2;
		TOL(i) = v6/2;
		S(i) = S2;
		L(i) = v8+1;
		i = i+1; %Datos para el subintervalo izquierdo
		a(i) = v1;
		FA(i) = v2;
		FC(i) = FD;
		FB(i) = v3;
		h(i) = h(i-1);
		TOL(i) = TOL(i-1);
		S(i) = S1;
		L(i) = L(i-1);
	end
	N = N+2;
end
p = APP; %APP aproxima a I con la tolerancia deseada.

%EndOfFuntion

%!test
%! [p N] = cuadratura(@(x)(sin(x)),0,pi,10^(-8));
%! p
%! N
%
