FROM ubuntu:16.04
USER root
RUN apt-get update
RUN apt-get update && apt-get install -y \
  default-jre \
  default-jdk \
  git \
  maven

# Install Cucumber
RUN pip install cucumber -v 2.4.0

# Install Rest-Assured
RUN pip -y groupinstall 'Development Tools' \
    && pip install rest-assured \
    && yum clean -y all

#Get Certs
ADD containers/cicd/certificates/pem/ /etc/pki/ca-trust/source/anchors/
RUN ls /etc/pki/ca-trust/source/anchors/
RUN mvn -version
RUN git clone https://github.com/bongadub/Rest-Assured.git
CMD ls
CMD ls

RUN cd Rest-Assured && mvn test
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]