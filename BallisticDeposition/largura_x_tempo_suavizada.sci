clear;
clearglobal;
stacksize('max');
scf();

numberOfSteps = 10000;
previsaoTx = 5;
amplitude = 500;
size_ = 500;


blocksForTime = size_;
y = zeros(1,size_);
width = zeros(1, int(numberOfSteps));
pos = 1:1:int(numberOfSteps);
posSize = 1:1:int(size_);
randonNumbers = rand(numberOfSteps, blocksForTime);

qtdMedias = int((numberOfSteps-previsaoTx)/amplitude);
medias = zeros(1,numberOfSteps);

for j=1:numberOfSteps

    for i=1:blocksForTime
        
        d = ceil(randonNumbers(j, i)*size_);
        ant = d-1;
        dep = d+1;
        if d == 1 then
            ant = size_;
        elseif d == size_ then
            dep = 1;
        end
        if y(ant) > y(d) | y(dep) > y(d) then
            if(y(ant) > y(dep))
                y(int(d)) = y(int(ant));
            else
                y(int(d)) = y(int(dep));
            end
        else
            y(int(d)) = y(int(d)) + 1;
        end
        
    end
    
    width(j) = stdev(y);
    
    if modulo(j, amplitude) == 0 then
       plot(posSize, y, 'color', rand(1,3));
    end

end

//scf();
//plot(pos, width);

for i=0:qtdMedias
    soma = 0;
    if previsaoTx+(amplitude*i) + amplitude < numberOfSteps then
        for j=(previsaoTx+(amplitude*i)):(previsaoTx+(amplitude*i) + amplitude)
            soma = soma + width(j);
        end
        medias(previsaoTx+(amplitude*i) + amplitude/2) = soma/amplitude;
    end
end
//plot(pos, medias, '*');

scf();
plot(pos, width, 'color', rand(1,3));
a = gca();
a.log_flags = 'lln';
plot(pos, medias, '*');
a = gca();
a.log_flags = 'lln';
