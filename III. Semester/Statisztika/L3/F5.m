p=[1:4;50/200,65/200,70/200,15/200];
%1-A, 2-B, 3-0, 4-AB
%B beteg

donation=InversionBySequentialSearch(p,'LEcuyer',10000);
megfelelo=0;
nemok=0;
for i=1:10000
    if(donation(i)==2 || donation(i)==3)
        megfelelo=megfelelo+1;
    else
        nemok=nemok+1;
    end
end

valoszinuseg=megfelelo/10000 %B megfelelo donor
atlag=(nemok+megfelelo)/megfelelo %atlag varakozas
%hist(donation);
