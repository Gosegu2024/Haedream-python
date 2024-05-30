FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y openjdk-17-jdk python3 python3-pip

WORKDIR /app

COPY . /app

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

RUN apt-get update && apt-get install -y g++ default-jdk

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8008

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8008"]