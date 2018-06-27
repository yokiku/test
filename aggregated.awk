
# 36列目に金額、37列目に数量がありそれを集計
for %d in (ORDER_?????????????0.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_uriage_sell.txt
for %d in (ORDER_?????????????1.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_henpin_sell.txt
for %d in (ORDER_?????????????2.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_uriage_used.txt
for %d in (ORDER_?????????????3.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0}{sum+=$36*$37}END{print FILENAME,sum}" "%d" >> 201801_henpin_used.txt

# 2列目がAAA-始まりのコードかつ、1列目が11の場合とそれ以外の12列目の合計をsum1とsum2に、AAA-以外の始まりのコードかつ、1列目が11の場合とそれ以外の12列目の合計をsum3とsum4に
for %d in (*.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum1=0;sum2=0;sum3=0;sum4=0;OFS="""\t"""}{if($1 !~ 11) {if($2 ~ /AAA-*/) sum1+=$12; else sum3+=$12} else if($2 ~ /AAA-*/) sum2+=$12; else sum4+=$12}END{print FILENAME,sum1,sum2,sum3,sum4}" "%d" >> 201801_uriage_henpin.txt" 

# "
# すべて""で囲まれているCSVの区分($1)が0か1かで売上と返品を判断。集計は10列目 * 11列目
for %d in (*.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F """,""" "BEGIN{sum=0;sum2=0}{if($13 ~ /^-/) sum2+=$12*$13; else sum+=$12*$13}END{print FILENAME,sum,sum2}" "%d" >> 201801_uriage_henpin.txt

# 2列目が0か0以外、10列目が1か1以外、の組み合わせで8列目と0列目をsumとsum2に集計
for %d in (*.csv) do C:\work\90_tools\gawk-mbcs-win32-20051223\gawk -F "," "BEGIN{sum=0;sum2=0}{if($2 !~ 0) if($10 !~ 1) sum+=$8*$9; else sum2+=$8*$9}END{print FILENAME,sum,sum2}" "%d" >> 201801_uriage_henpin.txt
