import json  # 处理json格式的数据
import urllib.request

from bs4 import BeautifulSoup  # 导入类

# 读取新浪国内新闻数据
url = 'https://feed.sina.com.cn/api/roll/get?pageid=121&lid=1356&num=20&versionNumber=1.2.4&page=1&encode=utf-8&callback=feedCardJsonpCallback&_=1732874109758'
res = urllib.request.urlopen(url).read().decode("utf-8")  # 打开和读取url返回bytes对象转换为字符串（解码为utf-8）

# 解析Json
res = res.split("try{feedCardJsonpCallback(")[1].split(");}catch(e){};")[0]  # split函数用来分离字符串
jsonData = json.loads(res)  # 将其他类型的对象转换为python对象

# 抓取数据
newslist = []  # 创建列表以存放数据
for ent in jsonData['result']['data']:  # 通过遍历获取数据

    # 读取详情页
    restemp = urllib.request.urlopen(ent['url']).read()
    soup = BeautifulSoup(restemp, 'html.parser')  # 解析restemp

    newstemp = {}
    # 解析新闻标题
    newstemp['title'] = soup.select('.main-title')[0].text  # 通过标签名查找标题（文本形式）
    # 解析新闻内容
    newstemp['article'] = soup.select('#article')[0].text  # 通过ccs id选择器查找

    # 存入数组
    newslist.append(newstemp)  # 向列表末尾添加函数

# 打印所有新闻标题
num = 0  # 新闻序号
print('新闻标题：')
for news in newslist:
    num += 1
    print(f'{num}： ', end='')
    print(news['title'])

# 打印所需新闻条数
for i in range(10):
    print('  ')
    print('  ')
    print(f'第{i + 1}条新闻是：')
    print('新闻详情：', newslist[i]['article'])
