---
layout: single
title:  "(외전) 1987년 블랙먼데이와 2020년 코로나19 금융지수 비교"
---

##### 2021.02.18


'87년 뉴욕 증권시장에서 일어난 주가 대폭락 사건(블랙먼데이) 와, 2020년 코로나19로 인한 주가 폭락을 그래프로 비교하고, 비교해본다. 
<br>또한 y축을 로그의 형태를 취해 표현하는 로그차트는 어떤 차이와 성질을 지니는지 관찰하고, 원인을 탐구한다.

[colab link](https://drive.google.com/file/d/1xqc8n67CJH0AfD2GoiQD3x2IQXKaB6qe/view?usp=sharing)
## 코드(참고용)


```python
import pandas as pd
import math
from pandas_datareader import data
from datetime import datetime, timedelta

def unix_date(date):
    epoch = datetime(1960, 1, 1)
    t = datetime.strptime(date,'%Y-%m-%d')
    diff = t-epoch
    return(diff.days * 24 * 3600 + diff.seconds)


start_day = unix_date('1960-01-01')
end_day = unix_date(datetime.today().strftime('%Y-%m-%d'))
print("1987년 블랙 먼데이와 2020년부터 진행중인 판데믹 상황의 미국 경제지수를 차트로 표현해주는 프로그랩입니다.")
period=int(input("주기를 입력하세요(1년: 240, 3년: 720): "))
index=input("S&P500 지수를 보려면 1을, 나스닥 지수를 보려면 2를 입력하세요: ")
if index=="1":
  Ticker='^GSPC'
elif index=="2":
  Ticker='^IXIC'

logyn=input("y축을 일반 차트로 보시려면 1, 로그 차트로 보시려면 2를 입력하세요: ")
if logyn=="1":
  logyn=False
elif logyn=="2":
  logyn=True

url = 'https://query1.finance.yahoo.com/v7/finance/download/' + Ticker + '?period1=' + str(start_day) + '&period2=' + str(end_day) +'&interval=1d&events=history'
asset = pd.read_csv(url, parse_dates=True, index_col='Date')

days = timedelta(days=period) # 1년(240), 3년(720)

# Black monday 1987-10-19
black_mondy = datetime(1987,10,19)
ts1 = asset[black_mondy - days:black_mondy + days]['Adj Close']

# Pandemic 2020-03-13
start = datetime(2020, 3, 13)
ts2 = asset[start - days:start + days]['Adj Close']
ts2.index = ts2.index.shift(-11837, freq='D')

df_plot = pd.DataFrame()
df_plot['1987 Black Monday'] = ts1
df_plot['2020 Pandemic'] = ts2
_ = df_plot.plot(secondary_y='2020 Pandemic', figsize=(14,8), logy=logyn)
```

위와 같이 코드를 짠 후, 실행해 그래프 x축 주기와 지수(^GSPC 등)을 선택하면<br>
'87-10-19 와 2020-03-13을 시작점으로 하는 두 그래프를 그려준다.

# 1년 주기 그래프
## S&P 500
<p align='center'>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/240-1-1.jpg"/>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/240-1-2.jpg"/></p>
<h2>NASDAQ</h2>
<p align='center'>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/240-2-1.jpg"/>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/240-2-2.jpg"/>
</p>


# 3년 주기 그래프
## S&P 500
<p align='center'>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/720-1-1.jpg"/>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/720-1-2.jpg"/></p>
<h2>NASDAQ</h2>
<p align='center'>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/720-2-1.jpg"/>
  <img src="https://raw.githubusercontent.com/Taek-2/taek2.ml/master/_posts/imgs/720-2-2.jpg"/>
</p>


# 결론 및 제언
