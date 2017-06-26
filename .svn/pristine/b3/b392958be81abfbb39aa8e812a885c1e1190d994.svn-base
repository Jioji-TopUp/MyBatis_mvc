# coding=utf-8
from http.cookiejar import CookieJar
import time
import pymongo
from urllib.request import urlopen
import sys
from bs4 import BeautifulSoup as bs
import requests
import json
import re
import urllib.request
from lxml.etree import strip_tags
client = pymongo.MongoClient('192.168.3.59', 27017)
db = client.zykyImportData
collection = db.mongo_PythonConfigForm
def spider(url):
    try:
        res = urllib.request.Request(url, None)
        cj = CookieJar()
        opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
        response = opener.open(res)
        raw_response = response.read().decode('utf-8', errors='ignore')
        response.close()
    except urllib.request.HTTPError as inst:
        ouput = format(inst)
    # print(raw_response)
    return raw_response
def findkey(url):
    for onedocument in collection.find({"pythonurl": url}):
        # print(type(loc))
        # print(loc)
        url = onedocument['pythonurl']
        raw_response = spider(url)
        tags = onedocument['pythonkey']
        pythoncompanyid=onedocument['pythoncompanyid']
        pythoncompanyname=onedocument['pythoncompanyname']
        # print(type(tags))
        mcolumn = []
        for i in tags:
            righttag = i['rightTag']
            lefttag = i['leftTag']
            key = i['key']
            # print(righttag)
            # print(lefttag)
            result = re.findall(lefttag + '.*?' + righttag, raw_response, re.S)
            # print(title[0])
            # print(strip_tags(title[0]))
            for n in result:
                pattern = re.sub('<.*?>', '', n)
                pattern = re.sub('&.*?;', '', pattern)
                pattern = re.sub('\\n', '', pattern)
                pattern = re.sub('\\t', '', pattern)
                # print(pattern)
                value = {'columnvalue': pattern, 'columnname': key}
                # print(value)
                mcolumn.append(value.copy())
                # mcolumn.append(value.copy())
        posttime = str(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
        dict = {
            'companyid':pythoncompanyid,
            'companyname':pythoncompanyname,
            "url": url,
            "posttime": posttime,
            "mcolumn": mcolumn,
            "pseudodeletion":int(0)
        }
        #print(dict)
        # db=client.zykyImportData
        collection1 = db.mongo_CompanyData
        collection1.insert(dict)
    return pattern
if __name__ == '__main__':
    url=sys.argv[1]
    #url = "http://baike.baidu.com/link?url=GcWxgrJGT7-qJMcRAHvHlflUfvmE7KaP8tU2UNladqYaPGjjO5T3NB4_g5QjjHk_vjmtlU3gTK_F-IuNEnNR0a"
    spider(url)
    pattern = findkey(url)
    if pattern:
        print(1)
    else:
        print(0)
