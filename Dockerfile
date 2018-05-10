FROM registry.access.redhat.com/rhel7/rhel
MAINTAINER brault <brault@redhat.com>

# Set license / Image must include Partner’s software terms and conditions
RUN mkdir -p  /licenses
RUN echo "Partner's term and conditions listd here" > /licenses/TERMS.TXT
# Add Web server, update image, and clear cache
RUN yum -y install httpd && yum -y update; yum clean all
# Add some data to web server
RUN mkdir -p /var/www/html/
RUN echo "This Web server is working." >> /var/www/html/index.html
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
