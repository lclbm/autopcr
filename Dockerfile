FROM python:3.10-slim

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

COPY autopcr autopcr/

COPY cache cache/

COPY data data/

COPY result result/

COPY *.py ./

RUN python _download_web.py

VOLUME ["/code/cache", "/code/data", "/code/result"]

EXPOSE 13200

CMD ["python", "_httpserver_test.py"]