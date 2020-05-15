#
# valley Backend whith Django
#

FROM python:3.6.5
ENV PYTHONUNBUFFERED 1
RUN mkdir /opt/valley
WORKDIR /opt/valley
ADD . /opt/valley
RUN pip install  --no-cache-dir -r requirements.txt
EXPOSE 8000
EXPOSE 8001
CMD ["python", "manage.py runserver 0.0.0.0:8001"]
