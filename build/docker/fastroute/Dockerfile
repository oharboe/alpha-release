# syntax = docker/dockerfile:1.0-experimental
FROM centos:centos6 as build
MAINTAINER Tutu Ajayi "ajayi@umich.edu"


# install gcc 6
RUN yum -y install centos-release-scl && \
    yum -y install devtoolset-6 devtoolset-6-libatomic-devel
ENV CC=/opt/rh/devtoolset-6/root/usr/bin/gcc \
    CPP=/opt/rh/devtoolset-6/root/usr/bin/cpp \
    CXX=/opt/rh/devtoolset-6/root/usr/bin/g++ \
    PATH=/opt/rh/devtoolset-6/root/usr/bin:$PATH \
    LD_LIBRARY_PATH=/opt/rh/devtoolset-6/root/usr/lib64:/opt/rh/devtoolset-6/root/usr/lib:/opt/rh/devtoolset-6/root/usr/lib64/dyninst:/opt/rh/devtoolset-6/root/usr/lib/dyninst:/opt/rh/devtoolset-6/root/usr/lib64:/opt/rh/devtoolset-6/root/usr/lib:$LD_LIBRARY_PATH

# Common development tools and libraries (kitchen sink approach)
RUN yum groupinstall -y "Development Tools" "Development Libraries"

RUN yum install -y wget rh-mongodb32-boost-devel rh-mongodb32-boost-static
ENV PATH=/opt/rh/rh-mongodb32/root/usr/bin:$PATH \
    LD_LIBRARY_PATH=/opt/rh/rh-mongodb32/root/usr/lib64:/opt/rh/rh-mongodb32/root/usr/lib:/opt/rh/rh-mongodb32/root/usr/lib64/dyninst:/opt/rh/rh-mongodb32/root/usr/lib/dyninst:/opt/rh/rh-mongodb32/root/usr/lib64:/opt/rh/rh-mongodb32/root/usr/lib:$LD_LIBRARY_PATH \
    C_INCLUDE_PATH=/opt/rh/rh-mongodb32/root/usr/include \
    CPLUS_INCLUDE_PATH=/opt/rh/rh-mongodb32/root/usr/include


RUN wget https://cmake.org/files/v3.9/cmake-3.9.0-Linux-x86_64.sh && \
    chmod +x cmake-3.9.0-Linux-x86_64.sh  && \
    ./cmake-3.9.0-Linux-x86_64.sh --skip-license --prefix=/usr/local


RUN yum install -y zlib-devel libpng-devel

RUN yum install -y install epel-release
RUN yum install -y  qt5-qtbase-devel


# download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN git clone https://github.com/The-OpenROAD-Project/FastRoute4-lefdef.git

# Build dependencies
#
# TODO once the duplicate source code and .a files are removed from the FastRoute4-lefdef
# git repository, we can remove the line below.
RUN rm -rf FastRoute4-lefdef/third_party/rsyn/lib && \
    rm -rf FastRoute4-lefdef/third_party/rsyn/include/lef && \
    rm -rf FastRoute4-lefdef/third_party/rsyn/include/def

# TODO update FastRoute4-lefdef, so that it can use the latest flute git repository
# RUN rm -rf FastRoute4-lefdef/third_party/rsyn/include/flute

RUN mkdir -p FastRoute4-lefdef/third_party/rsyn/lib/linux

# TODO we should be using the flute git repository
# RUN git clone https://github.com/The-OpenROAD-Project/flute.git
RUN cd FastRoute4-lefdef/third_party/rsyn/include/flute && \
    cmake -DCMAKE_BUILD_TYPE=Release . && \
    make && \
    cp libflute.a ../../lib/linux

RUN cd FastRoute4-lefdef/third_party/rsyn/include/liberty && \
    cmake -DCMAKE_BUILD_TYPE=Release . && \
    make && \
    cp libliberty.a ../../lib/linux

RUN git clone https://github.com/The-OpenROAD-Project/lef.git

RUN cd lef && \
    cmake -DCMAKE_BUILD_TYPE=Release . && \
    make && \
    cp lib/liblef.a ../FastRoute4-lefdef/third_party/rsyn/lib/linux

RUN git clone https://github.com/The-OpenROAD-Project/def.git

RUN cd def && \
    cmake -DCMAKE_BUILD_TYPE=Release . && \
    make && \
    cp lib/libdef.a ../FastRoute4-lefdef/third_party/rsyn/lib/linux


RUN cp -ra def/def FastRoute4-lefdef/third_party/rsyn/include/
RUN cp -ra lef/lef FastRoute4-lefdef/third_party/rsyn/include/

# TODO shouldn't FastRoute4-lefdef use the flute git repository?
# RUN cp -ra flute FastRoute4-lefdef/third_party/rsyn/include/

# The dependencies are built, time to build FastRoute4-lefdef itself.
RUN mkdir /FastRoute4-lefdef/build
WORKDIR /FastRoute4-lefdef/build

RUN cmake -DCMAKE_BUILD_TYPE=Release -DBOOST_ROOT=/opt/rh/rh-mongodb32/root/usr ..  && \
    make

RUN mkdir -p /build/bin/ && \
    cp /FastRoute4-lefdef/build/third_party/rsyn/bin/rsyn /build/bin/FRlefdef


RUN date +"Build Timestamp: %Y-%m-%d_%H-%M-%S" > /build/fastroute.version
RUN git rev-parse HEAD >> /build/fastroute.version
RUN tar -czf /build.tar.gz /build
