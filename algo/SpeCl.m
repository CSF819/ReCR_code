function [v2,pos,neg] = SpeCl(l)
%v=����������d=����ֵ
[v,d]=eig(l);
d=diag(d);%������ֵ�Խ���ת��Ϊһ������
[d,dorder]=sort(d);%����yΪԪ�أ�zΪԪ������
dorder=dorder(2);%�ҳ��ڶ�С����ֵ��2���ڵ�λ��
v2=v(:,dorder);%�ҵ�v2
pos=v2(v2>0);
neg=v2(v2<=0);
end



