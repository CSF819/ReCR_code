function NE=find_edge(Saver,Skeleton,k)
%�ҳ���ͬ��֮��ߵĸ���
n=sum(1:k);
NE=zeros(k,k);%NUMBER OF EDGES
for i=1:k
    for j=i+1:k
    NE(i,j)=sum(sum(Skeleton(Saver{i,1},Saver{j,1})==1));
    end
end
end
