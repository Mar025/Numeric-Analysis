%tabla.m
%Script auxiliar para obtener las aproximaciones de las fuciones solicitadas en la tabla
%y el numero de iteraciones realizadas.
%
%Autores:
%Mario Salvador Rivera Calero
%Jonathan Vladimir Ramírez Juárez
%06/06/2016
format long
[p N]=cuadratura(@(x)(x^(2)*exp(-x)+cos(x)),-1,1,10^(-6))
[p N]=cuadratura(@(x)(x^(2)*exp(-x)+cos(x)),-1,1,10^(-8))
[p N]=cuadratura(@(x)(sin(x)),0,pi,10^(-8))
[p N]=cuadratura(@(x)(cos(x)),0,(9/2)*pi,10^(-6))
[p N]=cuadratura(@(x)(sqrt(x)),0,1,10^(-8))
[p N]=cuadratura(@(x)(sqrt(x)*log(x)),eps,1,10^(-8))
[p N]=cuadratura(@(x)(tan(sin(x))-sin(tan(x))),0,pi,10^(-2))
%[p N]=cuadratura(@(x)(1/(1-3*x)),0,1,10^(-4)) %No Converge!!!
[p N]=cuadratura(@(x)(x^(8/3)*(1-x)^(10/3)),0,1,10^(-8))
[p N]=cuadratura(@(x)(x^(25)*(1-x)^(2)),0,1,10^(-8))
[p N]=cuadratura(@(x)((1/((x-3)^(2)+0.01))+(1/((x-9)^(2)+0.04))-6),0,2,10^(-6))
