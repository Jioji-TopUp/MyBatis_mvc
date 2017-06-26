# -*- coding:utf-8 -*-
import os
import jieba
import nltk
import string
import time
import pymongo
import sys
import re

dictionary = {}  # 空字典 用于保存最终的词频
stopwords = ['、', '（', '）', '，', '。', '：', '“', '”', '\n\u3000', '\u3000', '的', '‘', '’','','\\n',
             '\\n–','\n','-','{','}','\'','=','.',':','[',']','#','\\','0','+','<','>','|',',','/','·','"','n']  # 停用词



class DIC(object):
    def __init__(self, string,count):
        self.string = string
        self.count = count

    def toString(self):
        return "{\"name\":\""+self.string+"\",\"value\":"+str(self.count)+"},"



#text = open(fp,encoding='utf-8').read()  # 读文本内容

fp=sys.argv[1]
#fp=('C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\zykyDemo\\page\\plugins\\fullavatareditor\\python\\a.txt')



text = open(fp,'rb').read()





for c in string.punctuation:
    text = text.replace(c,"")
    text = text.replace("，","")
    text = text.replace("“", "")
    text = text.replace("”", "")
    text = text.replace("：", "")
    text = text.replace("。", "")
text = jieba.cut(text)
text =' '.join(text)
fredist = nltk.FreqDist(text.split(' '))  # 获取单文件词频


list = []




for item in fredist.keys():
    if item in stopwords:
        continue
    list.append(DIC(item,fredist[item]))

list.sort(key=lambda DIC:DIC.count,reverse = True)

all_data  = ""
j = 0
for i in list:
    if(j>20):
        break
    else:
        j+=1
    all_data+=i.toString()

temptime = time.strftime("%Y-%m-%d %X ")
conn = pymongo.MongoClient('192.168.3.59',27017)
db = conn.zykyImportData
mongo_pdf = db.mongo_pdf
new_post = {"TYPE":"PDF",'date':all_data,"TIME":temptime}
mongo_pdf.insert(new_post)
print(temptime)
