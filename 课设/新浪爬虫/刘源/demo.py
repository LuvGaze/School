import requests  # 导入用于发送HTTP请求的requests库
from lxml import etree  # 导入用于解析HTML或XML文档的etree模块

# 设置HTTP请求头信息，模拟浏览器访问
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'
}


def get_sina_news_search():
    what = input("请输入你想查询的新浪新闻：")  # 获取用户想要查询的关键词

    for i in range(1):  # 这里只循环一次，代表只抓取第一页的结果
        # 根据输入的关键词构建搜索URL
        url = 'https://search.sina.com.cn/?q={}&c=news&from=channel&range=all&size=10&dpc=0&ps=0&pf=0&page={}'.format(
            what, i + 1)  # 注意：页面索引通常从1开始

        rs = requests.session()  # 创建一个session对象，可以保存某些参数在整个会话中
        r = rs.get(url, headers=headers)  # 发送GET请求获取网页内容
        r.encoding = 'utf-8'  # 指定编码为UTF-8以正确显示中文字符

        trees = etree.HTML(r.text)  # 将HTML文本解析为HTML文档对象

        # 遍历每一条搜索结果，这里假设每页有22个结果，去掉顶部广告等非结果项
        for j in range(4, 22):
            # 抓取标题，注意XPath表达式中的括号应为方括号[]
            title1 = trees.xpath('//*[@id="result"]/div[{}]/h2/a/text()[1]'.format(j))
            title2 = trees.xpath('//*[@id="result"]/div[{}]/h2/a/text()[2]'.format(j))

            # 如果存在第二个文本节点，则拼接两个部分；否则只打印第一个部分
            if title2:
                print(title1[0] + what + title2[0])
            else:
                print(what + title1[0] if title1 else "Title not found")

            # 抓取链接并打印
            link = trees.xpath('//*[@id="result"]/div[{}]/h2/a/@href'.format(j))
            print(link if link else "Link not found")

            # 抓取来源信息
            from_ = trees.xpath('//*[@id="result"]/div[{}]/h2/span/text()'.format(j))
            print(from_ if from_ else "Source not found")

            # 抓取摘要信息，注意XPath表达式中的括号应为方括号[]
            comment = trees.xpath('//*[@id="result"]/div[{}]/div[2]/p/text()'.format(j))
            print(comment if comment else "Comment not found")

            print(' ')  # 打印空行分隔不同新闻条目


get_sina_news_search()
