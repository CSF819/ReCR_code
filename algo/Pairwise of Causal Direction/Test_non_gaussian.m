function [ aaa,bbb ] = Test_non_gaussian(LR)
%%%ѡ�����ָ��
%%
% �Ͷȼ���
A=LR;

  %B=mean(A,2);
  
[p,n]=size(LR);

  %C=A-repmat(B,1,n);%%%ȥ��ֵ

% C=X;

kurt=zeros(p,1);

for i=1:p
    aa=0;
    %bb=0;
    for j=1:n
        aa=aa+min(0,A(i,j)).^2;
        %bb=bb+C(i,j).^2;
    end
    kurt(i)=-aa;
    %kurt(i)=(aa/n)/(((bb/n).^2))-3;
% % kurt(i)=(aa/n)-3;
end
[aaa,bbb]=sort(kurt,'descend');%%%��������
%%
% %���ؼ���
% ѡ��G����
% G=-exp(-y.^2/2)
% [p,n]=size(X);
% for i=1:p
%     A=X(i,:);
%     kurt(i)=(sum(exp(-A.^2/2))/n).^2;
% end
% [aaa,bbb]=sort(abs(kurt),'descend');%%%��������,aaa��ֵ��bbb�Ƕ�Ӧ�ĺ���
% G=logcoshy
% [p,n]=size(X);
% for i=1:p
%     A=X(i,:);
%     kurt(i)=(sum(log(cosh(A)))/n).^2;
% end
% [aaa,bbb]=sort(abs(kurt),'descend');%%%��������,aaa��ֵ��bbb�Ƕ�Ӧ�ĺ���
end

