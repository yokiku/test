'''
MySQLにデータが登録されたらログに吐く処理
'''

import MySQLdb
import pprint as pp
import datetime

with open("C:\\Users\\hoge\\Documents\\py\\test\\test_01.log", "a") as f:
    print(str(datetime.datetime.now()) + ' 処理開始します', file=f)

# ユーザ、パスワード、DBは適時変更
con = MySQLdb.connect(
    host='localhost', user='hoge', passwd='$hogehoge$', db='test', charset='utf8')
#cur= con.cursor()
cur= con.cursor(MySQLdb.cursors.DictCursor)

"""
sql = "select * from test.TEST"
cur.execute(sql)
rows = cur.fetchall()
for row in rows:
    print(row)
"""

sql = "select * from test.TEST where upd_date >= (NOW() - INTERVAL 5 HOUR)"
cur.execute(sql)
for row in cur.fetchall():
    #print(row['batch_id'], row['property_key'])
    #print(row)
    #pp.pprint(row)
    with open("C:\\Users\\hoge\\Documents\\py\\test\\test_01.log", "a") as f:
        #print(row, file=f)
        #print(str(datetime.datetime.now()) + str(row), file=f)
        pp.pprint(row, stream=f)
        #print(str(datetime.datetime.now()) + str(row), stream=f)

cur.close
con.close
