# coding=utf-8
import pymongo
import requests
import re

import time
from bs4 import BeautifulSoup as bs


class CompanyData(object):
    client = pymongo.MongoClient('192.168.3.59')
    db = client['zykyImportData']

    def get_html(self, url, company_name):
        try:
            res = requests.get(url)
            return res.text.encode(res.encoding).decode('utf-8')
        except:
            print(company_name, "：错误")
            return

    def get_item(self):
        items = self.db['mongo_PythonConfigForm'].find()
        for data in items:
            if data['pythonstate'] != 1:
                continue

            url = data['pythonurl']
            company_name = data['pythoncompanyname']
            html = self.get_html(url, company_name)
            if not html:
                continue

            list_tags = data['pythonkey']
            len_tag = len(list_tags)

            item_values_list = []
            item = {}

            for idx in range(len_tag):
                item_values = {}
                label = list_tags[idx]['key']
                starter = list_tags[idx]['leftTag']

                ender = list_tags[idx]['rightTag']
                pattern = "{start}(.+){end}".format(start=starter, end=ender)
                res = re.search(pattern, html, re.S)
                if res:
                    content = res.group(1)
                    content = self.del_html(content)
                    content = re.sub('\t|\n', '', content)

                    item_values['columnvalue'] = content
                    item_values['columnname'] = label
                    item_values_list.append(item_values)
                else:
                    print(company_name, '：标签匹配不成功')

            item['mcolumn'] = item_values_list
            item['url'] = url
            item['posttime'] = str(time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))
            item['pseudodeletion'] = int(0)
            item['companyid'] = data['pythoncompanyid']
            item['companyname'] = data['pythoncompanyname']

            yield item
        return

    def in_mongo(self):
        items = self.get_item()
        if items:
            for item in items:
                self.db['mongo_CompanyData'].insert_one(item)

    def up_mongo(self):
        items = self.get_item()
        if items:
            for item in items:
                self.mupdate(item)

    def mupdate(self, item):
        item = item
        result_items = self.db['mongo_CompanyData'].find()
        for result_item in result_items:
            if item['url'] == result_item['url']:

                def columnname(s):
                    return s['columnname']

                if len(item['mcolumn']) == len(result_item['mcolumn']):
                    i = sorted(item['mcolumn'], key=columnname)
                    r_i = sorted(result_item['mcolumn'], key=columnname)
                    if i == r_i:
                        return
                else:
                    continue
            else:
                continue

        print(item['companyname'], "：入库成功")
        self.db['mongo_CompanyData'].insert_one(item)

    def del_html(self, html):
        soup = bs(html, 'html.parser')
        return soup.get_text()


if __name__ == '__main__':
    CD = CompanyData()
    CD.up_mongo()
