function [pos,neg] = OurSplit(v) %ֻ��Ҫ��SpeCl�еõ���pos��neg�������Ļ�������
mu=mean(v);
sd=std(v);
c=(v-mu)./sd;
pos=v(c>0);
neg=v(c<=0);
end


