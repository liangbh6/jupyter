clear;clc
%read the data gene_info
num=cell(1,300);
 for i=1:300
   t=strcat('gene_',num2str(i),'.dat');
   num{i}=t;
 end
gcell=cell(1,300);
for i=1:300
    temp=['gene_',num2str(i),'.dat'];
    gcell{i}=textread(temp,'%s');
end

%find and record the location of targeted gene
gcell{301}=[0];
cell{301}=[0];
snpcell={'rs2273298','rs7522344','rs17160824','rs7522712','rs12128253','rs4845907','rs1201394','rs11582200','rs2788891','rs2294811'};
n=10;
Gene=zeros(3,10);flag=0;%flag标记找到第flag个位点
for i=1:300
    t=length(gcell{i});
      for j=1:t
           for m=1:n
              if strcmp(gcell{i}(j),snpcell{m})
                  flag=flag+1;
                  Gene(1,flag)=m;%Gene的第一行标记需要找的第几个位点，第二行是标记基因集，第三行标记位点在基因集的第几行
                  Gene(2,flag)=i;
                  Gene(3,flag)=j;
              end
          end
      end
end

Gene_1=cell(1,10);
for k=1:10
    for j=1:10
        if k==Gene(1,j)
            Gene_1{k}={snpcell{k};Gene(2,j);Gene(3,j)};
        end
    end
end

    
    