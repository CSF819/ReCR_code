function [skeleton,names2] = readRnet(file)
fid=fopen(file);%���ļ�
%%%%%%%%%%%%%%%%%%%%��Ҫ�ڵ�������ʼ��skeleton%%%%%%%%%%%%%%%%%
k=0;
while ~feof(fid)
    tline=fgets(fid);% ���ļ�����һ���ı��������س�����
    tline= strrep(tline,'''','');%��tline�еĵ������滻��''
    if ~isempty(tline) % �ж��Ƿ����
        [~,n]=size(tline); %������ǵĻ�����ֵ
        if n>=4
            yuchu = tline(1,1:end);%���n>=4����yuchu��ֵΪtline�ĵ�һ��
            pi=yuchu(1,1:4);%pi��ֵΪyuchu�ĵ�һ��ǰ����
            if strcmp(pi,'node')==1
                k=k+1;
            end  %��pi=='node'ʱ��k=k+1
        end
    end
    stop='potential';
    if  regexpi(yuchu,stop)  %��yuchu�г�����stop����ô����ѭ��
        break
    end
end
skeleton=zeros(k,k); %��ʼ��skeletonΪ0����
%%%��һ������Ҫ���ܾ���ȷ��skeleton��ά��������ʵά�����������ļ���node����Ŀ%%%
%%%%%%%%%%%%%%%%%%%���ڵ�����%%%%%%%%%%%%%%%%%
j=0;
frewind(fid) %ָ���Ƶ�ǰͷ
while ~feof(fid)%�ж�fid�Ƿ�Ϊ����ָʾ��
    tline=fgets(fid);% ���ļ�����һ���ı��������س�����
    tline= strrep(tline,'''',''); %��tline�еĵ�����ɾ��
    [~,n]=size(tline);%~��ʾ֮�󲻻�ʹ�������������ֻ��size(tline)��ֵ��n
    pipei=tline(1,1:end);%д��tline�ĵ�һ������Ԫ��
    stop='potential';
    if  regexpi(pipei,stop)
        break
    end   %���pipei���г��֡�potential����������whileѭ��
    if n>=4
        yuchu=tline(1,1:end);
        pa='node.*';
        out=regexp(yuchu,pa,'match');%outΪyuchu�����о���node.ǰ׺���ַ���ֵ
        if ~isempty(out)
            j=j+1;
            A = char(out); %AΪout���ַ�������
            A=strrep(A,' ','');
            A=strrep(A,' ','');
            A=strrep(A,' ','');
            names{j}=strrep(A,'node','');%ȥ��nodeֻ����׺
        end
    end
end
for k = 1:size(names,2)
    names2{k} = names{k}(1:end-1);
end
%%%����nodeǰ׺��Ԫ�ؼ�¼��������%%%
%%%%%%%%%%%%%%%%%%%����sketelon���%%%%%%%%%%%%%%%%%
frewind(fid)
while ~feof(fid)
    tline=fgets(fid);% ���ļ�����һ���ı��������س�����
    tline= strrep(tline,'''','');
    [~,n]=size(tline);
    
    if n>=2
        yuchu=tline(1,1:end);
        p='potential';
        if regexpi(yuchu,p)
            pa='\|.*\w';%���ڵ㣬\|��ʾ�ַ�|��.Ϊͨ�����ʾ���ùܵ��ַ�����*��ʾ��ƥ�����õı�׼�ַ�������0�λ���࣬\w��ʾƥ������ĵ��������ַ�
            A=regexp(yuchu,pa,'match');
            A=strrep(A,'| ','');
            A= regexp(A,'\s+','split');%\s ƥ������ĵ����հ��ַ�
            if ~isempty(A)
                A=A{1};
            end
            pa='potential.*\|';
            B=regexp(yuchu,pa,'match');
            B=strrep(B,'potential','');
            B=strrep(B,'(','');
            B=strrep(B,' ','');
            B=strrep(B,'|','');
            len=length(A);
            for n=1:len
                if ~isempty(A{n})
                    inda=strcmp(names2,A{n});
                    f= inda==1;
                    indb=strcmp(names2,B);
                    z= indb==1;
                    skeleton(f,z)=1;
                end
            end
        end
    end
end
fclose(fid);
end
%%%node֮����potential��ϵʱ�������ӦԪ��Ϊ1������Ϊ0