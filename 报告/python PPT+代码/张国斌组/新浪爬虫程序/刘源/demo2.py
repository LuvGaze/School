import requests
from bs4 import BeautifulSoup
import chardet
import pandas as pd


def crawl_sina_finance_reports(pages=30):
    base_url = "https://stock.finance.sina.com.cn/stock/go.php/vReport_List/kind/lastest/index.phtml"
    reports = []
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}
    for page in range(1, pages + 1):
        url = f"{base_url}?p={page}"
        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()
        except requests.RequestException as e:
            print(f"请求错误: {e}")
            continue
        detected_encoding = chardet.detect(response.content)['encoding']
        if detected_encoding:
            response.encoding = detected_encoding
        else:
            response.encoding = 'GB2312'
        soup = BeautifulSoup(response.content, 'lxml')
        report_items = soup.find_all('tr')[1:]
        for item in report_items:
            columns = item.find_all('td')
            if len(columns) >= 4:
                title = columns[1].text.strip()
                kind = columns[2].text.strip()
                date = columns[3].text.strip()
                organization = columns[4].text.strip()
                reports.append([title, kind, date, organization])
    return reports


reports_data = crawl_sina_finance_reports()
df_reports = pd.DataFrame(reports_data, columns=["标题", '报告类型', "发布日期", "机构"])
print(df_reports)
