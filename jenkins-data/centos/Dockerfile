FROM centos

RUN yum -y install openssh-server
RUN yum -y install passwd

RUN useradd remote_user && \
  echo "1234" | passwd remote_user --stdin && \
  mkdir /home/remote_user/.ssh && \
  chmod 700 /home/remote_user/.ssh
  
COPY ./remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN  chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
     chmod 600 /home/remote_user/.ssh/authorized_keys

EXPOSE 22
RUN rm -rf /run/nologin

RUN ssh-keygen -A

RUN yum -y install mysql 

RUN yum -y install python36

RUN yum update -y && yum install -y \
                    curl \
                    which && \
    yum clean all

RUN curl -sSL https://sdk.cloud.google.com | bash

ENV PATH $PATH:/root/google-cloud-sdk/bin

CMD /usr/sbin/sshd -D






