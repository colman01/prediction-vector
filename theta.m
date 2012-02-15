    function result = theta (k,d)

        if(mod(d,2))
            %% odd

            g = d/2 -k;
            nomin = gamma(g);

            B1 = pi^(d/2);
            B2 = factorial(k-1);
            B3 = 2^2*k;
            domin = B1*B2*B3;
            
            result = nomin/ domin;
            
%             disp(result);
            
        else
            %% even
            T = k + d / 2 + 1;
            
            nomin = (-1)^T;
            
            nomin = real(nomin );            
            B1 = 2^(2^k -1);
            B2 = pi^(d/2);
            B3 = factorial(k-1);
            B4 = factorial( k - d/2);

            result = nomin / (B1*B2*B3*B4);
        end
    end