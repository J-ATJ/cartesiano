clear all
close all
clc


disp('Número máximo de cada posición = -9');
disp('Número máximo de cada posición = 9');

t1=0;
a1=input('dame la posición 1 en x\n');
b1=input('dame la posición 1 en y\n');
c1=input('dame la posición 1 en z\n');

t2=input('dame el tiempo 2\n');

a2=input('dame la posición 2 en x\n');
b2=input('dame la posición 2 en y\n');
c2=input('dame la posición 2 en z\n');

t3=input('dame el tiempo 3\n');

a3=input('dame la posición 3 en x\n');
b3=input('dame la posición 3 en y\n');
c3=input('dame la posición 3 en z\n');

t4=input('dame el tiempo 4\n');

a4=input('dame la posición 4 en x\n');
b4=input('dame la posición 4 en y\n');
c4=input('dame la posición 4 en z\n');


[Px]=Pol_Lagrange([t1 t2 t3 t4],[a1 a2 a3 a4]);
[Py]=Pol_Lagrange([t1 t2 t3 t4],[b1 b2 b3 b4]);
[Pz]=Pol_Lagrange([t1 t2 t3 t4],[c1 c2 c3 c4]);

paso=0.1;    %paso del tiempo

t=t1;               %el tiempo toma el valor del tiempo inicial
tic                 %inicializa un contador de tiempo
tv=t1:paso:t4;
      
xvp=zeros(length(tv),1);
yvp=zeros(length(tv),1);
zvp=zeros(length(tv),1);
xvpp=zeros(length(tv),1);
yvpp=zeros(length(tv),1);
zvpp=zeros(length(tv),1);
i=1;



%ciclo while
while t<=t4   
    
    %condicional 
    if toc>paso
        
        toc             %detener el contador de tiempo
        tic             %iniciar el contador de tiempo
        

        x=t;
        xv(i)=eval(Px);
        yv(i)=eval(Py);
        zv(i)=eval(Pz);
        tv(i)=t;
      
        
      if i~=1
        %velocidades del robot
         xvp(i)=(xv(i)-xv(i-1))/paso;
         yvp(i)=(yv(i)-yv(i-1))/paso;
         zvp(i)=(zv(i)-zv(i-1))/paso;
        %aceleraciones
        xvpp(i)=(xvp(i)-xvp(i-1))/paso;
        yvpp(i)=(yvp(i)-yvp(i-1))/paso;
        zvpp(i)=(zvp(i)-zvp(i-1))/paso;
      end
        
      if i==3
          xvp(1)=xvp(2);
          yvp(1)=yvp(2);
          zvp(1)=zvp(2);
          
          xvpp(1)=xvpp(2);
          yvpp(1)=yvpp(2);
          zvpp(1)=zvpp(2);
      end
      
      %Gr�fica del Robot y trayectoria
    
        figure(1)
            
        plot3(xv, yv, zv,'k') %trayectoria del robot color negro
     
            hold on
            axis([-10 10 -10 10 -10 10])
        
            grid on
            line([0 xv(i)],[0 0],[0 0], 'color','b');
            line([xv(i) xv(i)],[0 yv(i)],[0 0], 'color','m');
            line([xv(i) xv(i)],[yv(i) yv(i)],[0 zv(i)],'color','r');
        
            xlabel('eje x')                 % mostrar eje x
            ylabel('eje y')                 % mostrar eje y
            zlabel('eje z')                 % mostrar eje z
        
            hold off
        drawnow  


        figure(2)
        
        subplot(2,3,1)
        plot(tv,xvp)
        title('velocidad X')
            xlabel('tiempo(s)')
            ylabel('m/s')
        
        subplot(2,3,2)
        plot(tv,yvp)
        title('velocidad Y')
            xlabel('tiempo(s)')
            ylabel('m/s')
        
        subplot(2,3,3)
        plot(tv,zvp)
        title('velocidad Z')
            xlabel('tiempo(s)')
            ylabel('m/s')
        
        subplot(2,3,4)
        plot(tv,xvpp)
        title('aceleración X')
            xlabel('tiempo(s)')
            ylabel('m/s^2')
        
        subplot(2,3,5)
        plot(tv,yvpp)
        title('aceleración Y')
            xlabel('tiempo(s)')
            ylabel('m/s^2')
        
        subplot(2,3,6)
        plot(tv,zvpp)
        title('aceleración Z')
            xlabel('tiempo(s)')
            ylabel('m/s^2')

        
        
        
            t=t+paso;              
        i=i+1;
    end
end
disp('   ');
disp('Polinomio en (x)');
Px
 
disp('Polinomio en (y)');
Py

disp('Polinomio en (z)');
Pz
