#Base Image
FROM ubuntu 
LABEL version="latest" maintainer="Mohini Upasani"
#Update the Image
RUN apt-get update
#Install Python
RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y curl
#Install Robot Framework
RUN pip3 install robotframework
RUN pip3 install robotframework-seleniumlibrary
RUN pip3 install robotframework-selenium2library
RUN pip3 install jq
#RUN apt-get install -y firefox
#RUN apt-get install -y xvfb
RUN apt-get install -y curl
#The following are needed for chrome & chrome driver installation
RUN apt-get install -y xvfb
RUN apt-get install -y zip
RUN apt-get install -y wget
RUN apt-get install ca-certificates
RUN pip3 install robotframework-selenium2library
#RUN apt-get install -y libnss3-dev libasound2 libxssl libappindicator3-1 libindicator7 gconf-service 
#RUN pip3 install -U pip3
COPY run_tests.sh run_tests.sh 
COPY requirements.txt /tmp/requirements.txt
COPY gecho.sh /tmp/gecho.sh
RUN /tmp/gecho.sh
COPY myFirstTest.robot /myFirstTest.robot
RUN  pip3 install -r /tmp/requirements.txt
RUN pip3 install webdrivermanager
RUN webdrivermanager firefox chrome --linkpath /usr/local/bin
#RUN wget –no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN dpkg –install google-chrome-stable_current_amd64.deb; apt-get –fix-broken –assume-yes install
RUN CHROMEDRIVER_VERSION=`wget --no-verbose --output-document - https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget --no-verbose --output-document /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver && \
    chmod +x /opt/chromedriver/chromedriver && \
    ln -fs /opt/chromedriver/chromedriver /usr/local/bin/chromedriver
#ENTRYPOINT [‘/run_tests.sh’]

