char_array = ['fyc_00_';'hy_00_ ';'ljg_00_';'lqf_00_';'lsl_00_';'ml_00_ ';'nhz_00_';'rj_00_ ';'syj_00_';'wl_00_ ';'wq_00_ ';'wyc_00_';'xch_00_';'xxj_00_';'yjf_00_';'zc_00_ ';'zdx_00_';'zjg_00_';'zl_00_ ';'zyf_00_'];
str_array = cellstr(char_array);
num=1;
num_str = num2str(num);
const_str = '/*.png';
for i =1:20,
   final_str = strcat(str_array(i),num_str,const_str);
   c = char(final_str);
   d = dir(fullfile(c));
   length1 = length(d);
   cd_cell = strcat(str_array(i),num_str);
   cd_str = char(cd_cell);
   cd(cd_str);
   for j = 1:length1,
   BW = imread(d(j).name);
   [sumc(i,j),thetac(i,j)] = disym(BW);
   %disp(j);
   
    
   end
cd('..')  
 disp(i)
end
%final_str = final_str';

