import json  # 导入用于处理JSON数据的模块。
import os  # 导入用于与操作系统进行交互的模块，如创建目录等。
import urllib.request  # 导入用于发起HTTP请求的模块。
import webbrowser  # 导入用于在默认浏览器中打开网页的模块。

from bs4 import BeautifulSoup  # 导入BeautifulSoup库，用于解析HTML文档。



# 定义一个URL字符串，指向新浪网的API接口，用于获取国内新闻数据。
url = 'https://feed.sina.com.cn/api/roll/get?pageid=121&lid=1356&num=20&versionNumber=1.2.4&page=1&encode=utf-8&callback=feedCardJsonpCallback&_=1701244697056'
response = urllib.request.urlopen(url).read().decode("utf-8")  # 使用urllib发起GET请求并读取响应内容，然后将其解码为UTF-8格式的字符串。

# 解析从新浪网API得到的JSONP响应，提取出实际的JSON部分。
response = response.split("try{feedCardJsonpCallback(")[1].split(");}catch(e){};")[0]  # 截取JSONP回调函数中的有效JSON数据。
jsonData = json.loads(response)  # 将截取后的JSON字符串转换为Python字典对象。

# 创建一个空列表newslist来存储每篇新闻的信息。
newslist = []
for entry in jsonData['result']['data']:  # 遍历从JSON数据中提取的'结果'下的'data'数组，其中包含每条新闻的元信息。
    restemp = urllib.request.urlopen(entry['url']).read()  # 对每条新闻详情页发送GET请求并读取响应内容。
    soup = BeautifulSoup(restemp, 'html.parser')  # 使用BeautifulSoup解析新闻详情页的HTML内容。

    # 构造一个新的字典newstemp以存储当前遍历到的新闻标题、正文和链接。
    newstemp = {
        'title': soup.select('.main-title')[0].text.strip() if soup.select('.main-title') else "Title not found",
        # 尝试获取新闻标题，如果不存在则返回"Title not found"。
        'article': soup.select('#article')[0].text.strip() if soup.select('#article') else "Article not found",
        # 尝试获取新闻正文，如果不存在则返回"Article not found"。
        'link': entry['url']  # 存储新闻的原始链接。
    }

    newslist.append(newstemp)  # 将newstemp字典添加到newslist列表中。

# 打印第一条新闻的详细内容（即文章正文）。
print('新闻详情：', newslist[0]['article'])
print('  ')  # 打印两个换行符，用于分隔输出。

# 打印所有新闻的标题、链接及其序号。
print('新闻列表：')
for index, news in enumerate(newslist, start=1):  # 遍历newslist列表，同时使用enumerate函数为每条新闻生成序号。
    link = news['link']
    if not link.startswith('http'):  # 如果链接不是以'http'开头，则认为是相对路径，需要补充协议头。
        link = 'https://' + link  # 确保链接是完整的URL。
    print(f"序号: {index}\n标题: {news['title']}\n链接: {link}\n")  # 格式化打印新闻序号、标题和链接。

print('\n')  # 打印一个换行符，用于分隔输出。


def open_news_by_index():
    while True:  # 开始一个无限循环，直到用户输入'q'退出。
        try:
            choice = input("请输入要打开的新闻序号 (或输入'q'退出): ")  # 提示用户输入想要打开的新闻序号。
            if choice.lower() == 'q':  # 如果用户输入的是'q'，则退出程序。
                print("退出程序。")
                break
            choice = int(choice)  # 将用户输入转换为整数。
            if 0 < choice <= len(newslist):  # 检查用户输入是否是一个有效的新闻序号。
                link = newslist[choice - 1]['link']  # 根据用户选择的序号找到对应的新闻链接。
                if not link.startswith('http'):  # 再次检查链接完整性。
                    link = 'https://' + link
                print(f"正在打开链接: {link}")  # 打印即将打开的链接。
                webbrowser.open(link)  # 在默认浏览器中打开选择的新闻链接。
            else:
                print("无效的序号，请重新输入。")  # 如果用户输入的序号不在范围内，则提示重新输入。
        except ValueError:  # 捕获值错误异常，例如用户输入了非数字字符。
            print("请输入有效的数字序号或'q'退出。")


# 调用open_news_by_index函数以允许用户选择新闻序号并打开链接。
open_news_by_index()

# 写出所有新闻到py脚本文件目录下的news文件夹内。
path = os.path.dirname(__file__) + '\\news\\'  # 获取当前Python脚本所在路径，并指定子文件夹名。
if not os.path.exists(path):  # 检查指定路径是否存在。
    os.mkdir(path)  # 如果不存在，则创建该文件夹。

for index, news in enumerate(newslist, start=1):  # 再次遍历newslist列表，为每条新闻创建一个文本文件。
    # 清理标题以适合作为文件名，避免非法字符导致错误。
    safe_title = "".join([c if c.isalnum() or c in (' ', '.', '_') else '_' for c in news['title']])

    with open(os.path.join(path, f"{index}_{safe_title}.txt"), "w", encoding='utf-8') as file:  # 创建或覆盖写入文件。
        file.write(f"序号: {index}\n")  # 写入新闻序号。
        file.write(f"标题: {news['title']}\n")  # 写入新闻标题。
        file.write(f"链接: {news['link']}\n\n")  # 写入新闻链接，并加两个换行符。
        file.write(news['article'])  # 写入新闻正文。

print("所有新闻已成功保存至本地，并带有序号。")  # 告知用户所有新闻已经保存完成。
