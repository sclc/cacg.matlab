function PrecisionTest ()
        initialValue = 1;
	counter = 0;
        while initialValue ~= 0 
                initialValue = initialValue /2;
		counter = counter +1;
        end
	sprintf ('the precision of matlab calculation on this machine is 1 / 2^ %d\n', counter)
end
