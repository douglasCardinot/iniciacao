blocksForTime = 10;
numberOfSteps = 1000;
size_ = 200;
y = zeros(1,size_);
width = zeros(1, numberOfSteps);
pos = 1:1:numberOfSteps;

for j=1:numberOfSteps

    for i=1:blocksForTime
        d = rand()*size_ + 1;
        y(int(d)) = y(int(d)) + 1;
    end
    
    width(j) = stdev(y);

end

plot(pos, width);

clear
clc

function mat_img = nome_func(dir_img)
    //escreve codigo
    mat_img = 1;
endfunction