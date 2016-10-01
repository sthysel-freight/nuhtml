# https://validator.github.io/validator/
# docker run --rm -it -p 666:8888 sthysel/nuhtml

FROM java:8 

MAINTAINER sthysel <sthysel@gmail.com> 
ENV REFRESHED_AT 2016-10-01

# periphelia
RUN apt-get install -y --no-install-recommends \
      python \
      git

WORKDIR /validator

# why df do people in 2015 insist on re-implimenting 'make' ?
RUN git clone https://github.com/validator/validator.git && \
    cd validator && \
    python ./build/build.py update && \
    python ./build/build.py dldeps && \
    python ./build/build.py build && \
    python ./build/build.py jar

EXPOSE 8888

COPY ./validator.sh /
ENTRYPOINT ["/validator.sh"]
CMD ["serv"]
