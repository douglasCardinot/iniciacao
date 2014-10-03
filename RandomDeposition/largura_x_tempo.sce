clear
scf();

numberOfSteps = 1000;
size_ = 200;
blocksForTime = size_;
y = zeros(1,size_);
width = zeros(1, numberOfSteps);
pos = 1:1:numberOfSteps;
posSize = 1:1:int(size_);
randonNumbers = rand(numberOfSteps, blocksForTime);

for j=1:numberOfSteps

    for i=1:blocksForTime
        d = ceil(randonNumbers(j, i)*size_);
        y(int(d)) = y(int(d)) + 1;
    end
    
    width(j) = stdev(y);
    
    if modulo(j, 100) == 0 then
       plot(posSize, y, 'color', rand(1,3));
    end

end

scf();
plot(pos, width, '*');

scf();
plot(pos, width);
a = gca();
a.log_flags = 'lln';
