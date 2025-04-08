import urllib
import json  # 处理json格式的数据
from bs4 import BeautifulSoup


def get_news():
    url = "https://news.sina.com.cn/china/"
    page = urllib.urlopen(url).read()
    soup = BeautifulSoup(page, 'html.parser')
    news_list = soup.find_all('div', class_='ct_t_01')
    news_data = []
    for index, news in enumerate(news_list[:20]):
        title = news.find('h1').get_text()
        href = news.find('a').get('href')
        news_data.append({'index': index + 1, 'title': title, 'href': href})
    return news_data


def get_news_content(news_url):
    page = urllib.urlopen(news_url).read()
    soup = BeautifulSoup(page, 'html.parser')
    content_div = soup.find('div', class_='article')
    paragraphs = content_div.find_all('p')
    content = " ".join([p.get_text() for p in paragraphs])
    return content


news_data = get_news()
for news in news_data:
    print(news['index'], news['title'])

selected_news_index = 5
selected_news_url = news_data[selected_news_index - 1]['href']
content = get_news_content(selected_news_url)
print(content)