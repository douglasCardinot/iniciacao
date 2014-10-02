clear;

numberOfSteps = 4*100000;
size_ = 200;
blocksForTime = 200;
y = zeros(1,size_);
width = zeros(1, int(numberOfSteps/blocksForTime));
pos = 1:1:int(numberOfSteps/blocksForTime);

for j=1:numberOfSteps

    for i=1:blocksForTime
        d = int(rand()*size_ + 1);
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
    
    if modulo(j, blocksForTime) == 0 then
        width(int(j/blocksForTime)) = stdev(y);
    end
    

end

plot(pos, width);

clear
