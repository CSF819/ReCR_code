function [Saver,PosSaver,NegSaver] = OurAlgo_Split_Main(L,k) 
%INPUT��LΪlaplacian����kΪ���ֵĴ���
%OUTPUT: saver�洢�����ո����еĽڵ����
[v2,pos1,neg1] = SpeCl(L); 
PosOrder1=find(ismember(v2,pos1)==1);
NegOrder1=find(ismember(v2,neg1)==1);
s=1;%�ѷֵĴ���
%%%Ԥ�����ڴ�%%%
    PosSaver=cell(floor(k/2),1);
    NegSaver=cell(ceil(k/2),1);
    Saver=cell(k,1);
%%%����%%%
for s=1:k
    [posa,nega]=OurSplit(eval(['pos',num2str(s)]));
    eval(['pos',num2str(2*s),'=','posa',';']);
    eval(['neg',num2str(2*s),'=','nega',';']);
    %%%����õ�pos��negת����v2�ж�Ӧ��λ�ã���ת����ȫ���еĽڵ�%%%
    PosOrdera=find(ismember(v2,posa)==1);
    eval(['PosOrder',num2str(2*s),'=','PosOrdera',';'])
    NegOrdera=find(ismember(v2,nega)==1);
    eval(['NegOrder',num2str(2*s),'=','NegOrdera',';'])
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [posb,negb]=OurSplit(eval(['neg',num2str(s)]));
    eval(['pos',num2str(2*s+1),'=','posb',';']);
    eval(['neg',num2str(2*s+1),'=','negb',';']);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    PosOrderb=find(ismember(v2,posb)==1);
    eval(['PosOrder',num2str(2*s+1),'=','PosOrderb',';'])
    NegOrderb=find(ismember(v2,negb)==1);
    eval(['NegOrder',num2str(2*s+1),'=','NegOrderb',';'])
    s=s+1;
end
%%%��Ϊ����ֻ�ں�ÿ�����ж�Ӧ�Ľڵ㣬����ֻҪ�洢�ڵ���Ϣ����%%%
if mod(k,2)==1
    for i=(k-1):-1:(k-(k-1)/2)
        PosSaver{k-i,1}=eval(['PosOrder',num2str(i)]);
        i=i+1;
    end
    for j=(k-1):-1:(k-(k+1)/2)
        NegSaver{k-j,1}=eval(['NegOrder',num2str(j)]);
        j=j+1;
    end
elseif mod(k,2)==0
    for x=(k-1):-1:(k/2)
        PosSaver{k-x,1}=eval(['PosOrder',num2str(x)]);
        NegSaver{k-x,1}=eval(['NegOrder',num2str(x)]);
        x=x+1;
    end
end
for v=1:ceil(k/2)
    Saver{v,1}=NegSaver{v,1};
end
for b=1:floor(k/2)
    Saver{ceil(k/2)+b,1}=PosSaver{b,1};
end
end





