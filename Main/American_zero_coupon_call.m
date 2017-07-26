function main
    clc; 
    close all;
    clear all;
    format long;

    useDefaultInputs=1; 
    
    useDefaultInputs=0; %Comment this line if want to use default values

    %Ask for inputs
    if (useDefaultInputs==0)
        x_given = input('Enter year x [example: x=1]='); 
        y_given = input('Enter year y [example: y=2]='); 
        r = input('Enter initial short rate r (%) [example: r=4]='); 
        betta = input('Enter betta (%) [example: betta=20]='); 
        mu = input('Enter mu (%) [example: mu=4]='); 
        sigma = input('Enter volatility sigma (%) [example: sigma=10]=');
        n = input('Enter number of partitions n [example: n=30]='); 
        X_strike = input('Enter strike price X [example: X=90]=');
    else
    %Default inputs
        x_given = 1; 
        y_given = 2; 
        r = 4; 
        betta = 20; 
        mu = 4; 
        sigma = 10; 
        n = 30; 
        X_strike = 90;
    end
    
    %Recalculate percentage
	r=r/100;
	sigma=sigma/100;	
    betta=betta/100;
	mu=mu/100;
    
    %Calculate deltas
    deltaT=x_given/n;
	deltaX=sqrt(deltaT);
	z=2*sqrt(r)/sigma;

    C=zeros(1,n+2);
    for i=0:n
        node_z=z+(n-2*i)*deltaX;
        node_r=node_z*node_z*(sigma^2)/4;
        C(i+1)=max(calculateValue(betta,sigma,mu,y_given-x_given,node_r)*100-X_strike,0);
        %C(i+1)=max(X_strike-calculateValue(betta,sigma,mu,y_given-x_given,node_r)*100,0);
    end
    
    for j=n-1:-1:0
        for i=0:j
            node_z=z+(j-2*i)*deltaX;
            node_r=((node_z)^2)*(sigma^2)/4;
            node_r_plus=(node_z+deltaX)*(node_z+deltaX)*(sigma^2)/4;
            node_r_minus=(node_z-deltaX)*(node_z-deltaX)*(sigma^2)/4;
			if (node_r == 0)
				node_p=1;
			else
				node_p= (betta*(mu-node_r)*deltaT+node_r-node_r_minus)/(node_r_plus-node_r_minus);
            end
			if (node_p<0) 
                node_p=0;
            end
			if (node_p>1) 
                node_p=1;
            end
			C(i+1)=(node_p*C(i+1)+(1-node_p)*C(i+2))/exp(node_r*deltaT);
            %C(i+1)=max(X_strike-calculateValue(betta,sigma,mu,y_given-deltaT*j,node_r)*100,C(i+1));
        end
    end
    disp('---------------------------------')
    resultString=['The value of the call is: ', num2str(sprintf('%0.7f',C(1)))];
    disp(resultString)
    disp('---------------------------------')
end

function value=calculateValue(betta,sigma,mu,x_given,r)
    value=0;
	gamma = sqrt(betta*betta+2*sigma^2);
        
    %Calculate A based on A0 and A1
    A0=2*gamma*exp((betta+gamma)*x_given/2)/((betta+gamma)*(exp(gamma*x_given)-1)+2*gamma);
    A1=2*betta*mu/(sigma^2);
    A=A0^A1;
		
    %Calculate B
    B=(2*(exp(gamma*x_given)-1))/((betta+gamma)*(exp(gamma*x_given)-1)+2*gamma);
        
    value=A*exp(-B*r);
end