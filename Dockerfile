FROM python:3.6

#================================================
# Envs
#================================================
ENV PYTHONUNBUFFERED 1

#================================================
# App Code
#================================================
RUN mkdir /code
RUN mkdir /static
WORKDIR /code
#================================================
# Install Packages
#================================================
ADD ./requirements/base.txt .
RUN apt-get update -qqy && apt-get -qqy --no-install-recommends install \
  gettext
RUN pip install -r base.txt



ADD . /code/
RUN chmod +x /code/bin/*
ENV PATH "$PATH:/code/bin"
