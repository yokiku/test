
# 36��ڂɋ��z�A37��ڂɐ��ʂ����肻����W�v
for %d in (ORDER_?????????????0.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_uriage_sell.txt
for %d in (ORDER_?????????????1.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_henpin_sell.txt
for %d in (ORDER_?????????????2.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_uriage_used.txt
for %d in (ORDER_?????????????3.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_henpin_used.txt

# 2��ڂ�AAA-�n�܂�̃R�[�h���A1��ڂ�11�̏ꍇ�Ƃ���ȊO��12��ڂ̍��v��sum1��sum2�ɁAAAA-�ȊO�̎n�܂�̃R�[�h���A1��ڂ�11�̏ꍇ�Ƃ���ȊO��12��ڂ̍��v��sum3��sum4��
for %d in (*.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum1=0;sum2=0;sum3=0;sum4=0;OFS="""\t"""}{if($1 !~ 11) {if($2 ~ /AAA-*/) sum1+=$12; else sum3+=$12} else if($2 ~ /AAA-*/) sum2+=$12; else sum4+=$12}END{print FILENAME,sum1,sum2,sum3,sum4}" "%d" >> 201801_uriage_henpin.txt" 

# ���ׂ�""�ň͂܂�Ă���CSV�̋敪($1)��0��1���Ŕ���ƕԕi�𔻒f�B�W�v��10��� * 11���
for %d in (*.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F """,""" "BEGIN{sum=0;sum2=0}{if($13 ~ /^-/) sum2+=$12*$13; else sum+=$12*$13}END{print FILENAME,sum,sum2}" "%d" >> 201801_uriage_henpin.txt

