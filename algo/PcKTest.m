%function [cit,sig]=PaCoTest(x, y, Z, alpha)
function ind = PcKTest(x, y, Z, alpha)
if isempty(Z) 
    ind1 = PaCoTest(x, y,[],alpha);
    if ind1 == false
        ind = false;
    else
        ind = KCIT(x, y, [],[]);
    end%�жϣ����x,y��������ô��ȥ��x��y�жϸ���Z��alphaʱ��ƫ�����
else
    ind1 = PaCoTest(x, y,Z,alpha);
    if ind1 == false
        ind = false;
    else %����x��y�жϸ���Z��alphaʱ��Ȼ��ƫ��أ���ô����KCIT���к˷�����CIT���Ӷ��жϳ�CI��
        ind = KCIT(x, y, Z,[]);
    end
end
%%%PcKTest�������һ��Logical����