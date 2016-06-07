function [p itmax] = brent(func,x1,x2,tol)
%M�todo de brent
%
%Entrada:
%func: Funci�n a la que se desea aproximar la ra�z.
%x1 y x2: Son los extremos del intervalo que contiene la ra�z de la funci�n.
%tol: Es la tolerancia que deseamos obtener en la aproximaci�n de la ra�z.
%
%Salida:
% La funci�n devuelve un vector [p itmax]; donde p es la aproximaci�n a la raiz y itmax es 
% la cantidad de veces que se evalu� la funci�n.
%
%
%Ejemplo:
%Aproximar el valor de x tal que log(x)-1= 0 en el intervalo [2,3] con tolerancia 10^(-8).
%>> [p itmax] = brent(@(x)(log(x)-1),2,3,10^(-8))
%>> p =  2.71828170077059
%>> itmax =  63
%Donde la raiz es e y las iteraciones realizadas fueron -----------.
%
%Autores:
%Mario Salvador Rivera Calero
%Jonathan Vladimir Ram�rez Ju�rez
%06/06/2016
format long %Formato largo para los reales.
ITMAX=10000;% Numero m�ximo de iteraciones.
EPS=3.0*(10^-8); % Presici�n para punto flotante.
a=x1; %Guardamos x1 en a.
b=x2; %Guardamos x2 en b.
fa=feval(func,a); %Calculamos f(a).
fb=feval(func,b); %Calculamos f(b).
if((fa>0) & (fb>0)) || ((fa<0) & (fb<0)); %No hay una ra�z en el intervalo.
    error('Procedimiento terminado sin exito');
else
    c=b;
    fc=fb;
    iter=0; %Contador del n�mero de iteraciones.
    while iter<ITMAX;
        if((fb>0) & (fc>0)) || ((fb<0) & (fc<0));
            c=a; 
            fc=fa;
            d=(b-a);
            e=d;
        end
        if abs(fc)<abs(fb);
            a=b;
            b=c;
            c=a;
            fa=fb;
            fb=fc;
            fc=fa;
        end
        tol1=2*EPS*abs(b)+ 0.5*tol; %Convergencia Asegurada
        xm=0.5*(c-b);
        if(abs(xm)<=tol1) || (fb==0);
            p=b;
            itmax=iter;
            break
        end
        if(abs(e)>=tol1 && abs(fa)>abs(fb))
            s=fb/fa; %Intentar interpolaci�n cuadr�tica inversa.
            if(a==c);
                p=2*xm*s;
                q=1-s;
            else
                q=fa/fc;
                r=fb/fc;
                p=s*(2*xm*q*(q-r)-(b-a)*(r-1));
                q=(q-1)*(r-1)*(s-1);
            end
            if(p>0); %Verificar si est� en los l�mites.
                q=-q;
                p=abs(p);
            end
            if(2*p < min(3*xm*q-abs(tol1*q),abs(e*q)));
                e=d; %Aceptar interpolaci�n.
                d=p/q;
            else
                d=xm; %Fall� la interpolaci�n, usar bisecci�n.
                e=d;
            end\textbf{Problema 1.}
\begin{itemize}
\item[Paso 1)] Abrir Octave/MATLAB y entrar a la carpeta donde est\'{a}n guardados los archivos .m.
\begin{shaded}
\begin{verbatim}
octave:1> cd Escritorio/
octave:2> cd Proyecto % Donde "Proyecto" es el nombre de la carpeta que contiene
los archivos necesarios.
\end{verbatim}
\end{shaded}

\item[Paso 2)] Ahora ejecutamos \textbf{probabilidad = Problem1(1000)} y tenemos:\
\begin{shaded}
\begin{verbatim}
octave:3> probabilidad = Problem1(1000)
probabilidad =  0.017000
\end{verbatim}
\end{shaded}

Donde \textbf{probabilidad = Problem1(1000)} devuelve que la probabilidad estimada es 0.017000.\\
\end{itemize}
        else %Las cotas decrecen muy despacio, usar bisecci�n.
            d=xm;
            e=d;
        end
        a=b; %Mover la �ltima respuesta al valor de a
        fa=fb;
        if(abs(d)>tol1);
            b=b+d;
        else
            if sign(xm)==0;
                b=b+abs(tol1)*(-1);
            else
                b=b+abs(tol1);
            end
        end
        fb=feval(func,b);
        iter=iter+1;
    end
    if iter==ITMAX
    	error ('La funcion Brent excedio el maximo de iteraciones');
    end
    p=b;
    itmax=iter;
end


%EndOfFuntion

%!test
%! [p itmax] = brent(@(x)(log(x)-1),2,3,10^(-8));
%! p
%! itmax
%
