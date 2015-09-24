function [img] = make_rectangular(img)

length = size(img,1);
breadth = size(img,2);
k=7;

a=[255];
a=repmat(a,k,k);
for i=1:k:length-k
    for j=1:k:breadth-k
        if  any ( any ( img ( i:i+k-1 , j:j+k-1 ) ) )
                 img ( i:i+k-1 , j:j+k-1 ) = a; 
        end
    end
end

for i=1:k:length-k
    for j=1:k:breadth-k
        if  any ( any ( img ( i:i+k-1 , j:j+k-1 ) ) )
                 img ( i:i+k-1 , j:j+k-1 ) = a; 
        end
    end
end
