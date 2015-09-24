function s=picewise_transform(r)
if r<250 & r>100
    s=r;
else
    s=uint8(255);
end