
FROM centos:latest
LABEL   "maintainer"="Hanmanth Reddy Patukuri"  "mail-id"="hpatukur@cisco.com"
RUN yum clean all && yum -y install epel-release ; yum install -y python python-pip python-devel gcc nginx && yum clean all ; systemctl enable nginx.service
COPY ["nginx.conf","/etc/nginx/nginx.conf"] 
ADD ["webapis","/webapis"]
COPY ["requirements.txt","webapis.ini","uwsgi.sh","/"]
RUN pip install -r /requirements.txt
RUN chmod +x /uwsgi.sh 
EXPOSE 80 443
ENTRYPOINT /uwsgi.sh
