clear;
clearglobal;
stacksize('max');
scf();

numberOfSteps = 10000;
size_ = 100;
blocksForTime = size_;
y = zeros(1,size_);
width = zeros(1, int(numberOfSteps));
pos = 1:1:int(numberOfSteps);
posSize = 1:1:int(size_);
randonNumbers = rand(numberOfSteps, blocksForTime);

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
        if y(ant) < y(d) | y(dep) < y(d) then
            if(y(ant) < y(dep))
                y(int(ant)) = y(int(ant)) + 1;
            else
                y(int(dep)) = y(int(dep)) + 1;
            end
        else
            y(int(d)) = y(int(d)) + 1;
        end
        
    end
    
    width(j) = stdev(y);
    
    if modulo(j, 100) == 0 then
       plot(posSize, y, 'color', rand(1,3));
    end

end

scf();
plot(pos, width);

scf();
plot(pos, width);
a = gca();
a.log_flags = 'lln';
