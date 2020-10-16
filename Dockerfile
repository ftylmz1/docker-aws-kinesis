FROM openjdk:8
RUN apt-get update && \
apt-get install zip && \
curl -LO https://github.com/awslabs/amazon-kinesis-agent/archive/1.2.zip && \
curl -LO https://kozyatagi.mirror.guzel.net.tr/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip &&\
unzip 1.2.zip && \
unzip apache-maven-3.6.3-bin.zip && \
rm 1.2.zip && \
rm apache-maven-3.6.3-bin.zip && \
mv amazon-kinesis-agent-1.2 amazon-kinesis-agent && \
mv apache-maven-3.6.3 /opt/apache-maven
RUN PATH="/opt/apache-maven/bin:$PATH" && \
cd amazon-kinesis-agent && \
./setup --install
