function [W2,D,S,L]=Laplacian(data,n,sigma)%����ȫ���ӷ�������ڽӾ����Ӧ��Laplacian����
%data:ԭʼ���ݼ�,n:����ά��
%W=pdist(data') %�����֮���ŷ�Ͼ���
W=pdist(data','correlation'); %���ϵ����Ϊ����
%W=pdist(data','mahalanobis');
W2 = squareform(W);
%W=normalize(W,'range');
W1 = -(W.*W)/(2*sigma*sigma); %��˹�˺���
S = exp(W1);
S = squareform(S);% ������S��Ϊ���ƶȾ���Ҳ�����ⲻ�����ڽӾ�����㣬���ǲ������ƶȾ���
D = full(sparse(1:n, 1:n, sum(S)));
L=eye(n)-(D^(-1/2) * S * D^(-1/2));
%L=D-S;
end
