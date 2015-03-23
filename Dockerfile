FROM python:2.7.8

MAINTAINER Matthew R Hanlon <mrhanlon@gmail.com>

# install supervisor
RUN apt-get update && \
    apt-get install -y supervisor

# install uwsgi
RUN pip install uwsgi

# copy app
COPY example /example

WORKDIR /example

# install app requirements
RUN pip install -r requirements.txt

RUN ln -s /example/config/supervisor_app.conf /etc/supervisor/conf.d/

EXPOSE 3031
CMD ["supervisord", "-n"]
