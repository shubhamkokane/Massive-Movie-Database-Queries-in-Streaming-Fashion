import json
import requests
from flask import Flask
from bs4 import BeautifulSoup

app = Flask(__name__)
url = "http://localhost:8088/query/"
headers = {'Content-type': 'application/json', 'Accept': 'application/vnd.ksql.v1+json'}


@app.route('/tid/<tConsts>')
def title_query(tConsts):
    list = []
    for tConst in tConsts.split(","):
        sql = f"SELECT tconst FROM FF WHERE tconst LIKE '%{tConst}%';"
        print(sql)
        data = {"ksql": sql, "streamsProperties": {}}
        r = requests.post(url, data=json.dumps(data), headers=headers)
        responseText = r.text
        index = responseText.find("tt00")
        print(index)
        tconst = r.text[index: index + 9]
        imdbUrl = f"https://www.imdb.com/title/{tconst}/"
        headers2 = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36'
        }
        imdbResponse = requests.get(imdbUrl, headers=headers2, allow_redirects=True)
        html_text = imdbResponse.text
        soup = BeautifulSoup(html_text, "html.parser")
        list.append(soup.find_all("h1")[0])
        for link in soup.find_all('a'):
            print(link.get('href'))

    return "<h1>Movie title(s):</h1><br>" + str(list)


@app.route('/actor/<actorName>')
def actor_query(actorName):
    sql = f"SELECT tconst FROM FF WHERE pr  imaryName LIKE '%{actorName}%';"
    print(sql)
    data = {"ksql": sql, "streamsProperties": {}}
    r = requests.post(url, data=json.dumps(data), headers=headers)
    return f'{r.text}!'


if __name__ == '__main__':
    app.run(port=8888, debug=True)
