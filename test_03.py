'''
slackに流す処理
'''

import pprint as pp
import datetime
import requests
import json

class slackSend:
    word = "test7"

    def __init__(self):
        # 先頭にアンダースコア2つつけると外部の参照が不可となる
        #self.__f = open("C:\\Users\\hoge\\Documents\\py\\test\\test_03.log", "a")
        #print(str(datetime.datetime.now()) + ' 処理開始します', file=self.__f)
        self.f = open("C:\\Users\\hoge\\Documents\\py\\test\\test_03.log", "a")
        print(str(datetime.datetime.now()) + ' 処理開始します', file=self.f)
        self.name1='hoge'

    def sent(self,txt):
        # slackにそのまま通知
        r = requests.post('Webhook URLをここに設定', data = json.dumps({
            # textに@xxxで設定、link_names=1にしてもメンション扱いにならない
            #'text': u'test8', # 投稿するテキスト
            #'text': u'@here ' + txt, # 投稿するテキスト ⇒ これはメンションつく
            'text': txt, # 投稿するテキスト

            #'text': u'@hoge test8', # 投稿するテキスト ⇒ これはメンションつかない。ユーザだとNG？
            #'text': '<!hoge>' + ' ' + word, # 投稿するテキスト ⇒ NG

            'username': u'webhook', # 投稿のユーザー名
            'icon_emoji': u':joy:', # 投稿のプロフィール画像に入れる絵文字
            'link_names': 1, # メンションを有効にする
        }))
        #print(r, file=self.__f)
        print(r, file=self.f)

    def close(self):
        #self.__f.close
        self.f.close

a = slackSend()
txt='test14'
a.sent(txt)
a.sent('@here ' + txt)
a.sent('<@xxxxx> ' + txt) # ユーザへのメンションはユーザネームでなくユーザIDを指定（これを送ると@hoge宛てになる）
print(a.name1, file=a.f)
#print(a.name1, file=a.__f) # これは通らない
a.close()
