FROM ubuntu:16.04
RUN apt-get update
RUN apt-get update && apt-get install -y \
  default-jre \
  default-jdk \
  git \
  maven \
  cucumber

RUN mvn -version
RUN git clone https://github.com/bongadub/Rest-Assured.git
CMD ls
CMD ls
EXPOSE 8080
RUN cd Rest-Assured && mvn test
CMD ["mvn"] 
