#
# Vert.x Dockerfile
#
#

# Pull base image.
FROM dockerfile/java

MAINTAINER Ragnar Johannesen <ragnar@post.au.dk>

# Install Vert.x
RUN apt-get install wget --no-install-recommends
RUN wget http://dl.bintray.com/vertx/downloads/vert.x-2.1.3.tar.gz -P /tmp
RUN tar zxf /tmp/vert.x-2.1.3.tar.gz -C /usr/local/
ENV PATH $PATH:/usr/local/vert.x-2.1.3/bin

# Add app
ADD app /root/app
ADD vertxrun.sh /root/

# Expose
EXPOSE 8080

# Run
CMD ["/root/vertxrun.sh"]
