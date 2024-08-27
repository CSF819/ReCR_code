function [Score] = PC_New(data,skeleton)
n = size(skeleton,1);
Cskeleton=zeros(n,n);%Cskeleton��ʼ��Ϊ��skeletonά����ͬ��0����
for i= 1:(n-1)
    lab = i;
    pc = [];
    for j = i+1:n
        flag = true;
        if PcKTest(data(:,i), data(:,j),[],0.05)%dataΪSEMdataGenerater���ɵ�double����
            break;
        else
            temp = (1:n);
            temp([i,j])=[];%s.t.temp�ĵ�i���͵�j��Ԫ��Ϊ�գ���ôtemp�ĳ��Ȼ����
            for k=1:length(temp)
                x = data(:,i);
                y = data(:,j);
                z = data(:, temp(k));
                if PcKTest(x, y,z,0.05)
                    flag = false;
                    break;
                end
            end
        end        %%��һ��֤����������
        if flag == true
            pc = unique([pc,j]);%unique�ҳ����ظ���ֵ
        end
    end
    len=length(pc);
    for w = 1:len
        Cskeleton(lab,pc(w))=1;
        Cskeleton(pc(w),lab)=1;
    end
end
Score = ScoreSkeleton(Cskeleton,skeleton);